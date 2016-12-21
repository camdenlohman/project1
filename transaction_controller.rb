require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative('./models/transaction')

@current_year = 2016

# get all transactions
get '/MCB' do
  @transactions = Transaction.all()
  @F_Total = 0.0
  @E_Total = 0.0
  @U_Total = 0.0
  @C_Total = 0.0
  @All_Total = 0.0
  @Budget = 1152.00
  @percentage = 0
  erb(:index)
end

# new transaction form
get '/MCB/new' do
  erb(:new)
end

# search by category
get '/MCB/search' do
  @search = params
  @transactions = Transaction.all()
  erb(:search)
end

# search by category
post '/MCB/search' do
  @search = params
  @transactions = Transaction.all()
  erb(:search)
end

# actually make a transaction
post '/MCB' do
  @transaction = Transaction.new(params)
  @transaction.save()
  erb(:create)
end

# get / find a transaction by id
get '/MCB/:id' do
  id = params[:id]
  @transaction = Transaction.find(id)
  erb(:show)
end

# get edit transaction form
get '/MCB/:id/edit' do
  @transaction = Transaction.find(params[:id])
  erb(:edit)
end

# actually update a transaction by id
#PUT
post '/MCB/:id' do
  Transaction.update(params)
  redirect to "/MCB/#{params[:id]}"
end

# delete a transaction by id
# DELETE
post '/MCB/:id/delete' do
  Transaction.destroy( params[:id])
  redirect to('/MCB')
end