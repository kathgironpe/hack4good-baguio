class ChangeDescriptionInChallengePartners < ActiveRecord::Migration
  def up
    change_column :challenge_partners, :description, :text
  end

  def down
    change_column :challenge_partners, :description, :string
  end
end
