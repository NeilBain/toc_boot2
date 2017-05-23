class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy 
  validates :title, presence: true,
                    length: { minimum: 5 }   
                    
  before_save :reset_totals
  
  def reset_totals
    self.min_duration = tasks.sum(:av_duration)
    self.max_duration = tasks.sum(:max_duration)
    self.predicted_duration = tasks.sum(:av_duration)+(tasks.sum(:toc_factor)**0.5*2)
  end                              
end
