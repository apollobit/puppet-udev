# scheduler.pp --- Create file with udev rule to set device scheduler
#
# Copyright (c) 2013 Stefan Moeding
# All rights reserved.
#
# Author:     Stefan Moeding <stm@kill-9.net>
# Time-stamp: <2013-09-19 17:37:00 stm>
#
# Parameters:
# $ensure     can be set to 'absent' to remove a rule
# $device     the device to be modified
# $scheduler  the name of the scheduler to use
#
# Requires:
# udev::device::attribute
#
# Usage:
#
# Set device 'sda' to 'noop' scheduler:
#
#   udev::device::scheduler { 'device-scheduler-sda':
#     device    => 'sda',
#     scheduler => 'noop',
#   }
#
#
define udev::device::scheduler(
  $ensure=present,
  $device,
  $scheduler)
{
  udev::device::attribute { "udev-device-scheduler-${device}":
    ensure    => $ensure,
    device    => $device,
    attribute => 'queue/scheduler',
    value     => $scheduler,
  }
}
