class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
			t.integer :question_id
			t.integer :type_id
			t.string :text
			t.string :sub_text
			t.timestamps
    end
  end
end
