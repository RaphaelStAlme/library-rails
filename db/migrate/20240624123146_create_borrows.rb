class CreateBorrows < ActiveRecord::Migration[7.1]
  def change
    create_table :borrows do |t|

      t.timestamps
    end
  end
end
