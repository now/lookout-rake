# -*- coding: utf-8 -*-

require 'inventory-1.0'

module Lookout::Rake
  Version = Inventory.new(3, 0, 2){
    def dependencies
      super + Inventory::Dependencies.new{
        development 'inventory-rake', 1, 4, 0
        development 'inventory-rake-tasks-yard', 1, 3, 0
        development 'lookout', 3, 0, 0
        development 'yard', 0, 8, 0
        development 'yard-heuristics', 1, 1, 0
        runtime 'rake', 0, 9, 2, :feature => 'rake'
      }
    end

    def package_libs
      %w[tasks.rb
         tasks/test.rb]
    end

    def additional_libs
      super + %w[lookout/rake-3.0.rb
                 lookout-rake-3.0/tasks/test/loader.rb]
    end

    def unit_tests
      super - %w[lookout/rake-3.0.rb
                 lookout-rake-3.0/tasks/test/loader.rb]
    end
  }
end
