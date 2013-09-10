# -*- coding: utf-8 -*-

# Namespace for [Lookout](http://disu.se/software/lookout-3.0/).  The bulk of the
# library is in {Rake::Tasks::Test}.
module Lookout end

# Namespace for [Rake](http://rake.rubyforge.org/) integration of Lookout.
module Lookout::Rake
  load File.expand_path('../lookout-rake-3.0/version.rb', __FILE__)
  Version.load
end
