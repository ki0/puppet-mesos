# = Class: mesos
#
# This is the main mesos class
#
#
# == Parameters
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, mesos class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $mesos_myclass
#
# [*install_zookeeper*]
#   Set to true if you want install Zookeeper with Mesosphere
#
# [*zk_string*]
#   ZooKeeper connection string
#
# [*mesos_ulimit*]
#   Max number of open files
#
# [*quorum*]
#   Max number of open files
#
# [*attributes_slave*]
#   Attributes for the Mesos Slave
#
# [*ip*]
#   IP to listening on the Master
#
# [*ip_slave*]
#   IP to listening on the Slave
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, mesos main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $mesos_source
#
# [*source_dir*]
#   If defined, the whole mesos configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#   Can be defined also by the (top scope) variable $mesos_source_dir
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#   Can be defined also by the (top scope) variable $mesos_source_dir_purge
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, mesos main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $mesos_template
#
# [*template_zk*]
#   Template for zk_string
#
# [*template_master*]
#   Sets the path to the template to use as content for /etc/defaults/mesos-master file
#   If defined, mesos main config file has: content => content("$template_master")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $mesos_template_master
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $mesos_options
#
# [*service_autorestart*]
#   Automatically restarts the mesos service when there is a change in
#   configuration files. Default: true, Set to false if you don't want to
#   automatically restart the service.
#
# [*version*]
#   The package version, used in the ensure parameter of package type.
#   Default: present. Can be 'latest' or a specific version number.
#   Note that if the argument absent (see below) is set to true, the
#   package is removed, whatever the value of version parameter.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $mesos_absent
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $mesos_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $mesos_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $mesos_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for mesos checks
#   Can be defined also by the (top scope) variables $mesos_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $mesos_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $mesos_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $mesos_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $mesos_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for mesos port(s)
#   Can be defined also by the (top scope) variables $mesos_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling mesos. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $mesos_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $mesos_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $mesos_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $mesos_audit_only
#   and $audit_only
#
# [*noops*]
#   Set noop metaparameter to true for all the resources managed by the module.
#   Basically you can run a dryrun for this specific module if you set
#   this to true. Default: false
#
# Default class params - As defined in mesos::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of mesos package
#
# [*service*]
#   The name of mesos service
#
# [*service_status*]
#   If the mesos service init script supports status argument
#
# [*process*]
#   The name of mesos process
#
# [*process_args*]
#   The name of mesos arguments. Used by puppi and monitor.
#   Used only in case the mesos process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user mesos runs with. Used by puppi and monitor.
#
# [*config_dir*]
#   Main configuration directory. Used by puppi
#
# [*config_file*]
#   Main configuration file path
#
# [*config_file_mode*]
#   Main configuration file path mode
#
# [*config_file_owner*]
#   Main configuration file path owner
#
# [*config_file_group*]
#   Main configuration file path group
#
# [*config_file_init*]
#   Path of configuration file sourced by init script
#
# [*pid_file*]
#   Path of pid file. Used by monitor
#
# [*data_dir*]
#   Path of application data directory. Used by puppi
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
# [*port*]
#   The listening port, if any, of the master service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $mesos_port
#
# [*port_slave*]
#   The listening port, if any, of the slave service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $mesos_port_slave
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $mesos_protocol
#
# [*use_master*]
#   Activate Mesos Master
#
# [*use_slave*]
#   Activate Mesos Slave
#
# See README for usage patterns.
#
class mesos (
  $use_master           = params_lookup( 'use_master' ),
  $use_slave            = params_lookup( 'use_slave' ),
  $mesos_ulimit         = params_lookup( 'mesos_ulimit' ),

  $cluster_name         = params_lookup( 'cluster_name' ),
  $attributes_slave     = params_lookup( 'attributes_slave' ),
  $quorum               = params_lookup( 'quorum' ),
  $logging_level        = params_lookup( 'logging_level' ),
  $logging_level_slave  = params_lookup( 'logging_level_slave' ),
  $hostname             = params_lookup( 'hostname' ),
  $hostname_slave       = params_lookup( 'hostname_slave' ),
  $ip                   = params_lookup( 'ip' ),
  $ip_slave             = params_lookup( 'ip_slave' ),
  $resources            = params_lookup( 'resources' ),
  $port                 = params_lookup( 'port' ),
  $port_slave           = params_lookup( 'port_slave' ),

  $zk_string            = params_lookup( 'zk_string' ),
  $install_zookeeper    = params_lookup( 'install_zookeeper' ),
  $use_mesos_repo       = params_lookup( 'use_mesos_repo' ),
  $my_class            = params_lookup( 'my_class' ),
  $source              = params_lookup( 'source' ),
  $source_dir          = params_lookup( 'source_dir' ),
  $source_dir_purge    = params_lookup( 'source_dir_purge' ),
  $template_zk         = params_lookup( 'template_zk' ),
  $template_master     = params_lookup( 'template_master' ),
  $template_slave      = params_lookup( 'template_slave' ),
  $template      = params_lookup( 'template' ),

  $template_quorum     = params_lookup( 'template_quorum' ),
  $template_cluster    = params_lookup( 'template_cluster' ),
  $template_log_level  = params_lookup( 'template_log_level' ),
  $template_hostname   = params_lookup( 'template_hostname' ),
  $template_ip         = params_lookup( 'template_ip' ),

  $template_attr_slave       = params_lookup( 'template_attr_slave' ),
  $template_port_slave       = params_lookup( 'template_port_slave' ),
  $template_resources_slave  = params_lookup( 'template_resources_slave' ),
  $template_log_level_slave  = params_lookup( 'template_log_level_slave' ),
  $template_hostname_slave   = params_lookup( 'template_hostname_slave' ),
  $template_ip_slave         = params_lookup( 'template_ip_slave' ),

  $service_autorestart_master = params_lookup( 'service_autorestart_master' , 'global' ),
  $service_autorestart_slave  = params_lookup( 'service_autorestart_slave' , 'global' ),

  $options             = params_lookup( 'options' ),
  $version             = params_lookup( 'version' ),
  $absent              = params_lookup( 'absent' ),
  $disable             = params_lookup( 'disable' ),
  $disableboot         = params_lookup( 'disableboot' ),
  $monitor             = params_lookup( 'monitor' , 'global' ),
  $monitor_tool        = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target      = params_lookup( 'monitor_target' , 'global' ),
  $puppi               = params_lookup( 'puppi' , 'global' ),
  $puppi_helper        = params_lookup( 'puppi_helper' , 'global' ),
  $firewall            = params_lookup( 'firewall' , 'global' ),
  $firewall_tool       = params_lookup( 'firewall_tool' , 'global' ),
  $firewall_src        = params_lookup( 'firewall_src' , 'global' ),
  $firewall_dst        = params_lookup( 'firewall_dst' , 'global' ),
  $debug               = params_lookup( 'debug' , 'global' ),
  $audit_only          = params_lookup( 'audit_only' , 'global' ),
  $noops               = params_lookup( 'noops' ),
  $package             = params_lookup( 'package' ),
  $service_master      = params_lookup( 'service_master' ),
  $service_slave       = params_lookup( 'service_slave' ),
  $service_status      = params_lookup( 'service_status' ),
  $process             = params_lookup( 'process' ),
  $process_master      = params_lookup( 'process_master' ),
  $process_slave       = params_lookup( 'process_slave' ),
  $process_args        = params_lookup( 'process_args' ),
  $process_user        = params_lookup( 'process_user' ),
  $config_dir          = params_lookup( 'config_dir' ),
  $config_file         = params_lookup( 'config_file' ),
  $config_file_master  = params_lookup( 'config_file_master' ),
  $config_file_slave   = params_lookup( 'config_file_slave' ),
  $config_file_mesos   = params_lookup( 'config_file_mesos' ),
  $config_file_mode    = params_lookup( 'config_file_mode' ),
  $config_file_owner   = params_lookup( 'config_file_owner' ),
  $config_file_group   = params_lookup( 'config_file_group' ),
  $config_file_init    = params_lookup( 'config_file_init' ),
  $pid_file            = params_lookup( 'pid_file' ),
  $data_dir            = params_lookup( 'data_dir' ),
  $log_dir             = params_lookup( 'log_dir' ),
  $log_file            = params_lookup( 'log_file' ),
  $protocol            = params_lookup( 'protocol' )
  ) inherits mesos::params {

  $bool_install_zookeeper=any2bool($install_zookeeper)
  $bool_use_mesos_repo=any2bool($use_mesos_repo)
  $bool_source_dir_purge=any2bool($source_dir_purge)
  $bool_service_autorestart_master=any2bool($service_autorestart_master)
  $bool_service_autorestart_slave=any2bool($service_autorestart_slave)
  $bool_absent=any2bool($absent)
  $bool_disable=any2bool($disable)
  $bool_disableboot=any2bool($disableboot)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_firewall=any2bool($firewall)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)
  $bool_noops=any2bool($noops)

  ### Definition of some variables used in the module
  $manage_package = $mesos::bool_absent ? {
    true  => 'absent',
    false => $mesos::version,
  }

  $manage_service_enable = $mesos::bool_disableboot ? {
    true    => false,
    default => $mesos::bool_disable ? {
      true    => false,
      default => $mesos::bool_absent ? {
        true  => false,
        false => true,
      },
    },
  }

  $manage_service_ensure = $mesos::bool_disable ? {
    true    => 'stopped',
    default =>  $mesos::bool_absent ? {
      true    => 'stopped',
      default => 'running',
    },
  }

  $manage_file = $mesos::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  $manage_file_master = $mesos::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  $manage_slave = $mesos::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  $manage_mesos = $mesos::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  $manage_quorum = $mesos::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  $manage_cluster = $mesos::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  $manage_log_level = $mesos::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  $manage_hostname = $mesos::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  $manage_ip = $mesos::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  $manage_attributes = $mesos::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  $manage_port_slave = $mesos::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  $manage_resources = $mesos::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  $manage_hostname_slave = $mesos::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  $manage_log_level_slave = $mesos::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  $manage_ip_slave = $mesos::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $mesos::bool_absent == true
  or $mesos::bool_disable == true
  or $mesos::bool_disableboot == true {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  if $mesos::bool_absent == true
  or $mesos::bool_disable == true {
    $manage_firewall = false
  } else {
    $manage_firewall = true
  }

  $manage_audit = $mesos::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $mesos::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $mesos::source ? {
    ''        => undef,
    default   => $mesos::source,
  }

  $manage_file_content = $mesos::template_zk ? {
    ''        => undef,
    default   => template($mesos::template_zk),
  }

  $manage_file_content_master = $mesos::template_master ? {
    ''        => undef,
    default   => template($mesos::template_master),
  }

  $manage_file_content_slave = $mesos::template_slave ? {
    ''        => undef,
    default   => template($mesos::template_slave),
  }

  $manage_file_content_mesos = $mesos::template ? {
    ''        => undef,
    default   => template($mesos::template),
  }

  $manage_file_content_quorum = $mesos::template_quorum ? {
    ''        => undef,
    default   => template($mesos::template_quorum),
  }

  $manage_file_content_cluster = $mesos::template_cluster ? {
    ''        => undef,
    default   => template($mesos::template_cluster),
  }

  $manage_file_content_log_level = $mesos::template_log_level ? {
    ''        => undef,
    default   => template($mesos::template_log_level),
  }

  $manage_file_content_hostname = $mesos::template_hostname ? {
    ''        => undef,
    default   => template($mesos::template_hostname),
  }

  $manage_file_content_ip = $mesos::template_ip ? {
    ''        => undef,
    default   => template($mesos::template_ip),
  }

  $manage_file_content_attrs = $mesos::template_attr_slave ? {
    ''        => undef,
    default   => template($mesos::template_attr_slave),
  }

  $manage_file_content_port = $mesos::template_port_slave ? {
    ''        => undef,
    default   => template($mesos::template_port_slave),
  }

  $manage_file_content_resources = $mesos::template_resources_slave ? {
    ''        => undef,
    default   => template($mesos::template_resources_slave),
  }

  $manage_file_content_hostname_slave = $mesos::template_hostname_slave ? {
    ''        => undef,
    default   => template($mesos::template_hostname_slave),
  }

  $manage_file_content_log_level_slave = $mesos::template_log_level_slave ? {
    ''        => undef,
    default   => template($mesos::template_log_level_slave),
  }

  $manage_file_content_ip_slave = $mesos::template_ip_slave ? {
    ''        => undef,
    default   => template($mesos::template_ip_slave),
  }

  ### Managed resources
  if $bool_use_mesos_repo {
    require apt::repo::mesosphere
  }

  if $bool_install_zookeeper {
    package { $mesos::package:
      ensure  => $mesos::manage_package,
      noop    => $mesos::bool_noops,
    }
  }
  else {
    package { $mesos::package:
      ensure  => $mesos::manage_package,
      noop    => $mesos::bool_noops,
      install_options => [ '--no-install-recommends' ],
    }
  }

  if $use_master {
    $manage_service_autorestart_master = $mesos::bool_service_autorestart_master ? {
      true    => Service[mesos-master],
      false   => undef,
    }
    $manage_service_ensure_master = 'running'
    $manage_service_enable_master = true

    service { 'mesos-master':
      ensure     => $mesos::manage_service_ensure_master,
      name       => $mesos::service_master,
      enable     => $mesos::manage_service_enable_master,
      hasstatus  => $mesos::service_status,
      pattern    => $mesos::process_master,
      require    => Package[$mesos::package],
      noop       => $mesos::bool_noops,
    }
  }
  else {
    $manage_service_ensure_master = 'stopped'
    $manage_service_enable_master = false
  }
  if $use_slave {
    $manage_service_autorestart_slave = $mesos::bool_service_autorestart_slave ? {
      true    => Service[mesos-slave],
      false   => undef,
    }
    $manage_service_ensure_slave = 'running'
    $manage_service_enable_slave = true

    service { 'mesos-slave':
      ensure     => $mesos::manage_service_ensure_slave,
      name       => $mesos::service_slave,
      enable     => $mesos::manage_service_enable_slave,
      hasstatus  => $mesos::service_status,
      pattern    => $mesos::process_slave,
      require    => Package[$mesos::package],
      noop       => $mesos::bool_noops,
    }
  }
  else {
    $manage_service_ensure_slave = 'stopped'
    $manage_service_enable_slave = false
  }


  file { 'mesos.conf':
    ensure  => $mesos::manage_file,
    path    => $mesos::config_file,
    mode    => $mesos::config_file_mode,
    owner   => $mesos::config_file_owner,
    group   => $mesos::config_file_group,
    require => Package[$mesos::package],
    notify  => $mesos::manage_service_autorestart_master,
    source  => $mesos::manage_file_source,
    content => $mesos::manage_file_content,
    replace => $mesos::manage_file_replace,
    audit   => $mesos::manage_audit,
    noop    => $mesos::bool_noops,
  }

  file { 'mesos-master':
    ensure  => $mesos::manage_file_master,
    path    => $mesos::config_file_master,
    mode    => $mesos::config_file_mode,
    owner   => $mesos::config_file_owner,
    group   => $mesos::config_file_group,
    require => Package[$mesos::package],
    notify  => $mesos::manage_service_autorestart_master,
    source  => $mesos::manage_file_source,
    content => $mesos::manage_file_content_master,
    replace => $mesos::manage_file_replace,
    audit   => $mesos::manage_audit,
    noop    => $mesos::bool_noops,
  }

  file { 'mesos-slave':
    ensure  => $mesos::manage_file_slave,
    path    => $mesos::config_file_slave,
    mode    => $mesos::config_file_mode,
    owner   => $mesos::config_file_owner,
    group   => $mesos::config_file_group,
    require => Package[$mesos::package],
    notify  => $mesos::manage_service_autorestart_slave,
    source  => $mesos::manage_file_source,
    content => $mesos::manage_file_content_slave,
    replace => $mesos::manage_file_replace,
    audit   => $mesos::manage_audit,
    noop    => $mesos::bool_noops,
  }

  file { 'mesos':
    ensure  => $mesos::manage_file_mesos,
    path    => $mesos::config_file_mesos,
    mode    => $mesos::config_file_mode,
    owner   => $mesos::config_file_owner,
    group   => $mesos::config_file_group,
    require => Package[$mesos::package],
    notify  => $mesos::manage_service_autorestart_master,
    source  => $mesos::manage_file_source,
    content => $mesos::manage_file_content_mesos,
    replace => $mesos::manage_file_replace,
    audit   => $mesos::manage_audit,
    noop    => $mesos::bool_noops,
  }

  # MASTER

  file { 'quorum':
    ensure  => $mesos::manage_quorum,
    path    => $mesos::config_file_quorum,
    mode    => $mesos::config_file_mode,
    owner   => $mesos::config_file_owner,
    group   => $mesos::config_file_group,
    require => Package[$mesos::package],
    notify  => $mesos::manage_service_autorestart_slave,
    source  => $mesos::manage_file_source,
    content => $mesos::manage_file_content_quorum,
    replace => $mesos::manage_file_replace,
    audit   => $mesos::manage_audit,
    noop    => $mesos::bool_noops,
  }

  file { 'cluster':
    ensure  => $mesos::manage_cluster,
    path    => $mesos::config_file_cluster,
    mode    => $mesos::config_file_mode,
    owner   => $mesos::config_file_owner,
    group   => $mesos::config_file_group,
    require => Package[$mesos::package],
    notify  => $mesos::manage_service_autorestart_slave,
    source  => $mesos::manage_file_source,
    content => $mesos::manage_file_content_cluster,
    replace => $mesos::manage_file_replace,
    audit   => $mesos::manage_audit,
    noop    => $mesos::bool_noops,
  }

  file { 'logging_level':
    ensure  => $mesos::manage_log_level,
    path    => $mesos::config_file_log_level,
    mode    => $mesos::config_file_mode,
    owner   => $mesos::config_file_owner,
    group   => $mesos::config_file_group,
    require => Package[$mesos::package],
    notify  => $mesos::manage_service_autorestart_slave,
    source  => $mesos::manage_file_source,
    content => $mesos::manage_file_content_log_level,
    replace => $mesos::manage_file_replace,
    audit   => $mesos::manage_audit,
    noop    => $mesos::bool_noops,
  }

  file { 'hostname':
    ensure  => $mesos::manage_hostname,
    path    => $mesos::config_file_hostname,
    mode    => $mesos::config_file_mode,
    owner   => $mesos::config_file_owner,
    group   => $mesos::config_file_group,
    require => Package[$mesos::package],
    notify  => $mesos::manage_service_autorestart_slave,
    source  => $mesos::manage_file_source,
    content => $mesos::manage_file_content_hostname,
    replace => $mesos::manage_file_replace,
    audit   => $mesos::manage_audit,
    noop    => $mesos::bool_noops,
  }

  file { 'ip':
    ensure  => $mesos::manage_ip,
    path    => $mesos::config_file_ip,
    mode    => $mesos::config_file_mode,
    owner   => $mesos::config_file_owner,
    group   => $mesos::config_file_group,
    require => Package[$mesos::package],
    notify  => $mesos::manage_service_autorestart_slave,
    source  => $mesos::manage_file_source,
    content => $mesos::manage_file_content_ip,
    replace => $mesos::manage_file_replace,
    audit   => $mesos::manage_audit,
    noop    => $mesos::bool_noops,
  }

  # SLAVE

  file { 'attributes':
    ensure  => $mesos::manage_attributes,
    path    => $mesos::config_file_attr,
    mode    => $mesos::config_file_mode,
    owner   => $mesos::config_file_owner,
    group   => $mesos::config_file_group,
    require => Package[$mesos::package],
    notify  => $mesos::manage_service_autorestart_slave,
    source  => $mesos::manage_file_source,
    content => $mesos::manage_file_content_attrs,
    replace => $mesos::manage_file_replace,
    audit   => $mesos::manage_audit,
    noop    => $mesos::bool_noops,
  }

  file { 'port_slave':
    ensure  => $mesos::manage_port_slave,
    path    => $mesos::config_file_port,
    mode    => $mesos::config_file_mode,
    owner   => $mesos::config_file_owner,
    group   => $mesos::config_file_group,
    require => Package[$mesos::package],
    notify  => $mesos::manage_service_autorestart_slave,
    source  => $mesos::manage_file_source,
    content => $mesos::manage_file_content_port,
    replace => $mesos::manage_file_replace,
    audit   => $mesos::manage_audit,
    noop    => $mesos::bool_noops,
  }

  file { 'resources':
    ensure  => $mesos::manage_resources,
    path    => $mesos::config_file_resources,
    mode    => $mesos::config_file_mode,
    owner   => $mesos::config_file_owner,
    group   => $mesos::config_file_group,
    require => Package[$mesos::package],
    notify  => $mesos::manage_service_autorestart_slave,
    source  => $mesos::manage_file_source,
    content => $mesos::manage_file_content_resources,
    replace => $mesos::manage_file_replace,
    audit   => $mesos::manage_audit,
    noop    => $mesos::bool_noops,
  }

  file { 'hostname_slave':
    ensure  => $mesos::manage_hostname_slave,
    path    => $mesos::config_file_hostname_slave,
    mode    => $mesos::config_file_mode,
    owner   => $mesos::config_file_owner,
    group   => $mesos::config_file_group,
    require => Package[$mesos::package],
    notify  => $mesos::manage_service_autorestart_slave,
    source  => $mesos::manage_file_source,
    content => $mesos::manage_file_content_hostname_slave,
    replace => $mesos::manage_file_replace,
    audit   => $mesos::manage_audit,
    noop    => $mesos::bool_noops,
  }

  file { 'logging_level_slave':
    ensure  => $mesos::manage_log_level_slave,
    path    => $mesos::config_file_log_level_slave,
    mode    => $mesos::config_file_mode,
    owner   => $mesos::config_file_owner,
    group   => $mesos::config_file_group,
    require => Package[$mesos::package],
    notify  => $mesos::manage_service_autorestart_slave,
    source  => $mesos::manage_file_source,
    content => $mesos::manage_file_content_log_level_slave,
    replace => $mesos::manage_file_replace,
    audit   => $mesos::manage_audit,
    noop    => $mesos::bool_noops,
  }

  file { 'ip_slave':
    ensure  => $mesos::manage_ip_slave,
    path    => $mesos::config_file_ip_slave,
    mode    => $mesos::config_file_mode,
    owner   => $mesos::config_file_owner,
    group   => $mesos::config_file_group,
    require => Package[$mesos::package],
    notify  => $mesos::manage_service_autorestart_slave,
    source  => $mesos::manage_file_source,
    content => $mesos::manage_file_content_ip_slave,
    replace => $mesos::manage_file_replace,
    audit   => $mesos::manage_audit,
    noop    => $mesos::bool_noops,
  }

  # The whole mesos configuration directory can be recursively overriden
  if $mesos::source_dir {
    file { 'mesos.dir':
      ensure  => directory,
      path    => $mesos::config_dir,
      require => Package[$mesos::package],
      notify  => $mesos::manage_service_autorestart,
      source  => $mesos::source_dir,
      recurse => true,
      purge   => $mesos::bool_source_dir_purge,
      force   => $mesos::bool_source_dir_purge,
      replace => $mesos::manage_file_replace,
      audit   => $mesos::manage_audit,
      noop    => $mesos::bool_noops,
    }
  }


  ### Include custom class if $my_class is set
  if $mesos::my_class {
    include $mesos::my_class
  }


  ### Provide puppi data, if enabled ( puppi => true )
  if $mesos::bool_puppi == true {
    $classvars=get_class_args()
    puppi::ze { 'mesos':
      ensure    => $mesos::manage_file,
      variables => $classvars,
      helper    => $mesos::puppi_helper,
      noop      => $mesos::bool_noops,
    }
  }


  ### Service monitoring, if enabled ( monitor => true )
  if $mesos::bool_monitor == true {
    if $mesos::port != '' {
      monitor::port { "mesos_${mesos::protocol}_${mesos::port}":
        protocol => $mesos::protocol,
        port     => $mesos::port,
        target   => $mesos::monitor_target,
        tool     => $mesos::monitor_tool,
        enable   => $mesos::manage_monitor,
        noop     => $mesos::bool_noops,
      }
    }
    if $mesos::service != '' {
      monitor::process { 'mesos_process':
        process  => $mesos::process,
        service  => $mesos::service,
        pidfile  => $mesos::pid_file,
        user     => $mesos::process_user,
        argument => $mesos::process_args,
        tool     => $mesos::monitor_tool,
        enable   => $mesos::manage_monitor,
        noop     => $mesos::bool_noops,
      }
    }
  }


  ### Firewall management, if enabled ( firewall => true )
  if $mesos::bool_firewall == true and $mesos::port != '' {
    firewall { "mesos_${mesos::protocol}_${mesos::port}":
      source      => $mesos::firewall_src,
      destination => $mesos::firewall_dst,
      protocol    => $mesos::protocol,
      port        => $mesos::port,
      action      => 'allow',
      direction   => 'input',
      tool        => $mesos::firewall_tool,
      enable      => $mesos::manage_firewall,
      noop        => $mesos::bool_noops,
    }
  }


  ### Debugging, if enabled ( debug => true )
  if $mesos::bool_debug == true {
    file { 'debug_mesos':
      ensure  => $mesos::manage_file,
      path    => "${settings::vardir}/debug-mesos",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
      noop    => $mesos::bool_noops,
    }
  }

}
