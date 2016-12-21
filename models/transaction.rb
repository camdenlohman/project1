require 'date'
require_relative('../db/sql_runner')

class Transaction

  attr_reader( :merchant_name, :value, :category, :t_date_year,:t_date_month,:t_date_day,:t_date, :id )

  def initialize( options )
    @id = nil || options['id'].to_i
    @merchant_name = options['merchant_name'].to_s
    @value = options['value']
    @category = options['category'].to_s
    @t_date_year = options['t_date_year'].to_i || 1905
    @t_date_month = options['t_date_month'].to_i || 5
    @t_date_day = options['t_date_day'].to_i || 5
    # options['t_date'] << (@t_date_year,@t_date_month,@t_date_day)
    # new_date = Date.new(@t_date_year,@t_date_month,@t_date_day)

    
    now_date = Time.now
    year = now_date.year - now_date.year + @t_date_year || now_date.year - now_date.year + 1905
    month = now_date.month - now_date.month + @t_date_month || now_date.month - now_date.month + 5
    day = now_date.day - now_date.day + @t_date_day || now_date.day - now_date.day + 5




    @t_date = Date.new(year,month,day) || Date.new(1905,5,5)

  end

  def save()
    sql = "INSERT INTO transaction (
    merchant_name,value,category,t_date_year,t_date_month,t_date_day,t_date ) VALUES 
    ('#{ @merchant_name }','#{ @value }','#{ @category }','#{ @t_date_year }','#{ @t_date_month }','#{ @t_date_day }','#{ @t_date }') 
    RETURNING *"
    transaction_data = SqlRunner.run(sql)
    @id = transaction_data.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM transaction"
    transactions = SqlRunner.run( sql )
    result = transactions.map { |transaction| Transaction.new( transaction ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM transaction WHERE id=#{id}"
    transactions = SqlRunner.run( sql )
    result = Transaction.new( transactions.first )

    return result
  end

  def self.update( options )

    @id = nil || options['id'].to_i
    @merchant_name = options['merchant_name'].to_s
    @value = options['value']
    @category = options['category'].to_s
    @t_date_year = options['t_date_year'].to_i || 1905
    @t_date_month = options['t_date_month'].to_i || 5
    @t_date_day = options['t_date_day'].to_i || 5
    # options['t_date'] << (@t_date_year,@t_date_month,@t_date_day)
    # new_date = Date.new(@t_date_year,@t_date_month,@t_date_day)
    now_date = Time.now
    year = now_date.year - now_date.year + @t_date_year
    month = now_date.month - now_date.month + @t_date_month
    day = now_date.day - now_date.day + @t_date_day
    @t_date = Date.new(year,month,day) || Date.new(1905,5,5)

    sql = "UPDATE transaction SET
    (merchant_name,value,category,t_date_year,t_date_month,t_date_day,t_date) = ('#{@merchant_name}','#{@value}','#{@category}','#{@t_date_year}','#{@t_date_month}','#{@t_date_day}','#{@t_date}') WHERE id=#{@id};
    "
    SqlRunner.run( sql )
  end

  def self.destroy( id )
    sql = "DELETE FROM transaction WHERE id=#{id}"
    SqlRunner.run( sql )
  end

   def self.search_by_category(category_search)
     sql ="SELECT transaction.* FROM transaction WHERE category='#{category_search}'"

     transactions = SqlRunner.run( sql )
     result = transactions.map { |transaction| Transaction.new( transaction ) }
     return result
   end

end
