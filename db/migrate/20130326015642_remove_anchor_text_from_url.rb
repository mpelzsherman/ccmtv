class RemoveAnchorTextFromUrl < ActiveRecord::Migration
  def up
    remove_column :urls, :anchor_text
      end

  def down
    add_column :urls, :anchor_text, :string
  end
end
