class AddQuestionIdToResponse < ActiveRecord::Migration
  def change
    add_column(:responses, :question_id, :integer)
    remove_column(:questions, :response_id, :integer)
  end
end
