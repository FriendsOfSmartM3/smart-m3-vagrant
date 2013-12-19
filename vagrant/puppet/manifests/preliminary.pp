class preliminary {
    $base = '/home/vagrant/redsib_0.9/deb_amd64'

#    echo 'INSTALLING PRELIMINARY LIBRARIES'
#sudo cp -R redland /usr/local/lib
#sudo ldconfig

    $basepkg = ['libxslt1.1', 'libmhash2', 'dbus-x11']
    package {$basepkg:
        ensure => latest
    }

    package {'libyajl2':
        provider => dpkg,
        ensure => latest,
        source => "$base/libyajl2_2.0.4-4_amd64.deb"
    }

    package {'libraptor2':
        provider => dpkg,
        ensure => latest,
        source => "$base/libraptor2-0_2.0.10-1_amd64.deb"
    }

    package {'librasqal3':
        provider => dpkg,
        ensure => latest,
        source => "$base/librasqal3_0.9.30-1_amd64.deb"
    }

    package {'librdf0':
        provider => dpkg,
        ensure => latest,
        source => "$base/librdf0_1.0.16-UNIBO_1_amd64.deb"
    }

    $redland = '/usr/local/lib/redland'
    file {$redland:
        ensure => directory,
        source => "$base/redland",
        recurse => true
    }

    exec {'ldconfig':
        command => '/sbin/ldconfig'
    }

    Package[$basepkg]->Package['libyajl2']->Package['libraptor2']->Package['librasqal3']->Package['librdf0']->File[$redland]->Exec['ldconfig']
}
