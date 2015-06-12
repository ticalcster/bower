actions :install, :uninstall
default_action :install

attribute :package, :name_attribute => true
attribute :version, :kind_of => String
attribute :path, :kind_of => String
attribute :options, :kind_of => Hash, :default => {}

attribute :user, :kind_of => String
attribute :group, :kind_of => String