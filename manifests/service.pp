# class takes care of syslogd service management
class syslogd::service (
  $ensure,
  $enable,
  $flags,
) {
  service { 'syslogd':
    ensure => $ensure,
    enable => $enable,
    flags  => $flags,
  }
}
