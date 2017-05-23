class Task < ApplicationRecord
  belongs_to :project
  
  validates :av_duration, numericality: {less_than_or_equal_to: :max_duration}, allow_nil: true 
  validates :max_duration, numericality: {greater_than_or_equal_to: :av_duration}, allow_nil: true
  
  before_save :calculate_toc_factor
  after_save :calculate_project_buffer
  after_destroy :calculate_project_buffer
  
  
  def calculate_toc_factor
    self.toc_factor = ((self.max_duration - self.av_duration)/2)**2
  end
  
  def calculate_project_buffer
    @project = Project.find(self.project_id)
    @project.update_attributes(min_duration: 1)
  end
end
