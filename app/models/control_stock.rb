class ControlStock < ActiveRecord::Base
  belongs_to :revista

  validates_presence_of :revista_id, :variacion
end