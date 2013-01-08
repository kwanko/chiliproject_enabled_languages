#-- encoding: UTF-8
# Enabled languagues for Chiliproject
# Copyright (C) 2011-2012  Arnauld NYAKU


class CreateEnabledLanguages < ActiveRecord::Migration
  class EnabledLanguage < ActiveRecord::Base; end
  def self.up
    create_table :enabled_languages do |t|
      t.column :language, :string
      t.column :status, :boolean
      t.column :created_at, :timestamp
      t.column :updated_at, :timestamp
    end

    valid_languages = Dir.glob(File.join(RAILS_ROOT, 'config', 'locales', '*.yml')).collect {|f| File.basename(f).split('.').first}.collect(&:to_sym)
    valid_languages.collect { |lang| [:fr, :en].include?(lang) ? EnabledLanguage.create(:language => "#{lang}", :status => true) : EnabledLanguage.create(:language => "#{lang}", :status => false)  }
    
    system 'touch tmp/restart.txt'
  end

  def self.down
    drop_table :enabled_languages
  end
end
