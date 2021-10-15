class CreateFeatures < ActiveRecord::Migration[6.0]
  def change
    create_table :features do |t|
      t.references :project
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
