class role::tupperware {
  file_line { 'puppet masters':
    path => '/etc/hosts',
    line => '10.98.10.170 puppet',
  }
  docker::image {'centos':

  }
  docker::run {'webserverone':
    image    => 'centos',
    command  => 'curl -k https://ip-10-98-10-170.us-west-2.compute.internal:8140/packages/current/install.bash | sudo bash -s agent:server=ip-10-98-10-170.us-west-2.compute.internal',
    hostname => 'webserverone.container',
    ports    => ['80:80'],
  }
}
