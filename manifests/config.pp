# class takes care of config file
class syslogd::config (
  $custom_logs,
  $loghost,
) {
  file { '/etc/syslog.conf':
    owner   => 'root',
    group   => '0',
    mode    => '0644',
    content => template('syslogd/syslog.conf.erb'),
  }
  each ($custom_logs) |$type, $values| {
    file { $values['logfile']:
      ensure => 'present',
      owner  => $values['owner'],
      group  => $values['group'],
      mode   => $values['mode'],
    }
  }

}
