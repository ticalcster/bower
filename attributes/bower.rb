#
# Cookbook Name:: bower
# Attributes:: bower
#
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default[:bower][:version] = nil
default[:bower][:executable] = 'bower' # 'bower' vs '/usr/bin/env bower'

default[:bower][:bower_file] = nil # bower.js file
default[:bower][:config_file] = nil # .bowerrc file # Maybe note needed.
default[:bower][:options] = {
    'allow-root' => 'true',
    :config => {
        :interactive => 'false'
    }
}
