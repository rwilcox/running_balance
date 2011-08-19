require 'machinist/active_record'
Dir[Rails.root.join("spec/blueprints/**/*.rb")].each {|f| require_relative f}

# **DO NOT** add your blueprints here! They go in spec/blueprints!!! WD-rpw 08-14-2011
