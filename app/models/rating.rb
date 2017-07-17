class Rating < ApplicationRecord

  belongs_to :project
  belongs_to :giver, :class_name => 'User' #:foreign_key => 'giver_id'
  belongs_to :receiver, :class_name => 'User' #, :foreign_key => 'receiver_id'

end
