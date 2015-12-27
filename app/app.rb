require 'sinatra'
require 'mongo_mapper'
require 'json'
require_relative 'payment'

configure do
  enable :sessions
  set :bind, '0.0.0.0'
  MongoMapper.connection = Mongo::Connection.new(ENV['MONGODB_URI'], 27017)
  MongoMapper.database = 'ncp'
end

helpers do
  def logged_in?
    !session[:identity].nil?
  end

  def username
    session[:identity]
  end

  def site_title
    'No Change Parking'
  end
end

get '/' do
  erb "<h1>#{site_title}</h1>"
end

get '/login' do
  erb :login_form
end

post '/login' do
  session[:identity] = params['username']
  where_user_came_from = session[:previous_url] || '/'
  redirect to where_user_came_from
end

get '/logout' do
  session.clear
  erb "<div class='alert alert-message'>Logged out</div>"
end

get '/payments/add' do
  payment = Payment.new( :vehicle => 'ABC123', :name_on_card => 'Mini Driver')
  payment.save
end

get '/payments' do
  payments = Payment.all()

  payments.to_json
end

