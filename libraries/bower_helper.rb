module Bower
  module Helper
    def bower_list(path = nil)
      if path
        cmd = Mixlib::ShellOut.new('bower list --allow-root', :cwd => path)
      else
        cmd = Mixlib::ShellOut.new('bower list --allow-root')
      end
      list = {}
      cmd.run_command.stdout.scan(/(?<package>\S+)#(?<version>\d\S+)/m) do |package, version|
        list[package] = version
      end

      return list
    end

    def version_valid?(list, package, version)
      Chef::Log.info("  Valid 'list[key]': #{list[package]}")
      Chef::Log.info("  Valid 'package': #{package}")
      Chef::Log.info("  Valid 'version': #{version}")
      Chef::Log.info("  Valid 'version != nil': #{version != nil}")
      Chef::Log.info("  Valid 'list[package] == version': #{list[package] == version}")

      (version != nil ? list[package] == version : true)
    end

    def bower_package_installed?(package, version = nil, path = nil)
      list = bower_list(path)
      Chef::Log.info("  Installed 'list[#{package}]': #{list[package]}")
      # Return true if package installed and installed to good version
      (!list.nil?) && list.key?(package) && version_valid?(list, package, version)
    end
  end
end
