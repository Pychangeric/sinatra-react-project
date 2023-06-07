require 'json'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # GET /
  get '/' do
    books = Book.all
    books.to_json
  end

  # Routes for booksController
 

  get '/books/:id' do
    book = Book.find(params[:id])
    book.to_json
  end

  post '/books' do
    body = JSON.parse(request.body.read)
    book = Book.create(
      title: body['title'],
      amount: body['amount'],
      description: body['description'],
      image_url: body['image_url']
    )
    book.to_json
  end


  patch '/books/:id' do
    book = Book.find(params[:id])
    book.update(
      title: params[:title],
      amount: params[:amount],
      description: params[:description],
      image_url: params[:image_url]
    )
    book.to_json
  end

  delete '/books/:id' do
    book = Book.find(params[:id])
    book.destroy
    book.to_json
  end
    # POST /users
    post '/users' do
      body = JSON.parse(request.body.read)
      user = User.create(
        first_name: body['first_name'],
        last_name: body['last_name'],
        email: body['email'],
        password: body['password']
      )
      user.to_json
    end
  
    # GET /users/:id
    get '/users/:id' do
      user = User.find(params[:id])
      user.to_json
    end
  
    # PATCH /users/:id
    patch '/users/:id' do
      user = User.find(params[:id])
      user.update(
        first_name: params[:first_name],
        last_name: params[:last_name],
        email: params[:email],
        password: params[:password]
      )
      user.to_json
    end
  
    # DELETE /users/:id
    delete '/users/:id' do
      user = User.find(params[:id])
      user.destroy
      user.to_json
    end
end
