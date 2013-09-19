# attribute.pp --- Create file with udev rule to set device attribute
#
# Copyright (c) 2013 Stefan Moeding
# All rights reserved.
#
# Author:     Stefan Moeding <stm@kill-9.net>
# Time-stamp: <2013-09-19 17:36:48 stm>
#
# Parameters:
# $ensure     can be set to 'absent' to remove a rule
# $device     the device to be modified
# $attribute  the attribute to change
# $value      the value to set the attribute to
# $comment    optional comment to include in the file
#
# Requires:
#
# Usage:
#
# Switch device 'sda' to 'noop' scheduler:
#
#   udev::device::attribute { 'sda-scheduler':
#     device    => 'sda',
#     attribute => 'queue/scheduler',
#     value     => 'noop',
#   }
#
# Consult the documentation for udevadm(8) to find out about valid
# attributes. Hints are also available online, see for example
# http://www.reactivated.net/writing_udev_rules.html
#
#
define udev::device::attribute(
  $ensure=present,
  $device,
  $attribute,
  $value,
  $comment=undef)
{
  # Replace '/' in $attribute to generate the filename
  $filename = regsubst("10-${device}-${attribute}.rules", '/', '-', 'G')

  file { "/etc/udev/rules.d/${filename}":
    ensure  => $ensure ? {
      absent  => absent,
      default => file,
    },
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("udev/device-attribute.erb"),
  }
}
