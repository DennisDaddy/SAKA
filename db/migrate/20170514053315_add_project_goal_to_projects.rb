class AddProjectGoalToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :project_goal, :integer
  end
end
