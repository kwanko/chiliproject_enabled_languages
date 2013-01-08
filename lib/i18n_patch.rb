#-- encoding: UTF-8
# General changes for Chiliproject
# Copyright (C) 2011-2012  Arnauld NYAKU


require_dependency 'i18n'

module I18nPatch
  def self.included(base) # :nodoc:
    base.class_eval do
      unloadable # Send unloadable so it will not be unloaded in development
      @@valid_languages ||= EnabledLanguage.enabled_languages.collect{|obj| obj.language.to_sym }
    end

  end
end

Redmine::I18n.send(:include, I18nPatch) if EnabledLanguage.table_exists?
