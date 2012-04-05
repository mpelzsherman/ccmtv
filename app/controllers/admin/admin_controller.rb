module Admin
  class AdminController < ApplicationController
    before_filter :authenticate_user!
    before_filter { user_signed_in? && current_user.active? }
  end
end
