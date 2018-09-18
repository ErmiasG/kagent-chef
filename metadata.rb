maintainer       "Jim Dowling"
maintainer_email "jdowling@kth.se"
name             "kagent"
license          "GPL 2.0"
description      "Installs/Configures the Karamel agent used by Hops"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.6.0"
source_url       "https://github.com/karamelchef/kagent-chef"


%w{ ubuntu debian centos }.each do |os|
  supports os
end

depends 'openssl'
depends 'sudo'
depends 'hostsfile'
depends 'ntp'
depends 'conda'
depends 'magic_shell'


recipe "kagent::install", "Installs the Karamel agent and python dependencies"
recipe "kagent::default", "Installs and configures the Karamel agent, including anaconda"
recipe "kagent::hops", "Installs and configures the Karamel agent for hops"
recipe "kagent::purge", "Deletes the Karamel agent files"
recipe "kagent::anaconda", "Installs and configures anaconda"

attribute "kagent/user",
          :description => "Username to run kagent as",
          :type => 'string'

attribute "kagent/group",
          :description => "group to run kagent as",
          :type => 'string'

attribute "kagent/dir",
          :description => "Installation directory for kagent",
          :type => 'string'

attribute "kagent/dashboard/ip",
          :description => " Ip address for Dashboard REST API",
          :type => 'string'

attribute "kagent/dashboard/port",
          :description => " Port for Dashboard REST API",
          :type => 'string'

attribute "kagent/enabled",
          :description => "Kagent enabled: default 'true'. Set to 'false' to disable it.",
          :type => 'string'

attribute "kagent/dns",
          :description => "Default 'false'. Set to 'true' to use fully qualified domain names for kagent hosts in Hopsworks.",
          :type => 'string'

attribute "kagent/hostid",
          :description => " One-time password used when registering the host",
          :type => 'string'

attribute "kagent/name",
          :description => "Cookbook name",
          :type => 'string'

attribute "kagent/password",
          :description => "Agent's password - needed to call REST APIs on the kagent",
          :type => 'string'

attribute "kagent/rest_api/user",
          :description => "kagent REST API username",
          :type => "string"

attribute "kagent/rest_api/password",
          :description => "kagent REST API  password",
          :type => "string"

attribute "kagent/dashboard/user",
          :description => "kagent username to register with server",
          :type => "string"

attribute "kagent/hostname",
          :description => "hostname used to register with hopsworks",
          :type => "string"

attribute "kagent/dashboard/password",
          :description => "kagent password to register with server",
          :type => "string"

attribute "ndb/mysql_port",
          :description => "Port for the mysql server",
          :type => "string"

attribute "ndb/mysql_socket",
          :description => "Socket for the mysql server",
          :type => "string"

attribute "systemd",
          :description => "Use systemd startup scripts, default 'true'",
          :type => "string"

attribute "kagent/network/interface",
          :description => "Define the network intefaces (eth0, enp0s3)",
          :type => "string"

attribute "kagent/network/infiniband",
          :description => "Define the infiniband intefaces (ib0)",
          :type => "string"

attribute "ntp/install",
          :description => "Install Network Time Protocol (default: false)",
          :type => "string"

attribute "services/enabled",
          :description => "Default 'false'. Set to 'true' to enable daemon services, so that they are started on a host restart.",
          :type => "string"

attribute "install/dir",
          :description => "Default ''. Set to a base directory under which all hops services will be installed.",
          :type => "string"

attribute "install/user",
          :description => "User to install the services as",
          :type => "string"

attribute "install/upgrade",
          :description => "User to upgrade the software",
          :type => "string"

attribute "install/ssl",
          :description => "Is SSL turned on for all services?",
          :type => "string"

attribute "install/cleanup_downloads",
          :description => "Remove any zipped binaries that were downloaded and used to install services",
          :type => "string"

attribute "install/addhost",
          :description => "Indicates that this host will be added to an existing Hops cluster.",
          :type => "string"

attribute "install/version",
          :description => "Hopsworks version.",
          :type => "string"

attribute "install/versions",
          :description => "Comma-separated list of previous versions of Hopsworks.",
          :type => "string"

attribute "hops/yarn/user",
          :description => "Yarn user for conda",
          :type => "string"

attribute "hops/group",
          :description => "Haodop group for conda",
          :type => "string"




attribute "smtp/host",
          :description => "Ip Address/hostname of SMTP server (default is smtp.gmail.com)",
          :type => 'string'

attribute "smtp/port",
          :description => "Port of SMTP server (default is 587)",
          :type => 'string'

attribute "smtp/ssl_port",
          :description => "SSL port of SMTP server (default is 465)",
          :type => 'string'

attribute "smtp/email",
          :description => "Email account to send notifications from. ",
          :required => "required",
          :type => 'string'

attribute "smtp/email_password",
          :description => "Password for email account. ",
          :required => "required",
          :type => 'string'


attribute "certs/dir",
          :description => "Installation directory for ssl/tls certs",
          :type => 'string'

attribute "hops/dir",
          :description => "Installation directory for Hops",
          :type => 'string'

attribute "jupyter/python",
          :description => "'true' (default) to enable the python interpreter, 'false' to disable it (more secure). ",
          :type => 'string'
