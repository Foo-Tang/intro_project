class CreateCardSubtypes < ActiveRecord::Migration[7.0]
  def change
    create_table :card_subtypes do |t|
      t.references :card, null: false, foreign_key: true
      t.references :subtype, null: false, foreign_key: true

      t.timestamps
    end
  end
end
