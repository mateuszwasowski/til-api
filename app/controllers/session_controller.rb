class SessionController < ApplicationController
  def google
    @author = GoogleApi.new(params[:code]).get_author
    puts "AUTHOR IS #{@author.email}"
    render json: @author
  end
end
