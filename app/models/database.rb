class Database < ActiveRecord::Base
  belongs_to :app

  def db_url
    "default"
  end
end
