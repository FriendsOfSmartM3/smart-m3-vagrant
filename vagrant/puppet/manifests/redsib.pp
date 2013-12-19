class redsib {
    $base = '/home/vagrant/redsib_0.9/deb_amd64'

    package {'libwhiteboard':
        provider => dpkg,
        ensure => latest,
        source => "$base/libwhiteboard_2.3_amd64.deb"
    }

    package {'libwhiteboard-dev':
        provider => dpkg,
        ensure => latest,
        source => "$base/libwhiteboard-dev_2.3_amd64.deb"
    }

    package {'whiteboard':
        provider => dpkg,
        ensure => latest,
        source => "$base/whiteboard_2.0-beta1_amd64.deb"
    }

    package {'whiteboard-sib-access':
        provider => dpkg,
        ensure => latest,
        source => "$base/whiteboard-sib-access_2.0-beta1_amd64.deb"
    }


    package {'sib-tcp':
        provider => dpkg,
        ensure => latest,
        source => "$base/sib-tcp_0.81_amd64.deb"
    }

    package {'redsibd':
        provider => dpkg,
        ensure => latest,
        source => "$base/redsibd_0.9.01_amd64.deb"
    }

    Package['libwhiteboard']->Package['libwhiteboard-dev']->Package['whiteboard']->Package['whiteboard-sib-access']->Package['sib-tcp']->Package['redsibd']
}
