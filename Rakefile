# -*- coding: utf-8 -*-

require 'inventory-rake-1.0'

$:.unshift File.expand_path('../lib', __FILE__)
require 'lookout-rake-3.0'

Inventory::Rake::Tasks.define Lookout::Rake::Version

Inventory::Rake::Tasks.unless_installing_dependencies do
  Lookout::Rake::Tasks::Test.new

  require 'inventory-rake-tasks-yard-1.0'
  Inventory::Rake::Tasks::YARD.new do |t|
    t.options += %w'--plugin yard-heuristics-1.0'
    t.globals[:source_code_url] = 'https://github.com/now/%s/blob/v%s/%%s#L%%d' % [t.inventory.package, t.inventory]
  end
end
