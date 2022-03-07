class RemoveUserFromTasks < ActiveRecord::Migration[6.1]
  def change
    remove_reference :tasks, :user
  end
end
