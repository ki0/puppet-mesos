# Class: mesos::params
#
# This class defines default parameters used by the main module class mesos
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to mesos class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class mesos::params {

  ### Application related parameters

  $zk_string = ''

  $package = $::operatingsystem ? {
    default => 'mesos',
  }

  $service_master = $::operatingsystem ? {
    default => 'mesos-master',
  }

  $service_slave = $::operatingsystem ? {
    default => 'mesos-slave',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'mesos',
  }

  $process_master = $::operatingsystem ? {
    default => 'mesos-master',
  }

  $process_slave = $::operatingsystem ? {
    default => 'mesos-slave',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => 'mesos',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/mesos',
  }

  $config_file_zk = $::operatingsystem ? {
    default => '/etc/mesos/zk',
  }

  $config_file_master = $::operatingsystem ? {
    default => '/etc/default/mesos-master',
  }

  $config_file_slave = $::operatingsystem ? {
    default => '/etc/default/mesos-slave',
  }

  $config_file_mesos = $::operatingsystem ? {
    default => '/etc/default/mesos',
  }

  $config_file_quorum = $::operatingsystem ? {
    default => '/etc/mesos-master/quorum'
  }

  $config_file_cluster = $::operatingsystem ? {
    default => '/etc/mesos-master/cluster'
  }

  $config_file_log_level = $::operatingsystem ? {
    default => '/etc/mesos-master/logging_level'
  }

  $config_file_hostname = $::operatingsystem ? {
    default => '/etc/mesos-master/hostname'
  }

  $config_file_ip = $::operatingsystem ? {
    default => '/etc/mesos-master/ip'
  }

  $config_file_attr = $::operatingsystem ? {
    default => '/etc/mesos-slave/attributes',
  }

  $config_file_port = $::operatingsystem ? {
    default => '/etc/mesos-slave/port',
  }

  $config_file_resources = $::operatingsystem ? {
    default => '/etc/mesos-slave/resources',
  }

  $config_file_hostname_slave = $::operatingsystem ? {
    default => '/etc/mesos-slave/hostname',
  }

  $config_file_log_level_slave = $::operatingsystem ? {
    default => '/etc/mesos-slave/logging_level',
  }

  $config_file_ip_slave = $::operatingsystem ? {
    default => '/etc/mesos-slave/ip',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/mesos',
    default                   => '/etc/sysconfig/mesos',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/mesos.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/etc/mesos',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/mesos',
  }

  $log_file = $::operatingsystem ? {
    default => '/var/log/mesos/mesos.log',
  }

  $port = '5050'
  $port_slave = '5051'
  $protocol = 'tcp'

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = 'mesos/mesos.erb'
  $template_master = 'mesos/mesos-master.erb'
  $template_slave  = 'mesos/mesos-slave.erb'
  $template_zk  = 'mesos/zk.erb'
  $template_hostname = 'mesos/hostname.erb'

  $template_quorum = 'mesos/master/quorum.erb'
  $template_cluster = 'mesos/master/cluster.erb'
  $template_log_level = 'mesos/master/logging_level.erb'
  $template_ip = 'mesos/master/ip.erb'

  $template_port_slave  = 'mesos/slave/port.erb'
  $template_attr_slave  = 'mesos/slave/attributes.erb'
  $template_resources_slave = 'mesos/slave/resources.erb'
  $template_log_level_slave = 'mesos/slave/logging_level.erb'
  $template_ip_slave = 'mesos/slave/ip.erb'

  $options = ''
  $service_autorestart_master = true
  $service_autorestart_slave  = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false
  $use_mesos_repo = true
  $attributes_slave = ''
  $mesos_ulimit = '65535'
  $use_master = false
  $use_slave = false
  $install_zookeeper = false
  $cluster_name      = 'MESOS'
  $quorum = '1'
  $logging_level = 'ERROR'
  $logging_level_slave = 'ERROR'

  $ip = '0.0.0.0'
  $ip_slave = '0.0.0.0'

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false
  $noops = false

}
