class CreateJoinTableSkillEmployer < ActiveRecord::Migration
  def change
    create_join_table :skills, :employers do |t|
      # t.index [:skill_id, :employer_id]
      # t.index [:employer_id, :skill_id]
    end
  end
end
