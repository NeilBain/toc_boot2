class Task < ApplicationRecord
  belongs_to :project
  
  validates :av_duration, numericality: {less_than_or_equal_to: :max_duration}, allow_nil: true 
  validates :max_duration, numericality: {greater_than_or_equal_to: :av_duration}, allow_nil: true
  
  after_validation :log_errors, :if => Proc.new {|m| m.errors}

  def log_errors
    Rails.logger.debug self.errors.full_messages.join("\n")
  end
end
