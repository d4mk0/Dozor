class Team < ActiveRecord::Base
  belongs_to :quest
  has_many :attempts

  validates_presence_of :name, :access_code

  scope :admitted, -> {where is_admitted: true}

  def current_task
    quest.tasks.published.each do |t|
      return t unless t.completed_by? self
    end
  end


  def current_progress
    (attempts.success.count/quest.count_tasks.to_f*100).to_i
  end

  def complete_quest?
    current_progress == 100
  end

  def time_of_compete
    attempts.success.last.created_at
  end

  def transit_time
    (time_of_compete - quest.start_at).to_i
  end
end
