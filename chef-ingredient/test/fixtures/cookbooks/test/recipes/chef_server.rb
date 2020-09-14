node.default['chef_server']['fqdn'] = 'localhost'

chef_server node['chef_server']['fqdn'] do
  version :latest
  config <<-EOS
api_fqdn '#{node['chef_server']['fqdn']}'
oc_id['applications'] = {
  "supermarket"=>{"redirect_uri"=>"https://supermarket.services.com/auth/chef_oauth2/callback"}
}
  EOS
  addons manage: { config: '' },
         "push-jobs-server": { config: '' }
  accept_license true
  data_collector_url 'https://automate.services.com/data-collector/v0/' if search(:node, 'name:automate-centos-68', filter_result: { 'name' => ['name'] })
end
