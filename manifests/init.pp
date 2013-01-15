class geodjango ($database='template_postgis', $postgis_version='1.5') {
    Exec {
	    path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
    }

    package {[
        "libproj-dev",
        "binutils",
        "postgresql-9.1-postgisis",
        "gdal-bin",]:
        ensure => installed,
    }

    file {"/tmp/install-postgis.sh":
        ensure => present,
        source => "puppet:///modules/geodjango/create_template_postgis-$postgis_version.sh",
        owner => postgres
    }

    # This is only needed for PostGIS < 2.0
    exec {"postgis-install":
	    command => "/bin/bash /tmp/install-postgis.sh",
		user => "postgres",
		unless => "psql -l | grep $database",
        require => File["/tmp/install-postgis.sh"]
	}
}
