task cleanup: [:environment] do
  desc 'Clean up non-associated data'

 # Removes all memberships where their users have already been deleted
 # Removes all memberships where their projects have already been deleted
 # Removes any memberships with a null project_id or user_id
 Membership.all.each do |membership|
  membership.destroy if membership.user_id.nil? or membership.project_id.nil?
   puts "Destroying: #{membership}"
 end

 # Removes all tasks where their projects have been deleted
 # Removes any tasks with null project_id
 Task.where(project_id: nil).destroy_all


 # Removes all comments where their tasks have been deleted
 # Removes any comments with a null task_id
 Comment.where(task_id: nil).destroy_all

 end

puts "successfully completed"

# rake cleanup:cleanup
