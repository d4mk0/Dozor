class Task < ActiveRecord::Base
  ANSWERS_TYPES = %w(code photo)
  belongs_to :quest
  has_many :attempts

  validates_presence_of :name, :answer_type
  validates_presence_of :success_code, if: Proc.new{code_task?}
  validates_inclusion_of :answer_type, in: ANSWERS_TYPES

  scope :published, -> {where published: true}

  def code_task?
    answer_type == 'code'
  end

  def completed_by?(team)
    Attempt.where(result: 'success', task: self, team: team).first.present?
  end

  def number_in_quest_list
    quest.tasks.published.index(self)+1
  end
end
