# rule.pp --- Install or remove a rule file for udev
#
# Copyright (c) 2013 Stefan Moeding
# All rights reserved.
#
# Author:     Stefan Moeding <stm@kill-9.net>
# Time-stamp: <2013-09-19 17:36:36 stm>
#
# Parameters:
# $ensure     can be set to 'absent' to remove an existing file
#
# Requires:
#
# Usage:
#
# Create udev file '10-audio.rules' from file '10-audio.rules':
#
#   udev::rule { '10-audio.rules': }
#
# Remove rule '10-audio.rules' from udev directory:
#
#   udev::rule { '10-audio.rules':
#     ensure => absent,
#   }
#
#
define udev::rule ($ensure=file) {
  file { "udev-rule-${title}":
    ensure => $ensure,
    path   => "/etc/udev/rules.d/${title}",
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => "puppet:///modules/udev/${title}",
  }
}
