class CreatePortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :linkedin
      t.string :github
      t.string :company_name
      t.string :company_email
      t.string :company_website
      t.timestamps
    end
  end
end
