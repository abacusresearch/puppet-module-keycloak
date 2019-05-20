# Reference
<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

**Classes**

_Public Classes_

* [`keycloak`](#keycloak): Manage Keycloak
* [`keycloak::config`](#keycloakconfig): Private class.
* [`keycloak::datasource::h2`](#keycloakdatasourceh2): Private class.
* [`keycloak::datasource::oracle`](#keycloakdatasourceoracle): Private class.
* [`keycloak::install`](#keycloakinstall): Private class.
* [`keycloak::params`](#keycloakparams): Private class.
* [`keycloak::service`](#keycloakservice): Private class.
* [`keycloak::sssd`](#keycloaksssd): Private class.

_Private Classes_

* `keycloak::datasource::mysql`: Manage MySQL datasource

**Defined types**

* [`keycloak::client_template`](#keycloakclient_template): Manage Keycloak client template
* [`keycloak::truststore::host`](#keycloaktruststorehost): Add host to Keycloak truststore

**Resource types**

* [`keycloak_api`](#keycloak_api): Type that configures API connection parameters for other keycloak types that use the Keycloak API.
* [`keycloak_client`](#keycloak_client): Manage Keycloak clients
* [`keycloak_client_protocol_mapper`](#keycloak_client_protocol_mapper): Manage Keycloak protocol mappers
* [`keycloak_client_scope`](#keycloak_client_scope): Manage Keycloak client scopes
* [`keycloak_conn_validator`](#keycloak_conn_validator): Verify that a connection can be successfully established between a node and the keycloak server.  Its primary use is as a precondition to pre
* [`keycloak_ldap_mapper`](#keycloak_ldap_mapper): Manage Keycloak LDAP attribute mappers
* [`keycloak_ldap_user_provider`](#keycloak_ldap_user_provider): Manage Keycloak LDAP user providers
* [`keycloak_protocol_mapper`](#keycloak_protocol_mapper): Manage Keycloak protocol mappers
* [`keycloak_realm`](#keycloak_realm): Manage Keycloak realms
* [`keycloak_sssd_user_provider`](#keycloak_sssd_user_provider): Manage Keycloak SSSD user providers

## Classes

### keycloak

Manage Keycloak

#### Examples

##### 

```puppet
include ::keycloak
```

#### Parameters

The following parameters are available in the `keycloak` class.

##### `version`

Data type: `String`

Version of Keycloak to install and manage.
Default is `4.2.1.Final`.

Default value: '4.2.1.Final'

##### `package_url`

Data type: `Optional[Variant[Stdlib::HTTPUrl, Stdlib::HTTPSUrl]]`

URL of the Keycloak download.
Default is based on version.

Default value: `undef`

##### `install_dir`

Data type: `Stdlib::Absolutepath`

Parent directory of where to install Keycloak.
Default is `/opt`.

Default value: '/opt'

##### `service_name`

Data type: `String`

Keycloak service name.
Default is `keycloak`.

Default value: $keycloak::params::service_name

##### `service_ensure`

Data type: `String`

Keycloak service ensure property.
Default is `running`.

Default value: 'running'

##### `service_enable`

Data type: `Boolean`

Keycloak service enable property.
Default is `true`.

Default value: `true`

##### `service_hasstatus`

Data type: `Boolean`

Keycloak service hasstatus parameter.
Default is `true`.

Default value: $keycloak::params::service_hasstatus

##### `service_hasrestart`

Data type: `Boolean`

Keycloak service hasrestart parameter.
Default is `true`.

Default value: $keycloak::params::service_hasrestart

##### `service_java_opts`

Data type: `Optional[Variant[String, Array]]`

Sets additional options to Java virtual machine environment variable.

Default value: `undef`

##### `manage_user`

Data type: `Boolean`

Defines if the module should manage the Linux user for Keycloak installation

Default value: `true`

##### `user`

Data type: `String`

Keycloak user name.
Default is `keycloak`.

Default value: 'keycloak'

##### `group`

Data type: `String`

Keycloak user group name.
Default is `keycloak`.

Default value: 'keycloak'

##### `user_uid`

Data type: `Optional[Integer]`

Keycloak user UID.
Default is `undef`.

Default value: `undef`

##### `group_gid`

Data type: `Optional[Integer]`

Keycloak user group GID.
Default is `undef`.

Default value: `undef`

##### `admin_user`

Data type: `String`

Keycloak administrative username.
Default is `admin`.

Default value: 'admin'

##### `admin_user_password`

Data type: `String`

Keycloak administrative user password.
Default is `changeme`.

Default value: 'changeme'

##### `manage_datasource`

Data type: `Boolean`

Boolean that determines if configured datasource will be managed.
Only applies when `datasource_driver` is `mysql`.
Default is `true`.

Default value: `true`

##### `datasource_driver`

Data type: `Enum['h2', 'mysql','oracle']`

Datasource driver to use for Keycloak.
Valid values are `h2`, `mysql` and 'oracle'
Default is `h2`.

Default value: 'h2'

##### `datasource_host`

Data type: `Optional[String]`

Datasource host.
Only used when datasource_driver is `mysql` or 'oracle'
Default is `localhost` for MySQL.

Default value: `undef`

##### `datasource_port`

Data type: `Optional[Integer]`

Datasource port.
Only used when datasource_driver is `mysql` or 'oracle'
Default is `3306` for MySQL.

Default value: `undef`

##### `datasource_url`

Data type: `Optional[String]`

Datasource url.
Default datasource URLs are defined in init class.

Default value: `undef`

##### `datasource_dbname`

Data type: `String`

Datasource database name.
Default is `keycloak`.

Default value: 'keycloak'

##### `datasource_username`

Data type: `String`

Datasource user name.
Default is `sa`.

Default value: 'sa'

##### `datasource_password`

Data type: `String`

Datasource user password.
Default is `sa`.

Default value: 'sa'

##### `proxy_https`

Data type: `Boolean`

Boolean that sets if HTTPS proxy should be enabled.
Set to `true` if proxying traffic through Apache.
Default is `false`.

Default value: `false`

##### `truststore`

Data type: `Boolean`

Boolean that sets if truststore should be used.
Default is `false`.

Default value: `false`

##### `truststore_hosts`

Data type: `Hash`

Hash that is used to define `keycloak::turststore::host` resources.
Default is `{}`.

Default value: {}

##### `truststore_password`

Data type: `String`

Truststore password.
Default is `keycloak`.

Default value: 'keycloak'

##### `truststore_hostname_verification_policy`

Data type: `Enum['WILDCARD', 'STRICT', 'ANY']`

Valid values are `WILDCARD`, `STRICT`, and `ANY`.
Default is `WILDCARD`.

Default value: 'WILDCARD'

##### `http_port`

Data type: `Integer`

HTTP port used by Keycloak.
Default is `8080`.

Default value: 8080

##### `theme_static_max_age`

Data type: `Integer`

Max cache age in seconds of static content.
Default is `2592000`.

Default value: 2592000

##### `theme_cache_themes`

Data type: `Boolean`

Boolean that sets if themes should be cached.
Default is `true`.

Default value: `true`

##### `theme_cache_templates`

Data type: `Boolean`

Boolean that sets if templates should be cached.
Default is `true`.

Default value: `true`

##### `realms`

Data type: `Hash`

Hash that is used to define keycloak_realm resources.
Default is `{}`.

Default value: {}

##### `client_templates`

Data type: `Hash`

Hash that is used to define keycloak::client_template resources.
Default is `{}`.

Default value: {}

##### `oracle_jar_file`

Data type: `Optional[String]`

Oracle JDBC driver to use. Only use if $datasource_driver is set to oracle
Default is not defined

Default value: `undef`

##### `oracle_jar_source`

Data type: `Optional[String]`

Source for Oracle JDBC driver - could be puppet link or local file on the node. Only use if $datasource_driver is set to oracle
Default is not set

Default value: `undef`

##### `with_sssd_support`

Data type: `Boolean`

Boolean that determines if SSSD user provider support should be available

Default value: `false`

##### `libunix_dbus_java_source`

Data type: `Variant[Stdlib::HTTPUrl, Stdlib::HTTPSUrl]`

Source URL of libunix-dbus-java

Default value: $keycloak::params::libunix_dbus_java_source

##### `install_libunix_dbus_java_build_dependencies`

Data type: `Boolean`

Boolean that determines of libunix-dbus-java build dependencies are managed by this module

Default value: `true`

##### `libunix_dbus_java_build_dependencies`

Data type: `Array`

Packages needed to build libunix-dbus-java

Default value: $keycloak::params::libunix_dbus_java_build_dependencies

##### `libunix_dbus_java_libdir`

Data type: `Stdlib::Absolutepath`

Path to directory to install libunix-dbus-java libraries

Default value: $keycloak::params::libunix_dbus_java_libdir

##### `jna_package_name`

Data type: `String`

Package name for jna

Default value: $keycloak::params::jna_package_name

##### `manage_sssd_config`

Data type: `Boolean`

Boolean that determines if SSSD ifp config for Keycloak is managed

Default value: `true`

##### `sssd_ifp_user_attributes`

Data type: `Array`

user_attributes to define for SSSD ifp service

Default value: []

##### `restart_sssd`

Data type: `Boolean`

Boolean that determines if SSSD should be restarted

Default value: `true`

##### `service_environment_file`

Data type: `Optional[Stdlib::Absolutepath]`

Path to the file with environment variables for the systemd service

Default value: `undef`

### keycloak::config

Private class.

### keycloak::datasource::h2

Private class.

### keycloak::datasource::oracle

Private class.

#### Parameters

The following parameters are available in the `keycloak::datasource::oracle` class.

##### `jar_file`

Data type: `Any`



Default value: $keycloak::oracle_jar_file

##### `jar_source`

Data type: `Any`



Default value: $keycloak::oracle_jar_source

##### `module_source`

Data type: `Any`



Default value: 'puppet:///modules/keycloak/database/oracle/module.xml'

### keycloak::install

Private class.

### keycloak::params

Private class.

### keycloak::service

Private class.

### keycloak::sssd

Private class.

## Defined types

### keycloak::client_template

Manage Keycloak client template

#### Examples

##### 

```puppet
keycloak::client_template { 'oidc-clients':
  realm => 'test',
}
```

#### Parameters

The following parameters are available in the `keycloak::client_template` defined type.

##### `realm`

Data type: `String`

Realm of the client template.

##### `resource_name`

Data type: `String`

Name of the client template resource

Default value: $name

##### `protocol`

Data type: `Enum['openid-connect', 'saml']`

The protocol of the client template.

Default value: 'openid-connect'

### keycloak::truststore::host

Add host to Keycloak truststore

#### Examples

##### 

```puppet
keycloak::truststore::host { 'ldap1.example.com':
  certificate => '/etc/openldap/certs/0a00000.0',
}
```

#### Parameters

The following parameters are available in the `keycloak::truststore::host` defined type.

##### `certificate`

Data type: `String`

Path to host certificate

##### `ensure`

Data type: `Enum['latest', 'present', 'absent']`

Host ensure value passed to `java_ks` resource.

Default value: 'latest'

## Resource types

### keycloak_api

Type that configures API connection parameters for other keycloak types that use the Keycloak API.

#### Examples

##### Define API access

```puppet
keycloak_api { 'keycloak'
  install_base => '/opt/keycloak',
  server       => 'http://localhost:8080/auth',
  realm        => 'master',
  user         => 'admin',
  password     => 'changeme',
}
```

#### Parameters

The following parameters are available in the `keycloak_api` type.

##### `name`

namevar

Keycloak API config

##### `install_base`

Install location of Keycloak

##### `server`

Auth URL for Keycloak server

Default value: http://localhost:8080/auth

##### `realm`

Realm for authentication

Default value: master

##### `user`

User for authentication

Default value: admin

##### `password`

Password for authentication

Default value: changeme

##### `use_wrapper`

Valid values: `true`, `false`

Boolean that determines if kcadm_wrapper.sh should be used

Default value: `false`

### keycloak_client

Manage Keycloak clients

#### Examples

##### Add a OpenID Connect client

```puppet
keycloak_client { 'www.example.com':
  ensure                => 'present',
  realm                 => 'test',
  redirect_uris         => [
    "https://www.example.com/oidc",
    "https://www.example.com",
  ],
  default_client_scopes => ['profile','email'],
  secret                => 'supersecret',
}
```

#### Properties

The following properties are available in the `keycloak_client` type.

##### `ensure`

Valid values: present, absent

The basic property that the resource should be in.

Default value: present

##### `protocol`

Valid values: openid-connect, saml

protocol

Default value: openid-connect

##### `client_authenticator_type`

clientAuthenticatorType

Default value: client-secret

##### `default_client_scopes`

defaultClientScopes

Default value: []

##### `optional_client_scopes`

optionalClientScopes

Default value: []

##### `full_scope_allowed`

Valid values: `true`, `false`

fullScopeAllowed

Default value: true

##### `enabled`

Valid values: `true`, `false`

enabled

Default value: true

##### `direct_access_grants_enabled`

Valid values: `true`, `false`

enabled

Default value: true

##### `public_client`

Valid values: `true`, `false`

enabled

Default value: false

##### `redirect_uris`

redirectUris

Default value: []

##### `web_origins`

webOrigins

Default value: []

#### Parameters

The following parameters are available in the `keycloak_client` type.

##### `name`

namevar

The client name

##### `client_id`

clientId. Defaults to `name`.

##### `id`

Id. Defaults to `client_id`

##### `realm`

realm

##### `secret`

secret

### keycloak_client_protocol_mapper

Manage Keycloak protocol mappers

#### Examples

##### Add email protocol mapper to test.example.com client in realm test

```puppet
keycloak_client_protocol_mapper { "email for test.example.com on test":
  claim_name     => 'email',
  user_attribute => 'email',
}
```

#### Properties

The following properties are available in the `keycloak_client_protocol_mapper` type.

##### `ensure`

Valid values: present, absent

The basic property that the resource should be in.

Default value: present

##### `protocol`

Valid values: openid-connect, saml

protocol

Default value: openid-connect

##### `user_attribute`

user.attribute. Default to `resource_name` for `type` `oidc-usermodel-property-mapper` or `saml-user-property-mapper`

##### `json_type_label`

json.type.label. Default to `String` for `type` `oidc-usermodel-property-mapper`.

##### `friendly_name`

friendly.name. Default to `resource_name` for `type` `saml-user-property-mapper`.

##### `attribute_name`

attribute.name Default to `resource_name` for `type` `saml-user-property-mapper`.

##### `claim_name`

claim.name

##### `id_token_claim`

Valid values: `true`, `false`

id.token.claim. Default to `true` for `protocol` `openid-connect`.

##### `access_token_claim`

Valid values: `true`, `false`

access.token.claim. Default to `true` for `protocol` `openid-connect`.

##### `userinfo_token_claim`

Valid values: `true`, `false`

userinfo.token.claim. Default to `true` for `protocol` `openid-connect`.

##### `attribute_nameformat`

attribute.nameformat

##### `single`

Valid values: `true`, `false`

single. Default to `false` for `type` `saml-role-list-mapper`.

#### Parameters

The following parameters are available in the `keycloak_client_protocol_mapper` type.

##### `name`

namevar

The protocol mapper name

##### `id`

Id.

##### `resource_name`

The protocol mapper name. Defaults to `name`.

##### `client`

client

##### `realm`

realm

##### `type`

Valid values: oidc-usermodel-property-mapper, oidc-full-name-mapper, saml-user-property-mapper, saml-role-list-mapper

protocolMapper.

Default is `oidc-usermodel-property-mapper` for `protocol` `openid-connect` and
`saml-user-property-mapper` for `protocol` `saml`.

### keycloak_client_scope

Manage Keycloak client scopes

#### Examples

##### Define a OpenID Connect client scope in the test realm

```puppet
keycloak_client_scope { 'email on test':
  protocol => 'openid-connect',
}
```

#### Properties

The following properties are available in the `keycloak_client_scope` type.

##### `ensure`

Valid values: present, absent

The basic property that the resource should be in.

Default value: present

##### `protocol`

Valid values: openid-connect, saml

protocol

Default value: openid-connect

##### `consent_screen_text`

consent.screen.text

##### `display_on_consent_screen`

Valid values: `true`, `false`

display.on.consent.screen

Default value: true

#### Parameters

The following parameters are available in the `keycloak_client_scope` type.

##### `name`

namevar

The client scope name

##### `resource_name`

The client scope name. Defaults to `name`.

##### `id`

Id. Defaults to `resource_name`.

##### `realm`

realm

### keycloak_conn_validator

Verify that a connection can be successfully established between a node
and the keycloak server.  Its primary use is as a precondition to
prevent configuration changes from being applied if the keycloak
server cannot be reached, but it could potentially be used for other
purposes such as monitoring.

#### Properties

The following properties are available in the `keycloak_conn_validator` type.

##### `ensure`

Valid values: present, absent

The basic property that the resource should be in.

Default value: present

#### Parameters

The following parameters are available in the `keycloak_conn_validator` type.

##### `name`

namevar

An arbitrary name used as the identity of the resource.

##### `keycloak_server`

The DNS name or IP address of the server where keycloak should be running.

Default value: localhost

##### `keycloak_port`

The port that the keycloak server should be listening on.

Default value: 8080

##### `use_ssl`

Whether the connection will be attemped using https

Default value: `false`

##### `test_url`

URL to use for testing if the Keycloak database is up

Default value: /auth/admin/serverinfo

##### `timeout`

The max number of seconds that the validator should wait before giving up and deciding that keycloak is not running; defaults to 15 seconds.

Default value: 30

### keycloak_ldap_mapper

Manage Keycloak LDAP attribute mappers

#### Examples

##### Add full name attribute mapping

```puppet
keycloak_ldap_mapper { 'full name for LDAP-test on test:
  ensure         => 'present',
  type           => 'full-name-ldap-mapper',
  ldap_attribute => 'gecos',
}
```

#### Properties

The following properties are available in the `keycloak_ldap_mapper` type.

##### `ensure`

Valid values: present, absent

The basic property that the resource should be in.

Default value: present

##### `ldap_attribute`

ldap.attribute

##### `user_model_attribute`

user.model.attribute

##### `is_mandatory_in_ldap`

is.mandatory.in.ldap. Defaults to `false` unless `type` is `full-name-ldap-mapper`.

##### `always_read_value_from_ldap`

Valid values: `true`, `false`

always.read.value.from.ldap. Defaults to `true` if `type` is `user-attribute-ldap-mapper`.

##### `read_only`

Valid values: `true`, `false`

read.only

Default value: true

##### `write_only`

Valid values: `true`, `false`

write.only.  Defaults to `false` if `type` is `full-name-ldap-mapper`.

#### Parameters

The following parameters are available in the `keycloak_ldap_mapper` type.

##### `name`

namevar

The LDAP mapper name

##### `id`

Id.

##### `resource_name`

The LDAP mapper name. Defaults to `name`

##### `type`

Valid values: user-attribute-ldap-mapper, full-name-ldap-mapper

providerId

Default value: user-attribute-ldap-mapper

##### `realm`

realm

##### `ldap`

parentId

### keycloak_ldap_user_provider

Manage Keycloak LDAP user providers

#### Examples

##### Add LDAP user provider to test realm

```puppet
keycloak_ldap_user_provider { 'LDAP on test':
  ensure             => 'present',
  users_dn           => 'ou=People,dc=example,dc=com',
  connection_url     => 'ldaps://ldap1.example.com:636 ldaps://ldap2.example.com:636',
  import_enabled     => false,
  use_truststore_spi => 'never',
}
```

#### Properties

The following properties are available in the `keycloak_ldap_user_provider` type.

##### `ensure`

Valid values: present, absent

The basic property that the resource should be in.

Default value: present

##### `enabled`

Valid values: `true`, `false`

enabled

Default value: true

##### `auth_type`

Valid values: none, simple

authType

Default value: none

##### `edit_mode`

Valid values: READ_ONLY, WRITABLE, UNSYNCED

editMode

Default value: READ_ONLY

##### `vendor`

Valid values: ad, rhds, tivoli, eDirectory, other

vendor

Default value: other

##### `use_truststore_spi`

Valid values: always, ldapsOnly, never

useTruststoreSpi

Default value: ldapsOnly

##### `users_dn`

usersDn

##### `connection_url`

connectionUrl

##### `priority`

priority

Default value: 0

##### `batch_size_for_sync`

batchSizeForSync

Default value: 1000

##### `username_ldap_attribute`

usernameLdapAttribute

Default value: uid

##### `rdn_ldap_attribute`

rdnLdapAttribute

Default value: uid

##### `uuid_ldap_attribute`

uuidLdapAttribute

Default value: entryUUID

##### `bind_dn`

bindDn

##### `bind_credential`

bindCredential

##### `import_enabled`

Valid values: `true`, `false`

importEnabled

Default value: true

##### `use_kerberos_for_password_authentication`

Valid values: `true`, `false`

useKerberosForPasswordAuthentication

##### `user_object_classes`

userObjectClasses

Default value: ['inetOrgPerson', 'organizationalPerson']

##### `search_scope`

Valid values: one, one_level, subtree, 1, 2, 1, 2

searchScope

##### `custom_user_search_filter`

Valid values: /.*/, absent

customUserSearchFilter

Default value: absent

#### Parameters

The following parameters are available in the `keycloak_ldap_user_provider` type.

##### `name`

namevar

The LDAP user provider name

##### `resource_name`

The LDAP user provider name. Defaults to `name`.

##### `id`

Id. Defaults to "`resource_name`-`realm`"

##### `realm`

parentId

### keycloak_protocol_mapper

Manage Keycloak protocol mappers

#### Examples

##### Add email protocol mapper to oidc-client client scope in realm test

```puppet
keycloak_protocol_mapper { "email for oidc-clients on test":
  claim_name     => 'email',
  user_attribute => 'email',
}
```

#### Properties

The following properties are available in the `keycloak_protocol_mapper` type.

##### `ensure`

Valid values: present, absent

The basic property that the resource should be in.

Default value: present

##### `protocol`

Valid values: openid-connect, saml

protocol

Default value: openid-connect

##### `user_attribute`

user.attribute. Default to `resource_name` for `type` `oidc-usermodel-property-mapper` or `saml-user-property-mapper`

##### `json_type_label`

json.type.label. Default to `String` for `type` `oidc-usermodel-property-mapper`.

##### `friendly_name`

friendly.name. Default to `resource_name` for `type` `saml-user-property-mapper`.

##### `attribute_name`

attribute.name Default to `resource_name` for `type` `saml-user-property-mapper`.

##### `claim_name`

claim.name

##### `id_token_claim`

Valid values: `true`, `false`

id.token.claim. Default to `true` for `protocol` `openid-connect`.

##### `access_token_claim`

Valid values: `true`, `false`

access.token.claim. Default to `true` for `protocol` `openid-connect`.

##### `userinfo_token_claim`

Valid values: `true`, `false`

userinfo.token.claim. Default to `true` for `protocol` `openid-connect`.

##### `attribute_nameformat`

attribute.nameformat

##### `single`

Valid values: `true`, `false`

single. Default to `false` for `type` `saml-role-list-mapper`.

#### Parameters

The following parameters are available in the `keycloak_protocol_mapper` type.

##### `name`

namevar

The protocol mapper name

##### `id`

Id.

##### `resource_name`

The protocol mapper name. Defaults to `name`.

##### `client_scope`

client scope

##### `realm`

realm

##### `type`

Valid values: oidc-usermodel-property-mapper, oidc-full-name-mapper, saml-user-property-mapper, saml-role-list-mapper

protocolMapper.

Default is `oidc-usermodel-property-mapper` for `protocol` `openid-connect` and
`saml-user-property-mapper` for `protocol` `saml`.

### keycloak_realm

Manage Keycloak realms

#### Examples

##### Add a realm with a custom theme

```puppet
keycloak_realm { 'test':
  ensure                   => 'present',
  remember_me              => true,
  login_with_email_allowed => false,
  login_theme              => 'my_theme',
}
```

#### Properties

The following properties are available in the `keycloak_realm` type.

##### `ensure`

Valid values: present, absent

The basic property that the resource should be in.

Default value: present

##### `display_name`

displayName

##### `display_name_html`

displayNameHtml

##### `login_theme`

loginTheme

Default value: keycloak

##### `account_theme`

accountTheme

Default value: keycloak

##### `admin_theme`

adminTheme

Default value: keycloak

##### `email_theme`

emailTheme

Default value: keycloak

##### `enabled`

Valid values: `true`, `false`

enabled

Default value: true

##### `remember_me`

Valid values: `true`, `false`

rememberMe

Default value: false

##### `login_with_email_allowed`

Valid values: `true`, `false`

loginWithEmailAllowed

Default value: true

##### `default_client_scopes`

Default Client Scopes

##### `optional_client_scopes`

Optional Client Scopes

##### `events_enabled`

Valid values: `true`, `false`

eventsEnabled

Default value: false

##### `events_expiration`

eventsExpiration

##### `events_listeners`

eventsListeners

Default value: ['jboss-logging']

##### `admin_events_enabled`

Valid values: `true`, `false`

adminEventsEnabled

Default value: false

##### `admin_events_details_enabled`

Valid values: `true`, `false`

adminEventsDetailsEnabled

Default value: false

#### Parameters

The following parameters are available in the `keycloak_realm` type.

##### `name`

namevar

The realm name

##### `id`

Id. Default to `name`.

### keycloak_sssd_user_provider

Manage Keycloak SSSD user providers

#### Examples

##### Add SSSD user provider to test realm

```puppet
keycloak_sssd_user_provider { 'SSSD on test':
  ensure => 'present',
}
```

#### Properties

The following properties are available in the `keycloak_sssd_user_provider` type.

##### `ensure`

Valid values: present, absent

The basic property that the resource should be in.

Default value: present

##### `enabled`

Valid values: `true`, `false`

enabled

Default value: true

##### `priority`

priority

Default value: 0

##### `cache_policy`

Valid values: DEFAULT, EVICT_DAILY, EVICT_WEEKLY, MAX_LIFESPAN, NO_CACHE

cachePolicy

Default value: DEFAULT

##### `eviction_day`

evictionDay

##### `eviction_hour`

evictionHour

##### `eviction_minute`

evictionMinute

##### `max_lifespan`

maxLifespan

#### Parameters

The following parameters are available in the `keycloak_sssd_user_provider` type.

##### `name`

namevar

The SSSD user provider name

##### `resource_name`

The SSSD user provider name. Defaults to `name`.

##### `id`

Id. Defaults to "`resource_name`-`realm`"

##### `realm`

parentId
