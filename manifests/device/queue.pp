# queue.pp --- Create file with udev rule to set device queue size
#
# Copyright (c) 2013 Stefan Moeding
# All rights reserved.
#
# Author:     Stefan Moeding <stm@kill-9.net>
# Time-stamp: <2013-09-19 17:36:54 stm>
#
# Parameters:
# $ensure     can be set to 'absent' to remove a rule
# $device     the device to be modified
# $queuesize  the queue size to set
#
# Requires:
# udev::device::attribute
#
# Usage:
#
# Set device 'sda' to queue size 0:
#
#   udev::device::queue { 'device-queuesize-sda':
#     device    => 'sda',
#     queuesize => '0',
#   }
#
#
define udev::device::queue(
  $ensure=present,
  $device,
  $queuesize)
{
  udev::device::attribute { "udev-device-queue-${device}":
    ensure    => $ensure,
    device    => $device,
    attribute => 'device/queue_depth',
    value     => $queuesize,
  }
}
