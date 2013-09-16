# -*- encoding: utf-8 -*-
require 'redmine_admin_addon/application_controller_patch'

module RedmineAdminAddon
  include Redmine::I18n

  # 管理者になっているかどうかで表示文を変える
  def account_menu_caption
    return Proc.new{|p| l(User.current.admin? ? :label_admin_addon_on : :label_admin_addon_off) }
  end
  module_function :account_menu_caption

  # アイコンなどの装飾用CSS
  def account_menu_css_class
    # 表示名と違って単純にto_sされてしまう模様
    #return Proc.new{|p| User.current.admin? ? "admin_on" : 'admin_off' }
  end
  module_function :account_menu_css_class

  # title属性
  def account_menu_title
    return :notice_admin_addon_toggle
    # 表示名と違って単純にto_sされてしまう模様
    #return Proc.new{|p| l(User.current.admin? ? :notice_admin_addon_on : :notice_admin_addon_off) }
  end
  module_function :account_menu_title
end
