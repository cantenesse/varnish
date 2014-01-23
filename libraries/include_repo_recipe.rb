class Chef::Recipe
  def include_repo_recipe(platform)
    case platform
	when "debian"
      apt_repository "varnish-cache" do
		uri "http://repo.varnish-cache.org/#{node['platform']}"
		distribution node['lsb']['codename']
		components ["varnish-#{node['varnish']['version']}"]
		key "http://repo.varnish-cache.org/#{node['platform']}/GPG-key.txt"
	  end
	when "rhel"
      yum_repository 'varnish-cache' do
        url "http://repo.varnish-cache.org/redhat/varnish-3.0/el5/$basearch"
        gpgcheck false
        action :create
	  end
  	end
  end
end