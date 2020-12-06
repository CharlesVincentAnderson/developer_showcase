class AddPortfolioToAboutMe < ActiveRecord::Migration[6.0]
  def change
    add_reference :about_mes, :portfolio
  end
end
