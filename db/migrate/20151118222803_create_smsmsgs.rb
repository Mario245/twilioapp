class CreateSmsmsgs < ActiveRecord::Migration
  def change
    create_table :smsmsgs do |t|
      t.string :to
      t.string :from
      t.text :message

      t.timestamps null: false
    end
  end
end
