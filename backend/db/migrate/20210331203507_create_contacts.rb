class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :_id
      t.string :contactId
      t.string :contactStatus
      t.integer :contactName
      t.string :contactGround
      t.string :contactSatellite
      t.string :contactEquipment
      t.string :contactState
      t.string :contactStep
      t.string :contactDetail
      t.bigint :contactBeginTimestamp
      t.bigint :contactEndTimestamp
      t.integer :contactLatitude
      t.integer :contactLongitude
      t.integer :contactAzimuth
      t.integer :contactElevation
      t.string :contactResolution
      t.string :contactResolutionStatus
      t.timestamps
    end
  end
end
