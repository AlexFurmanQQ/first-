class AddCodeEmailConformation < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :code_email_conformation, :string
  end
end
