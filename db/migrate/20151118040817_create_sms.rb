class CreateSms < ActiveRecord::Migration
  def change
    create_table :sms do |t|
      t.string :to
      t.string :from
      t.string :body

      t.timestamps null: false
    end
  end
end
