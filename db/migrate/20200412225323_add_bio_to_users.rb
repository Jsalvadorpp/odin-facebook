class AddBioToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :profile_bio ,:string , default: 'none'
  end
end
