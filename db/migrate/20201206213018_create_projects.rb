class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.references :portfolio
      t.string :name
      t.string :description
      t.string :role
      t.string :github

      t.timestamps
    end
  end
end
