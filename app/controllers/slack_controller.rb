class SlackController < ApplicationController
  def slacktil
    email = get_author_email
    @author = Author.find_by_email(email)
    if @author.present?
      @til = Til.new(description: params["text"], author: @author)
      @til.save
      render status: 200, json: "Your Til has been submited!"
    else
      render status: 200, json: {
        "response_type": "ephemeral",
        "text": "You first have to authorize google through the til web app to connect your account."
      }
    end
  end

  def slacktilget
    @til = Til.all.sample
    render status: 200, json: @til.print_til
  end

  private

  def get_author_email
    adv_params = HTTParty.get("https://slack.com/api/users.list?token=#{Rails.application.secrets.slack_token}")
    adv_params["members"].each do |member|
      if member["name"] == params["user_name"]
        return member["profile"]["email"]
      end
    end
  end
end
