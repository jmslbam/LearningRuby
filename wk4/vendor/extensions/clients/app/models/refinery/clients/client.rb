module Refinery
  module Clients
    class Client < Refinery::Core::BaseModel
      self.table_name = 'refinery_clients'

      attr_accessible :name, :logo_id, :descripition, :position

      acts_as_indexed :fields => [:name, :descripition]

      validates :name, :presence => true, :uniqueness => true

      belongs_to :logo, :class_name => '::Refinery::Image'
    end
  end
end
