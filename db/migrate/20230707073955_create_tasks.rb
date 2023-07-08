# bundle exec rails generate migration CreateTasks

class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end