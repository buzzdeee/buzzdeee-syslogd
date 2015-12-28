# class takes care of config file
class syslogd::config (
  $loghost,
) {
  file { '/etc/syslog.conf':
    owner   => 'root',
    group   => '0',
    mode    => '0644',
    content => template('syslogd/syslog.conf.erb'),
  }
}
