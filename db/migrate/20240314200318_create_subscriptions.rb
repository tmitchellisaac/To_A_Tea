class CreateSubscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :subscriptions do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :tea, null: false, foreign_key: true
      t.string :price
      t.string :frequency
      t.string :title
      t.integer :status
      t.timestamps
    end
  end
end
