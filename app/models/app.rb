class App < ActiveRecord::Base
  after_create :delegate_create_to_backend
  after_destroy :delegate_destroy_to_backend

  belongs_to :user

  def delegate_create_to_backend
    require './lib/suploy-scli/lib/scli'
    $scli.add_repository(self.user.name, self.name)
  end

  def delegate_destroy_to_backend
    require './lib/suploy-scli/lib/scli'
    $scli.remove_repository(self.name)
  end
end
