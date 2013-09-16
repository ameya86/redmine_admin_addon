# -*- encoding: utf-8 -*-
require 'redmine_admin_addon'

Redmine::Plugin.register :redmine_admin_addon do
  name 'Redmine Admin Addon plugin'
  author 'OZAWA Yasuhiro'
  description 'Toggle Adminisitrator permissions.'
  version '0.0.1'
  url 'https://github.com/ameya86/redmine_admin_addon'
  author_url 'https://github.com/ameya86'

  # 右上のメニューにモード切替リンクを追加する
  menu :account_menu, :admin_addon,
                  {
                    :controller => 'admin_addon',
                    :action => 'toggle',
                    :format => 'js',
                  },
                  # 状態によって表示名を変える
                  :caption => RedmineAdminAddon.account_menu_caption,
                  :before => :my_account, # "個人設定"の左
                  :html => {
                    :remote => true, # Ajax
                    #:class => RedmineAdminAddon.account_menu_css_class,
                    #:title => RedmineAdminAddon.account_menu_title,
                  },
                  :if => Proc.new{|p| User.current.admin_was }
end
