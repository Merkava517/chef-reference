#
# Cookbook Name:: provision
# Recipes:: cleanup
#
# Copyright (C) 2015, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'provision::_setup'

machine_batch do
  action :destroy
  %w(analytics server-frontend server-backend supermarket compliance).each do |m|
    machine m
  end
end

directory '/tmp/ssh' do
  recursive true
  action :delete
end

directory '/tmp/stash' do
  recursive true
  action :delete
end
