require 'yaml'

h = YAML.load(File.read('./test.yml'))
puts h
