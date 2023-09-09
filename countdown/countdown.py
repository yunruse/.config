#!/usr/bin/env python3

'''
Countdown date utility.

Mostly for my own use, but feel free to hack around with it!

Works well with `pip install rich` for rich text formatting, but it's not necessary.

Takes some countdown text file. I use
`alias countdown='countdown my_path [my_opts]'` for config.

The countdown file itself has lines of the format:

YYYY Mon DD Eventname
2023 Jun 03 Example Countdown

Comments of the form:
# Category [richstyle]
# Movies example [bold red]
# Unformatted example

give categories (and style) to events below them, useful for collation.
'''

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


parser = ArgumentParser(description=__doc__)
parser.add_argument(
    'file',
    help="The countdown file.")


_filter_num = parser.add_argument_group(
    "Filter by date and number")
_filter_num.add_argument(
    '-a', '--all', action='store_true',
    help="Show all events including those in the past. Alias for -N -p.")
_filter_num.add_argument(
    '-1', '--first', action='store_true',
    help='Show the first event. Alias for -N1 -p0.')
_filter_num.add_argument(
    '-N', '--number',
    nargs='?', type=int, default=5, const=None,
    help="Number of events to display.")
_filter_num.add_argument(
    '-p', '--past', metavar='DAYS',
    nargs='?', type=int, default=0, const=None,
    help="Number of days in the past to display. Provide no number to show all past events.")


_filter_name = parser.add_argument_group(
    "Filter by name",
    "Exits with code 9 if no entries are found.")
_filter_name.add_argument(
    '-C', '--category', metavar='CATEGORY',
    help="Only show items in a given category.")
_filter_name.add_argument(
    '-n', '--name', metavar='NAME',
    help="Only show entries with this name.")


_display = parser.add_argument_group(
    "Display")
_display.add_argument(
    '-c', '--show-categories', action='store_true',
    help="Show countdowns by category.")
_display.add_argument(
    '-d', '--days-until', action='store_true',
    help="Only show the days until the given date.")

# TODO: implement -C
# add --days-only (no names)
# and -1 (show only the first item)
# change -d an alias of `-1 --days-only``
# make -D an alias for -1C

Events = list[Event]

def process_events(args: Namespace) -> Events | dict[Category, Events]:
    if args.first:
        args.number = 1
    if args.all:
        args.number = None
        args.past = None
    
    # get events

    today = Date.today()
    events = _get_events(args.file)
    
    # name filters
    if args.name is not None:
        events = filter(lambda e: e.name == args.name, events)
    if args.category is not None:
        events = filter(lambda e: e.category.name == args.category, events)

    # date filters

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