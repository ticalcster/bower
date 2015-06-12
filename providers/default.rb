include Bower::Helper

action :install do
  Chef::Log.info("  Command: #{node[:bower][:executable]} #{bower_config} install #{new_resource.name}")
  Chef::Log.info("  Package Installed: #{package_installed?}")
  execute "install Bower package #{new_resource.name}" do
    cwd new_resource.path
    command "#{node[:bower][:executable]} #{bower_config} install #{new_resource.name}"
    user new_resource.user
    not_if { package_installed? }
  end
end

action :uninstall do
  Chef::Log.info("Trying to install.")
  #execute "uninstall NPM package #{new_resource.package}" do
  #  cwd new_resource.path
  #  command "npm uninstall #{npm_options}"
  #  user new_resource.user
  #  group new_resource.group
  #  environment 'HOME' => ::Dir.home(new_resource.user), 'USER' => new_resource.user if new_resource.user
  #  only_if { package_installed? }
  #end
end

def package_installed?
  Chef::Log.info("  Package Installed Vars: #{new_resource.package}, #{new_resource.version}, #{new_resource.path}")
  new_resource.package && bower_package_installed?(new_resource.package, new_resource.version, new_resource.path)
end

def bower_config
  config = node[:bower][:options].merge(new_resource.options)
  config_array = []
  bower_config_node(config_array, config)
  config_line = ''
  #options << ' -global' unless new_resource.path
  config_array.each do |line|
    config_line << line
  end
  return config_line # << " #{bower_package}"
end

def bower_config_node(config_array, config, prefix=' --')
  config.each do |option, value|
    if value.is_a?(String)
      config_array.push << "#{prefix}#{option}=#{value}"
    elsif value.is_a?(Hash)
      bower_config_node(config_array, value, "#{prefix}#{option}.")
    end
  end
end

def initialize(*args)
  super
  Chef::Log.info("Bower initialize.")
  @run_context.include_recipe 'bower::default'
end
