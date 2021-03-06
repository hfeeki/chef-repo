#
# Cookbook Name:: web
# Recipe:: default
#
# Copyright 2012, Jeremiah Snapp
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

include_recipe"apache2"

include_recipe"apache2::mod_ssl"
apache_site "default-ssl" do
  enable true
end

include_recipe"apache2::mod_proxy"
include_recipe"apache2::mod_proxy_http"
include_recipe"apache2::mod_rewrite"
include_recipe"apache2::mod_php5"
include_recipe"apache2::mod_perl"
include_recipe"apache2::mod_python"

package "libapache2-mod-auth-cas" do
  action :install
end
apache_module "auth_cas" do
  enable true
end
