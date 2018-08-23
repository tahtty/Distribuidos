class DbConfig
  def self.config
    {
      adapter: 'mysql2',
      host: 'localhost',
      username: 'root',
      password: 'xxxxxx',
      database: 'images',
      pool: 100,
      timeout: 5000,
      reconnect: true
    }
  end
end
