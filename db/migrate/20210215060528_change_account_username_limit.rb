class ChangeAccountUsernameLimit < ActiveRecord::Migration[6.0]
  def change
    change_column :accounts, :username, :string, :limit => nil
    change_column :posts, :username, :string, :limit => nil
  end
end
