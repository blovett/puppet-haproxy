define haproxy::listen ($order               = 30,
												$ip                  = $ipaddress,
												$port                = '80',
												$bind_opts           = '',
												$mode                = 'http',
												$balance             = 'roundrobin',
												$maxconn             = '',
												$servers             = '',
												$options             = [],
												$hash_type           = 'manual',
												$query               = '',
												$server_maxconn      = '',
												$cookie              = false,
												$cookie_name         = '',
												$cookie_options      = '',
												$server_check        = false,
												$check_inter         = '',
												$check_fall          = '',
												$stats               = false,
												$stats_uri           = '/lb?stats',
												$stats_realm         = 'HAproxy\ Load\ Balancer\ Statistics',
												$stats_auth_user     = 'admin',
												$stats_auth_password = 'changeme') {

	# Some validations
	case $hash_type {
		'manual': {
			# A servers array has to specified
			if ( $servers == '' ) {
				fail('servers can\'t be empty if hash_type is manual')
			}
		}
		'mcollective': {
			# A mongo query has to be specified
			if ( $query == '') {
				fail('query can\'t empty if hash_type is mcollective')
			}
		}
		default: {
			fail("Invalid hash_type ${hash_type}. Accepted values are manual|mcollective")
		}
	}
	
	concat::fragment { "haproxy.cfg-listen-${name}":
		target  => "${haproxy::params::configdir}/haproxy.cfg",
		order   => $order,
		content => template('haproxy/listen.cfg.erb'),
	}
}
