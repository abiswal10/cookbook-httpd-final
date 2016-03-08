                
default['httpd'].tap do | httpd |

                httpd['home_dir'] = '/srv/www/httpd'
		httpd['log_dir'] = '/srv/www/logs'
		httpd['config_dir'] = '/srv/www/conf'
		
	
		httpd['port'] = 80
		httpd['proxy_port'] = nil
		httpd['redirect_port'] = 8443
		httpd['ssl_proxy_port'] = nil
		httpd['ajp_port'] = 8009
		httpd['shutdown_port'] = 8005
		httpd['java_options'] = nil #Can be replaced depending on requirements
		httpd['package_dir'] = 'httpd-installer'
		httpd['package_url'] = 'https://s3.amazonaws.com/dess-recipe-repo/Ashok/httpd.tar'

end

