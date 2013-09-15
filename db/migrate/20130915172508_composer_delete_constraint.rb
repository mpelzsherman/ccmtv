class ComposerDeleteConstraint < ActiveRecord::Migration

  # prevent deleting composers with compositions
  def change
    execute "alter table COMPOSITIONS add foreign key PEOPLE (person_id) references PEOPLE(id) ON DELETE RESTRICT"
  end

end
