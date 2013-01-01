class PerformanceType < ActiveRecord::Migration
  def change
    create_table "performance_types", :force => true do |t|
      t.string "name"
    end
  end
end
