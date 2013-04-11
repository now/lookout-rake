# -*- coding: utf-8 -*-

Expectations do
  expect '-w -Ilib -- %s -rtest-1.0 -- test/unit/test-1.0.rb test/unit/test/version.rb' %
      Lookout::Rake::Tasks::Test::LoaderPath do
    command = nil
    Rake.application = Rake::Application.new
    stub Lookout::Rake::Tasks::Test.new(:inventory => Inventory.new(1, 0, 0, 'test/lib/test/version.rb')),
         :ruby => proc{ |s| command = s } do
      Rake.application[:test].invoke
    end
    command
  end

  expect '-w -Ilib -- %s -rtest-1.0 -l123 -- test/unit/test-1.0.rb test/unit/test/version.rb' %
      Lookout::Rake::Tasks::Test::LoaderPath do
    command = nil
    Rake.application = Rake::Application.new
    stub Lookout::Rake::Tasks::Test.new(:inventory => Inventory.new(1, 0, 0, 'test/lib/test/version.rb')),
         :ruby => proc{ |s| command = s } do
      with_env 'LINE' => '123' do
        Rake.application[:test].invoke
      end
    end
    command
  end

  expect '-w -Ilib -- %s -rtest-1.0 -c -- test/unit/test-1.0.rb test/unit/test/version.rb' %
      Lookout::Rake::Tasks::Test::LoaderPath do
    command = nil
    Rake.application = Rake::Application.new
    stub Lookout::Rake::Tasks::Test.new(:inventory => Inventory.new(1, 0, 0, 'test/lib/test/version.rb')),
         :ruby => proc{ |s| command = s } do
      Rake.application[:'test:coverage'].invoke
    end
    command
  end

  expect '-w -Ilib -- %s -rtest-1.0 -- test/unit/test-1.0.rb test/unit/test/version.rb' %
      Lookout::Rake::Tasks::Test::LoaderPath do
    command = nil
    with_const 'Inventory::Rake::Tasks', Module.new do
      stub Inventory::Rake::Tasks,
           :inventory => Inventory.new(1, 0, 0, 'test/lib/test/version.rb') do
        stub $LOADED_FEATURES, :any? => true do
          Rake.application = Rake::Application.new
          stub Lookout::Rake::Tasks::Test.new, :ruby => proc{ |s| command = s } do
            Rake.application[:test].invoke
          end
        end
      end
    end
    command
  end

  expect RuntimeError.new(/\Agem specification was not given/) do
    Rake.application = Rake::Application.new
    stub Dir, :[] => [] do
      Lookout::Rake::Tasks::Test.new
      Rake.application[:test].invoke
    end
  end

  expect '-w -Ilib -- %s -rtest -- test/unit/test.rb test/unit/test/version.rb' %
      Lookout::Rake::Tasks::Test::LoaderPath do
    command = nil
    Rake.application = Rake::Application.new
    stub Dir, :[] => %w'test.gemspec' do
      stub Gem::Specification, :load => Gem::Specification.new{ |s| s.name = 'test' } do
        stub Lookout::Rake::Tasks::Test.new(:files => %w'test/unit/test.rb test/unit/test/version.rb'),
             :ruby => proc{ |s| command = s } do
          Rake.application[:test].invoke
        end
      end
    end
    command
  end

  expect '-w -Ilib -- %s -rtest -- test/unit/test.rb test/unit/test/version.rb' %
      Lookout::Rake::Tasks::Test::LoaderPath do
    command = nil
    Rake.application = Rake::Application.new
    stub Lookout::Rake::Tasks::Test.new(:specification => Gem::Specification.new{ |s|
                                          s.name = 'test'
                                        },
                                        :files => %w'test/unit/test.rb test/unit/test/version.rb'),
         :ruby => proc{ |s| command = s } do
      Rake.application[:test].invoke
    end
    command
  end

  expect %w'lib' do
    stub Dir, :[] => %w'test.gemspec' do
      stub Gem::Specification, :load => Gem::Specification.new{ |s| s.name = 'test' } do
        Rake.application = Rake::Application.new
        Lookout::Rake::Tasks::Test.new(:paths => nil,
                                       :files => %w'test/unit/test.rb test/unit/test/version.rb').paths
      end
    end
  end

  expect %w'test' do
    stub Dir, :[] => %w'test.gemspec' do
      stub Gem::Specification, :load => Gem::Specification.new{ |s| s.name = 'test' } do
        Rake.application = Rake::Application.new
        Lookout::Rake::Tasks::Test.new(:paths => nil,
                                       :files => %w'test/unit/test.rb test/unit/test/version.rb').requires
      end
    end
  end
end
