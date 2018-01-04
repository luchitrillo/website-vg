# Apache

apt_package 'apache2' do
  version '2.4.18-2ubuntu3.2'
end

service 'apache2' do
  action :enable
end

# Binaries

apt_package %w(php php-gd libapache2-mod-php php-mysql php-curl php-mbstring php-mcrypt php-xml php-xmlrpc) do
  version '1:7.0+35ubuntu6'
end

# Document Root

%w[/var /var/www /var/www/dotcom-v3].each do |dir|
  directory dir do
    mode 0775
    owner 'deployer'
    group 'www-data'
    recursive true
  end
end

# Template Files

template '/etc/apache2/apache2.conf' do
  source 'apache2.conf.erb'
  mode '0644'
  owner 'www-data'
  group 'www-data'
  variables({
    server_name: node['fis-dotcom-v3']['web_platform_suite']
  })
  notifies :restart, 'service[apache2]'
end

template '/etc/apache2/sites-available/000-default.conf' do
  source '000-default.conf.erb'
  mode '0644'
  owner 'www-data'
  group 'www-data'
  variables({
    server_name: node['fis-dotcom-v3']['web_platform_suite']
  })
  notifies :restart, 'service[apache2]'
end

cookbook_file '/etc/apache2/mods-available/dir.conf' do
  mode '0644'
  owner 'root'
  group 'root'
  action :create
  notifies :restart, 'service[apache2]'
end

# Adjustements

execute 'enable_apache_rewrite_module' do
  command 'a2enmod rewrite'
  user 'root'
  notifies :restart, 'service[apache2]'
end

