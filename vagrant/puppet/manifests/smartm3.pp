import 'preliminary.pp'
import 'redsib.pp'

File['/etc/init.d/report-service'] -> Service['report-service']

exec {'download-redsib':
    command => '/usr/bin/wget http://garr.dl.sourceforge.net/project/smart-m3/Smart-M3-RedSIB_0.9/redsib_0.9.tar.gz -O redsib.tar.gz',
    creates => '/home/vagrant/redsib.tar.gz'
}

exec {'unpack-redsib': 
    command => '/bin/tar xf redsib.tar.gz',
    creates => '/home/vagrant/redsib_0.9/',
    require => Exec['download-redsib']
}


$virtuosopkg = ['unixodbc', 'virtuoso-opensource']
package{$virtuosopkg: 
    ensure => "installed"
}

include preliminary
include redsib

Exec['unpack-redsib']->Class['preliminary']->Class['redsib']
