class AddCommentsToService < ActiveRecord::Migration[7.0]
  def change
    change_column_comment(:services, :name, 'サービス名') 
  end
end
