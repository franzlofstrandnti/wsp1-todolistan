# filepath: c:\Users\franz.lofstrand\wsp\wsp1-todolistan\app.rb
require 'debug'
require "awesome_print"

class App < Sinatra::Base
    register Sinatra::Reloader

    def db
      return @db if @db

      @db = SQLite3::Database.new(DB_PATH)
      @db.results_as_hash = true

      return @db
    end

    get '/' do
      @todos = db.execute("SELECT * FROM todos")
      erb :'todos/index'
    end

    get '/todos/new' do
      erb :'todos/new'
    end

    
end