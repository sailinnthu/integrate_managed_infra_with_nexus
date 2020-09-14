# nexus_orgs

## metadata.rb
depends 'nexus_sync'

```ruby
nexus_sync '/var/chef/contoso' do
  url 'https://sonatype-nexus-repo.com.sg:8443/service/rest/v1/search/assets?group=/contoso' #location for contoso repo url in Nexus
  user node['nexus_sync']['user']
  password node['nexus_sync']['password']
end
```