# -*- encoding: utf-8 -*-
require_dependency 'application_controller'

module RedmineAdminAddon
  module ApplicationPatch
    def self.included(base) # :nodoc:
      base.send(:include, InstanceMethods) # obj.method

      base.class_eval do
        alias_method_chain :user_setup, :admin_addon
      end
    end

    module InstanceMethods # obj.method
      # ユーザ設定後に管理者フラグを折る
      def user_setup_with_admin_addon
        user_setup_without_admin_addon

        User.current.admin = false if User.current.admin? && "1" == cookies['admin_addon'].to_s
      end
    end
  end
end

ApplicationController.send(:include, RedmineAdminAddon::ApplicationPatch)
