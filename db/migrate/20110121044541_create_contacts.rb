class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :message
      t.boolean :respond

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
