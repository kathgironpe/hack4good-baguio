class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.integer :user_id
      t.integer :challenge_partner_id
      t.string :title
      t.text :description
      t.string :slug, null: false, unique: true
      t.timestamps
    end
    add_index :challenges, :slug, unique: true
  end
end
