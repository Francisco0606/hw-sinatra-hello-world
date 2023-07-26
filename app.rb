require 'sinatra'
require 'sinatra/flash'

class MyApp < Sinatra::Base

    enable :sessions # for using cookies and flash messages
    register Sinatra::Flash #for flash messages

    get '/hello' do
        erb :hello_form
    end

    post '/hello' do
        @name = params["name"]
        @last = params["lastname"]

        if @name == "" || @name == nil
            flash["message"] = "Please Enter a Name"
            redirect '/hello'
        else
            session[:name] = @name
        end

        erb :hello
    end

    get '/somewhere' do
        "You are nowhere"
    end

end





