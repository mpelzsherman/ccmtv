class AddPerformanceRole < ActiveRecord::Migration

  def up
    create_table "performance_roles" do |t|
      t.references :person, :null => false
      t.references :performance, :null => false
      t.string  "role_name", :null => false
    end
    execute "insert into performance_roles (person_id, performance_id, role_name) " +
              "select person_id, id, 'performer' from performances"
    execute "insert into performance_roles (person_id, performance_id, role_name) " +
              "select c.person_id, p.id, 'composer' from performances p " +
              "join compositions c on (p.composition_id = c.id)"
  end

  def down
    drop_table "performance_roles"
  end
end
