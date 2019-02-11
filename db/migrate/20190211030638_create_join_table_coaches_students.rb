class CreateJoinTableCoachesStudents < ActiveRecord::Migration[5.2]
  def change
    create_join_table :coaches, :students do |t|
      # t.index [:coach_id, :student_id]
      # t.index [:student_id, :coach_id]
    end
  end
end
