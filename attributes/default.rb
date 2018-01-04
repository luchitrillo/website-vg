case node.chef_environment

when 'production'
  default['fis-dotcom-v3']['domain_name'] = 'flatironschool.com'
  #default['fis-dotcom-v3']['mysql_root_password'] = 'foo'
  # wordpress 
  default['wordpress']['db']['root_password'] = node['wordpress']['db']['root_password']
  default['wordpress']['server_name'] = node['fis-dotcom-v3']['domain_name']

when 'qa'
  default['fis-dotcom-v3']['domain_name'] = 'qa-dotcom-v3-01.fe.flatironschool.com'
  default['fis-dotcom-v3']['mysql_root_password'] = 'foo'
  default['fis-dotcom-v3']['db_platform_suite'] = 'db-ubuntu-1604'
  default['fis-dotcom-v3']['web_platform_suite'] = 'web-ubuntu-1604'
  default['fis-dotcom-v3']['cache_platform_suite'] = 'cache-ubuntu-1604'
  # wordpress 
  default['wordpress']['db']['root_password'] = node['wordpress']['db']['root_password']
  default['wordpress']['server_name'] = node['fis-dotcom-v3']['domain_name']

end

default['apache']['user'] = 'deployer'
default['apache']['group'] = 'www-data'

default['wordpress']['install']['user'] = node['apache']['user']
default['wordpress']['install']['group'] = node['apache']['group']


