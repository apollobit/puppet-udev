# scheduler.pp --- Create file with udev rule to set device scheduler
#
# Copyright (c) 2013, 2014 Stefan Moeding
# All rights reserved.
#
# Author:     Stefan Moeding <stm@kill-9.net>
# Time-stamp: <2014-10-02 22:01:45 stm>
#
# Parameters:
# $ensure     can be set to 'absent' to remove a rule
# $scheduler  the name of the scheduler to use
#
# Requires:
# udev::device::attribute
#
# Usage:
#
# Set device 'sda' to 'noop' scheduler:
#
#   udev::device::scheduler { 'sda':
#     scheduler => 'noop',
#   }
#
#
define udev::device::scheduler ($ensure = present, $scheduler) {

  udev::device::attribute { "udev-device-scheduler-${title}":
    ensure    => $ensure,
    device    => "${title}",
    attribute => 'queue/scheduler',
    value     => "${scheduler}",
		require		=> Exec["set-scheduler"],
  }

	exec { 'set-scheduler':
		command		=> "/bin/echo ${scheduler} > /sys/block/${title}/queue/scheduler",
	}

}
