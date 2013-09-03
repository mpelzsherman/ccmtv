class PerformanceAllowNullPerformer < ActiveRecord::Migration
  def change
    change_column :performances, :person_id, :integer, :null => true
  end
end
