class role::tupperware {
  file_line { 'puppet masters':
    path => '/etc/hosts',
    line => '10.98.10.170 puppet',
  }
  docker::image {'puppet/puppet-agent-centos':

  }
  docker::run {'webserverone':
    image    => 'puppet-agent-centos',
    command  => '/opt/puppetlabs/bin/puppet config set server ip-10-98-10-170.us-west-2.compute.internal --section agent; /opt/puppetlabs/bin/puppet agent -t',
    hostname => 'webserverone.container',
    ports    => ['80:80'],
  }
}
