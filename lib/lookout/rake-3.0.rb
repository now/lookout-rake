# -*- coding: utf-8 -*-

# Namespace for Lookout.
module Lookout end

# Namespace for Rake integration of Lookout.
module Lookout::Rake
  load File.expand_path('../rake/version.rb', __FILE__)
  Version.load
end
