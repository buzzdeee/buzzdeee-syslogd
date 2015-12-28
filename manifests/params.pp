# Defining default values for the module
class syslogd::params {
  $service_enable = true
  $service_ensure = 'running'
}
