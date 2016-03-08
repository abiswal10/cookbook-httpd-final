user 'httpd' do
	action :create
	comment "httpd user"
	
	home '/secondary/users/appuser'
	shell "/bin/bash"
end

group 'httpd' do
	action :modify
	members 'httpd'
	append true
end

directory node[:httpd][:home][:dir] do
	owner "httpd"
	group "httpd"
	mode 00755
	action :create
end

