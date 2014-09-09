class CreateChallengePartners < ActiveRecord::Migration
  def change
    create_table :challenge_partners do |t|
      t.string :name
      t.string :description
      t.string :website
      t.string :slug, null: false, unique: true
      t.timestamps
    end

    add_index :challenge_partners, :slug, unique: true
  end
end
