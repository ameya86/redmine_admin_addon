# -*- encoding: utf-8 -*-

class AdminAddonController < ApplicationController
  # 管理者モードを切り替える
  def toggle
    cookies['admin_addon'] = ("1" == cookies['admin_addon'].to_s)? nil : "1"
  end
end
