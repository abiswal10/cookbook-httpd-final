service 'httpd' do
  action :nothing
end



directory "#{node['httpd']['home_dir']}" do
	recursive true
	owner "httpd"
        group "httpd"
	action :create
	mode 0755
end

directory "#{node['httpd']['config_dir']}" do
	recursive true
	owner "httpd"
	group "httpd"
	action :create
	mode 0755
end

directory "#{node['httpd']['log_dir']}" do
	recursive true
	owner "httpd"
        group "httpd"
	action :create
	mode 0755
end

remote_file '/tmp/httpd.tar.gz' do
  source node['httpd']['package_url']
  action :create
  not_if { ::File.exist?('tmp/httpd.tar.gz') }
end



extract_path = "#{node['httpd']['home_dir']}"

bash 'extract_tomcat_tar' do
	code <<-EOH
		mkdir /tmp/temp
		tar -zxvf /tmp/httpd.tar.gz -C /tmp/temp/
		mv /tmp/temp/*/* #{extract_path}
		rm -rf /tmp/temp
	EOH
end


template "/etc/init.d/httpd" do
  source "httpd_init.erb"
  mode  744
  action :create
end


template "#{node['httpd']['config_dir']}/httpd.conf" do
  source 'httpd.conf.erb'
  action :create
  notifies :restart, 'service[httpd]', :delayed
end

execute "run start up script" do
  command "/srv/www/httpd/bin/apachectl start"
end

service "httpd" do
  supports :status => :true, :restart => :true, :reload => :true
  action [ :enable ]
end

