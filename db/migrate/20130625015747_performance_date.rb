class PerformanceDate < ActiveRecord::Migration
  def change
    remove_column :performances, :perf_year
    add_column :performances, :perf_date, :date
  end
end
