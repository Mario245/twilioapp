class CreateMsgs < ActiveRecord::Migration
  def change
    create_table :msgs do |t|
      t.string :to
      t.string :from
      t.string :body

      t.timestamps null: false
    end
  end
end
