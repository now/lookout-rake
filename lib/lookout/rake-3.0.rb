# -*- coding: utf-8 -*-

# Namespace for [Lookout](http://disu.se/software/lookout/).  The meat of the
# library is in {Rake::Tasks::Test}.
module Lookout end

# Namespace for [Rake](http://rake.rubyforge.org/) integration of Lookout.
module Lookout::Rake
  load File.expand_path('../rake/version.rb', __FILE__)
  Version.load
end
