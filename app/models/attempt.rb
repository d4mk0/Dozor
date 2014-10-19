class Attempt < ActiveRecord::Base
  RESULT_TYPES = %w(success fail)
  belongs_to :task
  belongs_to :team

  validates_inclusion_of :result, in: RESULT_TYPES
  validates_presence_of :code, if: Proc.new{task.code_task?}

  before_validation :get_result

  scope :success, -> {where result: 'success'}

  def success?
    result == 'success'
  end

  private

    def get_result
      p task.success_code.to_s.downcase
      p code.to_s.downcase
      self.result = task.success_code.to_s.downcase == code.to_s.downcase ? 'success' : 'fail'
    end
end
