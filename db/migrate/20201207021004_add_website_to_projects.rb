class AddWebsiteToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :website, :string
  end
end
