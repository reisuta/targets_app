class CreateActivityServices < ActiveRecord::Migration[7.0]
  def change
    create_table :activity_services do |t|
      t.references :activity, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
