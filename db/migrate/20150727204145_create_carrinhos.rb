class CreateCarrinhos < ActiveRecord::Migration
  def change
    create_table :carrinhos do |t|

        t.belongs_to :produto, index: true
        t.belongs_to :pedido, index: true
        t.integer :quantidade

      t.timestamps
    end
  end
end
