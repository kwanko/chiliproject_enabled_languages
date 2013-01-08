#-- encoding: UTF-8
# Enabled languagues for Chiliproject
# Copyright (C) 2011-2012  Arnauld NYAKU


class EnabledLanguage < ActiveRecord::Base
  unloadable

  STATUS_ENABLED = 1
  STATUS_DISABLED = 0

  named_scope :enabled_languages, {:select => "language" , :conditions => "status = 1"}

end
