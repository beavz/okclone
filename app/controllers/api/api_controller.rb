module Api
  class ApiController < ApplicationController
    before_filter :require_sign_in

  end
end