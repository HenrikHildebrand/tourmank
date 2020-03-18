class Team < ApplicationRecord
  belongs_to :user, optional: false
  belongs_to :tournament, optional: false

  validates_presence_of :name

end
