====================
Geodjango for puppet
====================

Simple module to create a spatial PostGIS database for use with GeoDjango_.  All it
does is create a spatially-aware ``template_postgis`` database that you can use
as a template to create further databases.

.. _GeoDjango: https://docs.djangoproject.com/en/dev/ref/contrib/gis/install/postgis/

Works well with `puppet-postgres`_.

.. _`puppet-postgres`: https://github.com/akumria/puppet-postgres

Usage::

    class {"geodjango":
        require => Class["postgresql::server"]
    }

This is only for PostGIS < 2.0 where a SQL file needs to be loaded to create the
spatial database.
