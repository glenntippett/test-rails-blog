class PagesController < ApplicationController
  def index
    flash.notice = "Hey there - I'm a notification"
    redirect_back_or_to({ action: 'index' })
  end
end
