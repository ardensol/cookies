class Addappointments < ActiveRecord::Migration
  def change
  	create_table :appointments do |t|
      t.integer :user_id
      t.string  :email
      t.string  :phone_number
      t.date    :appointment_date
      t.string  :type
      t.text    :comments
      t.string  :address_line_1
      t.string  :address_line_2
      t.string  :city
      t.string  :state
      t.string  :zip
      t.string  :coupon_code
      t.string  :stripe_token
      t.timestamps null: false
    end
  end
end
