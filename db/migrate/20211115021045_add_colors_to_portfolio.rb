class AddColorsToPortfolio < ActiveRecord::Migration[6.0]
  def change
    add_column :portfolios, :header_color, :string
    add_column :portfolios, :body_color, :string
    add_column :portfolios, :font_color, :string
  end
end
