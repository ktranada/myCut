class RootsController < ApplicationController
  before_action :require_signed_in!, only: [:root]
  def index; end

  def root; end
end
