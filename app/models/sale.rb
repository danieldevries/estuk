class Sale < ActiveRecord::Base
  belongs_to :book

  before_create :generate_guid

  include AASM

  aasm column: :state do
    state :pending, initial: true
    state :processing
    state :finished
    state :errored

    event :process do
      transitions from: :pending, to: :processing
    end

    event :finish do
      transitions from: :processing, to: :finished
    end

    event :fail do
      transitions from: :processing, to: :errored
    end

  end

  def charge!
    save!
    process!
    finish!
  end

  protected

  def generate_guid
    self.guid ||= SecureRandom.uuid
  end
end
