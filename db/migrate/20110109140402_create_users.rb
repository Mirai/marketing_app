class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :zip
      t.string :company
      t.string :subdomain

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
