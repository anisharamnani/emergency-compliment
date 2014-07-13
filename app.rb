require 'sinatra/base'
require './lib/compliment'

module EmergencyCompliment
  class App < Sinatra::Base
    enable :sessions
    set :session_secret, 'super secret'

    get '/' do
      @compliment = Compliment.new
      if session[:last_message]
        while @compliment.message == session[:last_message]
          @compliment.message = @compliment.select_message
        end
      end

      if session[:last_image]
        while @compliment.image == session[:last_image]
          @compliment.image = @compliment.select_image
        end
      end

      session[:last_message] = @compliment.message
      session[:last_image] = @compliment.image
      
      haml :compliment
    end

  end
end
