class Admin::BaseAdminController < ApplicationController
  before_action :authencation_admin!
  layout "application_admin"
end
