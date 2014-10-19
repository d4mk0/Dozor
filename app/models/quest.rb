class Quest < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  has_many :teams, dependent: :destroy

  validates_presence_of :start_at, :end_at, :name

  scope :published, -> {where published: true}
  scope :available_for_results, -> {where "end_at < ?", Time.now-1.hour}

  def in_progress?
    Time.now > start_at && end_at > Time.now
  end

  def count_tasks
    tasks.published.count
  end

  def results_available?
    Time.now > end_at+1.hour
  end

  def finished_teams
    teams.joins(:attempts).where(attempts: {result: 'success', task_id: tasks.published.last}).order('attempts.created_at')
  end

  def place_for_team(team)
    finished_teams.index(team)+1
  end
end
