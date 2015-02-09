class Sale < ActiveRecord::Base
  belongs_to :book

  before_create :generate_guid

  protected

  def generate_guid
    self.guid ||= SecureRandom.uuid
  end
end
