class PairingsPlayer < ActiveRecord::Base
  belongs_to :pairing
  belongs_to :player
end
