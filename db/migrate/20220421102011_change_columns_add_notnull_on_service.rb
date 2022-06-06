class ChangeColumnsAddNotnullOnService < ActiveRecord::Migration[7.0]
  def change
    change_column_null :services, :name, false
  end
end
