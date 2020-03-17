class HomeController < ApplicationController
  def index
    puts(session.as_json)
  end

  def signed_out

  end
end
