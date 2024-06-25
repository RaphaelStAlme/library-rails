class CreateBaseTables < ActiveRecord::Migration[7.1]
  def change
    create_table :base_tables do |t|

      t.timestamps
    end
  end
end
