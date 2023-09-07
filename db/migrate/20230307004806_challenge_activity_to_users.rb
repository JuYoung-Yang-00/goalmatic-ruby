class ChallengeActivityToUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :user do |t|
      t.references :challenge, null: false
  end
end
