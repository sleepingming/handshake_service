class CreateHandshakes < ActiveRecord::Migration[6.1]
  def change
    create_table :handshakes do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :status

      t.timestamps
    end
  end
end
