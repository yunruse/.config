#! /usr/bin/env python3
# pip install transmission-rpc battery
import battery
from transmission_rpc import Client
Client().set_session(alt_speed_enabled=battery.active())
