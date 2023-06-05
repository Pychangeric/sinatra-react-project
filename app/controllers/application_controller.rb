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
end
