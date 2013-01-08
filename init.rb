#-- encoding: UTF-8
# Enabled languagues for Chiliproject
# Copyright (C) 2011-2012  Arnauld NYAKU

require 'redmine'

# require all files in lib
Dir::foreach(File.join(File.dirname(__FILE__), 'lib')) do |file|
  next unless /\.rb$/ =~ file
  require file
end

Redmine::Plugin.register :chiliproject_enabled_languages do
  name 'Chiliproject Enabled languages'
  author 'Arnauld NYAKU'
  description 'This is a plugin that allows you to choose the languages ​​to be activated'
  version '0.0.1'
  url ''
  author_url 'mailto:arnauld.nyaku@c2bsa.com'
end

