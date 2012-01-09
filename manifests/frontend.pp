define haproxy::frontend ($order           = 30,
													$ip              = $ipaddress,
													$port            = '80',
													$bind_opts       = '',
													$mode            = 'http',
													$options         = [],
													$acls            = [],
													$redirects       = [],
													$use_backends    = [],
													$default_backend = false) {

	concat::fragment { "haproxy.cfg-frontend-${name}":
		target  => "${haproxy::params::configdir}/haproxy.cfg",
		order   => $order,
		content => template('haproxy/frontend.cfg.erb'),
	}
}
