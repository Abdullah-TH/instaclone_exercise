class MigratePostLikesToLikable < ActiveRecord::Migration[7.0]
  def up
    # Migrate existing data: set likable_id to post_id and likable_type to 'Post'
    execute <<-SQL
      UPDATE likes
      SET likable_id = post_id,
          likable_type = 'Post'
    SQL
  end

  def down
    # Revert the migration if needed
    execute <<-SQL
      UPDATE likes
      SET post_id = likable_id
      WHERE likable_type = 'Post'
    SQL
  end
end