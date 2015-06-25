class RootsController < ApplicationController
  before_action :require_signed_in!, only: [:root]
  def index
    if current_user
      redirect_to root_url
    end
  end

  def root; end
end
