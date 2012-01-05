# Class: haproxy::params
#
#
class haproxy::params {
	# TODO: refactor this var to a common module and make other module use it
	$os_suffix = $operatingsystem ? {
		/(?i)(Debian|Ubuntu)/ => 'debian',
		/(?i)(RedHat|CentOS)/ => 'redhat',
	}

	$install_mode = $haproxy_install_mode ? {
		'package' => 'package',
		'source'  => 'source',
		default   => 'package',
	}
	
	$version = $install_mode ? {
		'package' => $haproxy_version ? {
			''     => 'latest',
			default => $haproxy_version,
		},
		'source'  => $haproxy_version ? {
			''      => '1.4.16',
			default => $haproxy_version,
		},
	}
	
	# Installing from source
	$unpack_root = $haproxy_unpack_root ? {
		''      => '/usr/src',
		default => $haproxy_unpack_root,
	}
	
	$configdir = $haproxy_configdir ? {
		''      => '/etc/haproxy',
		default => $haproxy_configdir,
	}
	
	$homedir = $haproxy_homedir ? {
		''      => '/var/lib/haproxy',
		default => $haproxy_homedir,
	}
	
	$user = $haproxy_user ? {
		''      => 'haproxy',
		default => $haproxy_user,
	}
	
	$group = $haproxy_group ? {
		''      => 'haproxy',
		default => $haproxy_group,
	}
	
	$uid = $haproxy_uid ? {
		''      => '200',
		default => $haproxy_uid,
	}
	
	$gid = $haproxy_gid ? {
		''      => '200',
		default => $haproxy_gid,
	}
	
	# Config file builder: concat or augeas
	$config_builder = $haproxy_config_builder ? {
		'concat' => 'concat',
		'augeas' => 'augeas',
		default  => 'concat',
	}
	
	# Default global params
	$global_loghost = $haproxy_global_loghost ? {
		''      => '127.0.0.1',
		default => $haproxy_global_loghost,
	}
	
	$global_logfacilities = $haproxy_global_logfacilities ? {
		''      => [ { name => 'local0', params => '' }, { name => 'local1', params => 'notice' } ],
		default => $haproxy_global_logfacilities,
	}
	
	$global_maxconn = $haproxy_global_maxconn ? {
		''      => '4096',
		default => $haproxy_global_maxconn,
	}
	
	$global_daemon = $haproxy_global_daemon ? {
		'true'  => true,
		'false' => false,
		default => true,
	}
	
	$global_debug = $haproxy_global_debug ? {
		'true'  => true,
		'false' => false,
		default => false,
	}
	
	$global_quiet = $haproxy_global_quiet ? {
		'true'  => true,
		'false' => false,
		default => false,
	}
	
	$global_chroot = $haproxy_global_chroot

	$global_stats_socket = $haproxy_global_stats_socket ? {
		'true'	=> true,
		'false'	=> false,
		default	=> false,
	}

	$global_stats_socket_path = $haproxy_global_stats_socket_path ? {
		''		=> '/tmp/haproxy.sock',
		default	=> $haproxy_global_stats_socket_path,
	}

	$global_stats_socket_mode = $haproxy_global_stats_socket_mode ? {
		''		=> 600,
		default	=> $haproxy_global_stats_socket_mode,
	}
	
	$global_stats_socket_level = $haproxy_global_stats_socket_level ? {
		''		=> 'operator',
		default	=> $haproxy_global_stats_socket_level,
	}
	
	# Default defaults params
	$defaults_log = $haproxy_defaults_log ? {
		''      => 'global',
		default => $haproxy_defaults_log,
	}
	
	$defaults_mode = $haproxy_defaults_mode ? {
		''      => 'http',
		default => $haproxy_defaults_mode,
	}
	
	$defaults_retries = $haproxy_defaults_retries ? {
		''      => '3',
		default => $haproxy_defaults_retries,
	}
	
	$defaults_maxconn = $haproxy_defaults_maxconn ? {
		''      => '2000',
		default => $haproxy_defaults_maxconn,
	}
	
	$defaults_contimeout = $haproxy_defaults_contimeout ? {
		''      => '5000',
		default => $haproxy_defaults_contimeout,
	}
	
	$defaults_clitimeout = $haproxy_defaults_clitimeout ? {
		''      => '50000',
		default => $haproxy_defaults_clitimeout,
	}
	
	$defaults_srvtimeout = $haproxy_defaults_srvtimeout ? {
		''      => '50000',
		default => $haproxy_defaults_srvtimeout,
	}
	
	$defaults_options = $haproxy_defaults_options ? {
		''      => [ 'httplog', 'dontlognull', 'redispatch' ],
		default => $haproxy_defaults_options,
	}
	
	$defaults_stats = $haproxy_defaults_stats ? {
		'true'  => true,
		'false' => false,
		default => false,
	}
	
	$defaults_stats_uri = $haproxy_defaults_stats_uri ? {
		''      => '/lb?stats',
		default => $haproxy_defaults_stats_uri,
	}
	
	$defaults_stats_realm = $haproxy_defaults_stats_realm ? {
		''      => 'HAproxy\ Load\ Balancer\ Statistics',
		default => $haproxy_defaults_stats_realm,
	}
	
	$defaults_stats_auth_user = $haproxy_defaults_stats_auth_user ? {
		''      => 'admin',
		default => $haproxy_defaults_stats_auth_user,
	}
	
	$defaults_stats_auth_password = $haproxy_defaults_stats_auth_password ? {
		''      => 'changeme',
		default => $haproxy_defaults_stats_auth_password,
	}
}
