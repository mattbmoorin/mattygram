class AddUsernameToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :username, :string, limit: 20
  end
end
