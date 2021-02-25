class CreateGeoIps < ActiveRecord::Migration[6.1]
  def change
    create_table :geo_ips do |t|
      t.string :ip
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
