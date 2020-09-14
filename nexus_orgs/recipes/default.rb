#
# Cookbook:: nexus_orgs
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

# contoso
managed_organization 'contoso' do
  organization 'contoso'
  full_name 'CONTOSO Servers'
  email 'contoso@chef.io'
end

nexus_sync '/var/chef/contoso' do
  url 'http://nexus-server-url.com:8081/service/rest/v1/search/assets?group=/contoso' #location for contoso repo url in Nexus
  user node['nexus_sync']['user']
  password node['nexus_sync']['password']
end

policyfile_loader '/var/chef/contoso' do
  organization 'contoso'
end

# acme
managed_organization 'acme' do
  organization 'acme'
  full_name 'ACME Servers'
  email 'acme@chef.io'
end

nexus_sync '/var/chef/acme' do
  url 'http://nexus-server-url.com:8081/service/rest/v1/search/assets?group=/acme' #location for acme repo url in Nexus
  user node['nexus_sync']['user']
  password node['nexus_sync']['password']
end

policyfile_loader '/var/chef/acme' do
  organization 'acme'
end
