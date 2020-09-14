name 'integrate_managed_infra_with_nexus'

default_source :chef_repo, '/tmp/cookbooks'

cookbook 'chef-server', path: '/home/ec2-user/Infra-14Sept2020/chef-server'
cookbook 'chef-ingredient', path: '/home/ec2-user/Infra-14Sept2020/chef-ingredient'
cookbook 'managed_chef_server', path: '/home/ec2-user/Infra-14Sept2020/managed_chef_server-cookbook'
cookbook 'nexus_orgs', path: '/home/ec2-user/Infra-14Sept2020/nexus_orgs'
cookbook 'nexus_sync', path: '/home/ec2-user/Infra-14Sept2020/nexus_sync-cookbook'

run_list 'managed_chef_server::default', 'managed_chef_server::managed_organization', 'managed_chef_server::backup', 'nexus_orgs', 'managed_chef_server::cron'

override['mcs']['managed_user']['email'] = 'contoso@chef.io'
override['chef-server']['accept_license'] = true
override['mcs']['org']['name'] = 'contoso'

override['mcs']['data_collector']['proxy'] = true
override['mcs']['data_collector']['root_url'] = 'https://automate-url.com/data-collector/v0/'
override['mcs']['data_collector']['token'] = '<your-automate-token-here>'
override['mcs']['profiles']['root_url'] = 'https://automate-url.com'

override['chef-workstation']['package_source'] = '/home/ec2-user/Infra-10Sept2020/chef-workstation-0.17.5-1.el7.x86_64.rpm'
override['chef-server']['package_source'] = '/home/ec2-user/Infra-10Sept2020/chef-server-core-13.2.0-1.el7.x86_64.rpm'
override['chef-server']['version'] = '13.2.0'

# backup
default['mcs']['backup']['cron']['minute'] = '30'
default['mcs']['backup']['cron']['hour'] = '2'
default['mcs']['backup']['cron']['day'] = '*'
default['mcs']['backup']['cron']['month'] = '*'
default['mcs']['backup']['cron']['weekday'] = '*'

override['mcs']['backup']['dir'] = '/var/chef/infrabackups'

override['mcs']['cron']['policyfile_archive'] = '/home/ec2-user/Infra-14Sept2020/managed_chef_server-cookbook/policyfile-archive.tgz'

override['nexus_sync']['user'] = '<username>'
override['nexus_sync']['password'] = '<password>'

override['mcs']['skip_test'] = true