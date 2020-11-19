class AddColumnToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :grade, :string
    add_column :students, :help_post, :string
    add_column :students, :location, :string
  end
end
