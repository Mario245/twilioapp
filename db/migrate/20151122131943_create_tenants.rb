class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string :to
      t.string :from
      t.text :message

      t.timestamps null: false
    end
  end
end
