class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
			t.integer :user_id
			t.integer :try_number
			t.integer :question_id
			t.integer :answer_id
			t.integer :type_id

      t.timestamps
    end
  end
end
