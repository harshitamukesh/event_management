class AddPhonenoToUser < ActiveRecord::Migration
  def change
    add_column :users, :phoneno, :integer
  end
end
