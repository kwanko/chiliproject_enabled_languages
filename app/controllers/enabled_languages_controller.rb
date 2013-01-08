#-- encoding: UTF-8
# Enabled languagues for Chiliproject
# Copyright (C) 2011-2012  Arnauld NYAKU

class EnabledLanguagesController < ApplicationController
  unloadable
  layout 'admin'
  
  include Redmine::I18n

  def update
   enable_or_disable = params[:btenable]
   if enable_or_disable
     langs = params[:status]
     if enable_or_disable.upcase == "DISABLE"
        langs.collect { |lang| EnabledLanguage.find(lang.to_i).update_attribute(:status, false)  } if langs
     elsif enable_or_disable.upcase == "ENABLE"
        langs.collect { |lang| EnabledLanguage.find(lang.to_i).update_attribute(:status, true)  } if langs
     end
   end

   langid = params[:id]
   langstatus = params[:lang][:status] if params[:lang]

   EnabledLanguage.find(langid.to_i).update_attribute(:status, langstatus) if langid and langstatus
   
   respond_to do |format|
     format.html { redirect_to :controller => "settings", :action => 'edit', :tab => "enabled_languages" }
   end

   system("touch tmp/restart.txt")
   
  end

end
