class Vote < ActiveRecord::Base
  belongs_to :constituency
  belongs_to :committee
  attr_accessible :amount,
	:constituency_id,
	:committee_id
end
