class DbConfig
  def self.config
    {
      adapter: 'mysql2',
      host: 'localhost',
      username: 'root',
      password: 'xxxxx',
      database: 'images',
      pool: 5,
      timeout: 5000,
      reconnect: true
    }
  end
end
