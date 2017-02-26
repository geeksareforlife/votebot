class Interaction < ApplicationRecord
  
  belongs_to :user
  belongs_to :proposal  

  validates :user, presence: true
  validates :proposal, presence: true
  
  validates :last_vote, inclusion: {in: %w(agree block abstain), allow_nil: true}
  
  def agree!
    update_attributes! last_vote: "agree"
  end
  
  def abstain!
    update_attributes! last_vote: "abstain"
  end
  
  def block!
    update_attributes! last_vote: "block"
  end
  
  def state
    last_vote || "participating"
  end
  
end