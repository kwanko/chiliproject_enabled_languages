#-- encoding: UTF-8
# Enabled languagues for Chiliproject
# Copyright (C) 2011-2012  Arnauld NYAKU

module EnabledlanguagesSettingsHelperPatch
  def self.included(base) # :nodoc:
    base.send(:include, SettingsHelperMethodsEnabledlanguages)

    base.class_eval do
      unloadable # Send unloadable so it will not be unloaded in development
      alias_method_chain :administration_settings_tabs, :enabled_languages
    end

  end
end

module SettingsHelperMethodsEnabledlanguages
  def administration_settings_tabs_with_enabled_languages
    tabs = administration_settings_tabs_without_enabled_languages
    tabs << {:name => 'enabled_languages', :partial => 'enabled_languages/languages', :label => :label_languages}
    tabs
  end
end

SettingsHelper.send(:include, EnabledlanguagesSettingsHelperPatch)