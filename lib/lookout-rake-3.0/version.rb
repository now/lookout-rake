# -*- coding: utf-8 -*-

require 'inventory-1.0'

module Lookout::Rake
  Version = Inventory.new(3, 1, 0){
    authors{
      author 'Nikolai Weibull', 'now@disu.se'
    }

    homepage 'http://disu.se/software/lookout-rake'

    licenses{
      license 'LGPLv3+',
              'GNU Lesser General Public License, version 3 or later',
              'http://www.gnu.org/licenses/'
    }

    def dependencies
      super + Inventory::Dependencies.new{
        development 'inventory-rake', 1, 6, 0
        development 'inventory-rake-tasks-yard', 1, 4, 0
        development 'lookout', 3, 0, 0
        development 'yard', 0, 8, 0
        development 'yard-heuristics', 1, 1, 0
        runtime 'rake', 10, 0, 0, :feature => 'rake'
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
