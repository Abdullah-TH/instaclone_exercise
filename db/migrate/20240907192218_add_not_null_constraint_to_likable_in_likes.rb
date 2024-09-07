class AddNotNullConstraintToLikableInLikes < ActiveRecord::Migration[7.0]
  def change
    change_column_null :likes, :likable_id, false
    change_column_null :likes, :likable_type, false
  end
end