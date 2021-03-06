# == Class: syslogd
#
# Full description of class syslogd here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'syslogd':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class syslogd (
  $service_ensure = $::syslogd::params::service_ensure,
  $service_enable = $::syslogd::params::service_enable,
  $service_flags  = undef,
  $loghost        = undef,
  $custom_logs    = {},
) inherits syslogd::params {

  class { 'syslogd::config':
    custom_logs => $custom_logs,
    loghost     => $loghost,
  }

  class { 'syslogd::service':
    ensure => $service_ensure,
    enable => $service_enable,
    flags  => $service_flags,
  }

  Class['syslogd::config'] ~>
  Class['syslogd::service']

}
