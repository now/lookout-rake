# -*- coding: utf-8 -*-

require 'inventory/rake/tasks-1.0'

$:.unshift File.expand_path('../lib', __FILE__)
require 'lookout/rake-3.0'

Inventory::Rake::Tasks.define Lookout::Rake::Version, :gem => proc{ |_, s|
  s.author = 'Nikolai Weibull'
  s.email = 'now@bitwi.se'
  s.homepage = 'https://github.com/now/lookout-rake'
}
Lookout::Rake::Tasks::Test.new
