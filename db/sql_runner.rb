require('pg')
class SqlRunner

  def self.run( sql )
    begin
      db = PG.connect({ dbname: 'MCB_db', host: 'localhost' })
      result = db.exec( sql )
    ensure
      db.close unless db.nil?
    end
    return result
  end

end
