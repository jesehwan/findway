class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
			t.string :initial
			t.string :explain
      t.timestamps
    end
  end
end
