class CreateContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.references :user, foreign_key: true
      t.references :service, foreign_key: true
      t.string :status
      t.text :note

      t.timestamps
    end
  end
end
