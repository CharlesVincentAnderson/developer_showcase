class AddUserToPortfolios < ActiveRecord::Migration[6.0]
  def change
    add_reference :portfolios, :user
  end
end
