class Admin::BaseController < ApplicationController
  before_filter :authenticate_user!
  before_filter { user_signed_in? && current_user.active? }
  layout 'admin'
end
