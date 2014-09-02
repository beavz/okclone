class StaticPagesController < ApplicationController
  before_filter :require_sign_in
  def main
    render :main
  end
end
