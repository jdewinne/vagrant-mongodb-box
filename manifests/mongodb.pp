# Install Mongo DB



class mongodb {
    include apt

    exec { 'apt-get update':
      command => 'apt-get update'
    }

    apt::key { 'mongodb':
      key        => '7F0CEB10',
      key_source => 'http://docs.mongodb.org/10gen-gpg-key.asc',
    }

    apt::source {
      'mongodb':
        location   => 'http://downloads-distro.mongodb.org/repo/ubuntu-upstart',
        release    => 'dist',
        repos      => '10gen',
        key        => '7F0CEB10',
        key_server => 'pgp.mit.edu',
        include_src => false,
        require => Apt::Key['mongodb']
    }

    package {
      'mongodb-org':
        ensure  => installed,
        require => [Exec['apt-get update'],Apt::Source['mongodb']],
    }

}

include mongodb
