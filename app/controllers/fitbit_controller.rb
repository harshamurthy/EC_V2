class FitbitController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    client = Client.find_by_first_name("Harsha") #really find the client by the id passed which will be the current_client once they can sign in
    @c = client
    @c.oauth_token = auth["credentials"]["token"]
    @c.oauth_secret = auth["credentials"]["secret"]
    @c.save

    redirect_to clients_url
  end
end
