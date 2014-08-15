log "Setup NewRelic"

directory '/opt/newrelic'

execute "get-package-object" do
  command "aws s3 cp --region=#{node[:newrelic][:bucket_region]} #{node[:newrelic][:package_object]} /opt/newrelic/newrelic.jar"
  not_if  { File.exist?('/opt/newrelic/newrelic.jar') }
end

execute "get-configuration" do
  command "aws s3 cp --region=#{node[:newrelic][:bucket_region]} #{node[:newrelic][:config_object]} /opt/newrelic/newrelic.yml"
  not_if  { File.exist?('/opt/newrelic/newrelic.yml') }
end