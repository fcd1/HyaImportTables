require 'rails_helper'

RSpec.describe ImportJob, :type => :model do

  before(:context) do

    # ImportJob.destroy_all
    puts ImportJob.all
    # new_import_job = ImportJob.new(name: 'Fred')
    # new_import_job2 = ImportJob.new(name: 'Fred')
    puts ImportJob.all

      
  end
  
  context "#new:" do

    it "instance is invalid if required name arg is not given" do

      new_import_job = ImportJob.new
      expect(new_import_job.valid?).to eq(false)

    end

    it "instance is valid if required name arg is given" do

      new_import_job = ImportJob.new(name: 'First Job')
      expect(new_import_job.valid?).to eq(true)

    end

  end  

  context "#success?:" do

    it "returns true if all imports for the job were successful" do

      test_import_job = ImportJob.create(name: 'All Jobs Successful')
      digital_object_import1 = DigitalObjectImport.new(import_job: test_import_job)

      puts 'Here is digital_object_import1 before call to success!:' + digital_object_import1.inspect

      digital_object_import1.success!
      
      puts 'Here is digital_object_import1 after call to success!:' + digital_object_import1.inspect

      puts digital_object_import1.save!

      digital_object_import1.reload
      
      puts 'Here is digital_object_import1 after reload:' + digital_object_import1.inspect

      digital_object_import2 = DigitalObjectImport.create!(import_job: test_import_job)
      digital_object_import2.success!

      # puts digital_object_import2.inspect

      expect(test_import_job.success?).to eq(true)

    end

  end

end
