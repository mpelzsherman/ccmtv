class PerformerComposerDefaults < ActiveRecord::Migration
  def up
    execute <<-SQL
      ALTER TABLE people
      MODIFY COLUMN performer tinyint(1) NOT NULL DEFAULT '0',
      MODIFY COLUMN composer tinyint(1) NOT NULL DEFAULT '0'
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE people
      MODIFY COLUMN performer tinyint(1) NULL,
      MODIFY COLUMN composer tinyint(1) NULL
    SQL
  end
end
