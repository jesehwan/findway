class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
			t.string :name
			t.string :password
			t.string :kakao
			t.integer :try
			t.integer :step
			t.integer :age
  		t.integer :phone
			t.string :gender
			t.string :job
			t.string :residence
			t.string :grade
			
      t.timestamps
    end
  end
end
