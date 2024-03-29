require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry-byebug' )
require_relative('./models/pizza_order.rb')
also_reload('./models/*')


#INDEX
get '/pizza-orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end

#NEW
# this need to be above the wild card of :id that is below.
get '/pizza-orders/new' do
  erb(:new)
end

#SHOW
get '/pizza-orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end

#CREATE
post '/pizza-orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

#DELETE


post '/pizza-orders/:id/delete' do
  PizzaOrder.delete(params[:id])
  redirect '/pizza-orders'
end

get '/pizza-orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

post '/pizza-orders/:id/edit' do
  PizzaOrder.new(params).update
  redirect '/pizza-orders'
end
