# @summary Manage postgresql datasource
#
# @api private
class keycloak::datasource::postgresql (
  $module_source = 'keycloak/database/postgresql/module.xml.erb',
) {
  assert_private()

  $module_dir = "${keycloak::install_dir}/keycloak-${keycloak::version}/modules/system/layers/keycloak/org/postgresql/main"

  include ::postgresql::lib::java

  exec { "mkdir -p ${module_dir}":
    path    => '/usr/bin:/bin',
    creates => $module_dir,
    user    => $keycloak::user,
    group   => $keycloak::group,
  }
  -> file { $module_dir:
    ensure => 'directory',
    owner  => $keycloak::user,
    group  => $keycloak::group,
    mode   => '0755',
  }

  file { "${module_dir}/postgresql-jdbc.jar":
    ensure  => 'file',
    source  => $keycloak::postgresql_jar_source,
    owner   => $keycloak::user,
    group   => $keycloak::group,
    mode    => '0644',
    require => Class['postgresql::lib::java'],
  }

  file { "${$module_dir}/module.xml":
    ensure => 'file',
    source => 'puppet:///modules/keycloak/database/postgresql/module.xml',
    owner  => $keycloak::user,
    group  => $keycloak::group,
    mode   => '0644',
  }

  if $keycloak::manage_datasource {
    include ::postgresql::server
    postgresql::server::db { $keycloak::datasource_dbname:
      user     => $keycloak::datasource_username,
      password => postgresql_password($keycloak::datasource_username, $keycloak::datasource_password),
    }
  }
}
