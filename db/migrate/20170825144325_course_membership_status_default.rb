class CourseMembershipStatusDefault < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      admin = 1
      student = 2
      dir.up do
        execute <<~SQL.squish
          UPDATE course_memberships
          JOIN users ON users.id = course_memberships.user_id
          SET course_memberships.status = #{admin}
          WHERE users.permission IN (2, 1)
        SQL

        execute <<~SQL.squish
          UPDATE course_memberships
          JOIN users ON users.id = course_memberships.user_id
          SET course_memberships.status = #{student}
          WHERE users.permission = 0
        SQL
        change_column_default :course_memberships, :status, student
      end
      dir.down do
        change_column_default :course_memberships, :status, nil
        CourseMembership.update_all(status: nil)
      end
    end
  end
end
