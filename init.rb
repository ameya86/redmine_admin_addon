# -*- encoding: utf-8 -*-
require 'redmine_admin_addon'

Redmine::Plugin.register :redmine_admin_addon do
  name 'Redmine Admin Addon plugin'
  author 'OZAWA Yasuhiro'
  description 'Toggle Adminisitrator permissions.'
  version '0.0.2'
  url 'https://github.com/ameya86/redmine_admin_addon'
  author_url 'https://github.com/ameya86'

  # 右上のメニューにモード切替リンクを追加する
  menu :account_menu, :admin_addon_on,
                  {
                    :controller => 'admin_addon',
                    :action => 'toggle',
                    :format => 'js',
                  },
                  :caption => :label_admin_addon_on,
                  :before => :my_account, # "個人設定"の左
                  :html => {
                    :remote => true, # Ajax
                  },
                  :if => Proc.new{|p| User.current.admin_was && User.current.admin? }
  menu :account_menu, :admin_addon_off,
                  {
                    :controller => 'admin_addon',
                    :action => 'toggle',
                    :format => 'js',
                  },
                  :caption => :label_admin_addon_off,
                  :before => :my_account, # "個人設定"の左
                  :html => {
                    :remote => true, # Ajax
                  },
                  :if => Proc.new{|p| User.current.admin_was && !User.current.admin? }
end
