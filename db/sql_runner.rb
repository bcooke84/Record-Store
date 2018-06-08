require( 'pg' )

class SqlRunner

  # def self.run(sql, values = [])
  #   begin
  #     db = PG.connect({ dbname: "record_store", host: "localhost" })
  #     db.prepare("query", sql)
  #     result = db.exec_prepared("query", values)
  #   ensure
  #     db.close()
  #   end
  #   return result
  # end

  def self.run(sql, values = [])
    begin
      db = PG.connect({
        dbname: 'dbv52s116ktu48',
        host: 'ec2-50-19-224-165.compute-1.amazonaws.com',
        port: '5432',
        user: 'qbxxhyyqzucndt',
        password: '5842302e605ad132e921f5d7920b45273f19bd845027922d551c393075847c0d'
        })
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close()
    end
    return result
  end

end
