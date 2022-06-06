class CreateTechnologies < ActiveRecord::Migration[7.0]
  def change
    create_table :technologies do |t|
      t.string :name, null: false, comment: "使用技術名"

      t.timestamps
    end
  end
end
