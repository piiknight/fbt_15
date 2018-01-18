class Admin::BaseAdminController < ApplicationController
  before_action :logged_in_user
  before_action :authencation_admin!
  layout "application_admin"
end
