class CreateQuestions < ActiveRecord::Migration
  def change
    create_table(:questions) do |t|
      t.column(:content, :string)
      t.column(:survey_id, :integer)
      t.column(:response_id, :integer)

      t.timestamps()
    end
  end
end
