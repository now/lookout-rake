# -*- coding: utf-8 -*-

require 'inventory-1.0'

module Lookout::Rake
  Version = Inventory.new(3, 0, 0){
    def dependencies
      super + Inventory::Dependencies.new{
        development 'inventory-rake', 1, 2, 0
        optional 'rake', 0, 9, 2
      }
    end

    def requires
      %w'
        rake
      '
    end

    def libs
      %w'
        lookout/rake/tasks.rb
        lookout/rake/tasks/test.rb
      '
    end

    def additional_libs
      super + %w'
        lookout/rake/tasks/test/loader.rb
      '
    end

    def unit_tests
      super - %w'
        lookout/rake/tasks/test/loader.rb
      '
    end
  }
end
