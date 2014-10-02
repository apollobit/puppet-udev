# queue.pp --- Create file with udev rule to set device queue size
#
# Copyright (c) 2013, 2014 Stefan Moeding
# All rights reserved.
#
# Author:     Stefan Moeding <stm@kill-9.net>
# Time-stamp: <2014-10-02 22:05:51 stm>
#
# Parameters:
# $ensure     can be set to 'absent' to remove a rule
# $queuesize  the queue size to set
#
# Requires:
# udev::device::attribute
#
# Usage:
#
# Set device 'sda' to queue size 0:
#
#   udev::device::queue { 'sda':
#     queuesize => '0',
#   }
#
#
define udev::device::queue($ensure = present, $queuesize)
{
  udev::device::attribute { "udev-device-queue-${title}":
    ensure    => $ensure,
    device    => "${title}",
    attribute => 'device/queue_depth',
    value     => "${queuesize}",
  }
}
