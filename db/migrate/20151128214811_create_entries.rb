class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string    :title
      t.text      :description
      t.integer   :user_id

      t.timestamps  null: false
    end
  end
end
