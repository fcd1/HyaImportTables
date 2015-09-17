class CreateDigitalObjectImports < ActiveRecord::Migration

  def change

    create_table :digital_object_imports do |t|

      t.text :digital_object_data
      t.integer :status, null: false
      t.references :import_job, null: false, index: true

      t.timestamps null: false

    end

    add_foreign_key :digital_object_imports, :import_jobs

  end

end
