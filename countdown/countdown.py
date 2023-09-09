#!/usr/bin/env python3

from argparse import ArgumentParser, Namespace
from dataclasses import dataclass
import re
from typing import Generator

from datetime import date as Date, datetime as Datetime
from pathlib import Path


@dataclass(frozen=True)
class Category:
    name: str = ''
    style: str = ''

    @classmethod
    def from_string(cls, string: str):
        name = string
        style = ''
        if '[' in string:
            name, style = string.split('[', 1)
            style = style.removesuffix(']')

        return cls(name.strip(), style.strip())

    def __str__(self):
        return '    ' + self.name

    def __rich__(self):
        return f'    [bold {self.style}]{self.name}'


@dataclass(frozen=True)
class Event:
    date: Date
    name: str
    category: Category

    def days_until(self, date: Date | None = None):
        return (self.date - (date or Date.today()) ).days

    def __str__(self):
        return f'{self.days_until():>3} {self.name}'

    def __rich__(self):
        return f'[bold cyan]{self.days_until():>3}[/] [italic {self.category.style}]{self.name}[/]'


# TODO: extract common methods into a class here?
# for EventCollection

EVENT = re.compile(r"(?:(\d{2,4}) )?([A-Za-z]{3}) (\d\d) (.+)")

def _get_events(filename: Path) -> Generator[Event, None, None]:
    today = Datetime.today()

    with open(filename) as f:
        category = Category()
        for i, line in enumerate(f, start=1):
            line = line.strip()
            if not line:
                continue

            if line.startswith('#'):
                if '[' in line:
                    category = Category.from_string(line.removeprefix('#'))
                continue

            match = EVENT.match(line)
            if not match:
                parser.exit(2, f"Error! {filename}:{i} is not a well-formed date:\n{line}\n")

            y, m, d, name = match.groups()
            y = y or today.year  # TODO: shunt to next year? use -p maybe?
            dt = Datetime.strptime(f'{y} {m} {d}', '%Y %b %d')

            yield Event(dt.date(), name, category)



parser = ArgumentParser()
parser.add_argument(
    'file',
    help="The countdown file.")


_event_filter = parser.add_argument_group("event filter")

_event_filter.add_argument(
    '-a', '--all', action='store_true',
    help="Show all events. Alias for -np.")
_event_filter.add_argument(
    '-n', '--number',
    nargs='?', type=int, default=5, const=None,
    help="Number of events to display.")
_event_filter.add_argument(
    '-p', '--past', metavar='DAYS',
    nargs='?', type=int, default=0, const=None,
    help="Number of days in the past to display. Provide no number to show all past events.")
# _event_filter.add_argument(
#     '-C', '--category', metavar='CATEGORY',
#     help="Only show")

_display = parser.add_argument_group("display mode")
_event_filter.add_argument(
    '--no-rich', action='store_true',
    help="Do not display color or styling.")
_display.add_argument(
    '-c', '--show-categories', action='store_true',
    help="Show countdowns by category.")

_single = parser.add_argument_group("single countdown")
_single.add_argument(
    '-d', '--days-until', metavar='NAME',
    help="Return only the countdown days to a specific event. Exits with code 9 if event not found.")
_single.add_argument(
    '-D', '--days-until-category', metavar='CATEGORY',
    help="Return the countdown days (a la -d) to the next event in a given category."
)
# TODO: implement -C
# add --days-only (no names)
# and -1 (show only the first item)
# change -d an alias of `-1 --days-only``
# make -D an alias for -1C

def process_events(args: Namespace) -> Event | list[Event] | dict[Category, list[Event]]:
    if args.all:
        args.number = None
        args.past = None
    
    # get events

    today = Date.today()
    events = _get_events(args.file)
    
    # specific countdown

    if args.days_until is not None:
        for e in events:
            if e.name == args.days_until:
                return e
        else:
            exit(9)
    if args.days_until_category is not None:
        events = filter(lambda e: e.category.name == args.days_until_category, events)
        events = sorted(events, key=lambda e: e.date)
        if not events:  # does this work?
            exit(9)
        e: Event = next(iter(events))
        return e

    # filter

    if args.past is not None:
        minim = -args.past - 1
        events = filter(lambda e: (e.date - today).days > minim, events)

    events = sorted(events, key=lambda e: e.date)
    events = events[:args.number]
    
    # categories

    if args.show_categories:
        cats: dict[Category, list[Event]] = dict()
        for e in events:
            cats.setdefault(e.category, [])
            cats[e.category].append(e)
        return cats
    
    return events