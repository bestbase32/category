class AddFieldtoMessageV2 < ActiveRecord::Migration
  def change
    add_column :pages, :parent_id, :integer 
  end
end
