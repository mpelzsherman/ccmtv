class CreateAdminPerformances < ActiveRecord::Migration
  def change
    create_table :admin_performances do |t|

      t.timestamps
    end
  end
end
