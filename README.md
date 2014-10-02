# puppet-udev

Manage Linux udev rules with Puppet. Currently the package supports installation and deinstallation of rules available in the modules `files` directory. It also includes defined types to configure the device queue size and device scheduler for a named device.

## Usage

### Install a rule from the files directory

```Puppet
udev::rule { '10-audio.rules': }
```

### Remove rule file from the configuration

```Puppet
udev::rule { '10-audio.rules':
  ensure => absent,
}
```

### Create a rule to set the device queue size

```Puppet
udev::device::queue { 'sda':
  queuesize => '0',
}
```

### Remove the rule to set the device queue size

```Puppet
udev::device::queue { 'sda':
  ensure => absent,
}
```

### Set the device scheduler for a device

```Puppet
udev::device::scheduler { 'sda':
  scheduler => 'noop',
}
```
