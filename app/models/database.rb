class Database < ActiveRecord::Base
  after_create :delegate_create_to_backend
  after_destroy :delegate_destroy_to_backend
  belongs_to :app

  def delegate_create_to_backend
    
  end

  def delegate_destroy_to_backend

  end
end
