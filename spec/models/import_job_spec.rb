require 'rails_helper'

RSpec.describe ImportJob, :type => :model do

  # let(:test_id) { i = 31415926535 }
  let(:test_id) { i = 77 }
  let(:test_id_2) { i = 78 }

  before(:context) do

    # ImportJob.destroy_all
    # puts ImportJob.all
    # new_import_job = ImportJob.new(name: 'Fred')
    # new_import_job2 = ImportJob.new(name: 'Fred')
    # puts ImportJob.all
    # @test_user = User.new(id: 77, name: "Test User")
    # @test_import_job = ImportJob.new(id: 77, name: 'All Jobs Successful', user: @test_user)
    # @digital_object_import1 = DigitalObjectImport.new(id: 77, import_job: @test_import_job)
    # @digital_object_import1.success!
    # puts @digital_object_import1.changed?
    # @digital_object_import1.digital_object_data = 'Blah!'
    # puts @digital_object_import1.changed?

    # @digital_object_import2 = DigitalObjectImport.new(id: 78, import_job: @test_import_job)
    # @digital_object_import2.digital_object_data = 'Blah!'
    # @digital_object_import2.save!

    # @digital_object_import1.reload
    # puts @digital_object_import1.status

    # @digital_object_import1.failure!
    # puts @digital_object_import1.status
    
    # @digital_object_import1.reload
    # puts @digital_object_import1.status

    # @test_import_job.destroy
    # @digital_object_import1.destroy

  end

  context "#new:" do

    it "instance is invalid if required name arg is not given" do

      test_user = User.new(id: test_id)
      new_import_job = ImportJob.new(id: test_id, user: test_user)
      expect(new_import_job.valid?).to eq(false)

    end

    it "instance is valid if required name arg is given" do

      test_user = User.new(id: test_id)
      new_import_job = ImportJob.new(id: test_id, name: 'First Job', user: test_user)
      expect(new_import_job.valid?).to eq(true)

    end

  end  

  context "#success?:" do

    it "returns true if all imports for the job were successful" do

      test_user = User.new(id: test_id)
      test_import_job = ImportJob.create(id: test_id, name: 'All Jobs Successful', user: test_user)
      digital_object_import1 = DigitalObjectImport.new(import_job: test_import_job)

      # puts 'Here is digital_object_import1 before call to success!:' + digital_object_import1.inspect

      digital_object_import1.success!
      
      # puts 'Here is digital_object_import1 after call to success!:' + digital_object_import1.inspect

      # puts digital_object_import1.save!

      digital_object_import1.reload
      
      # puts 'Here is digital_object_import1 after reload:' + digital_object_import1.inspect

      digital_object_import2 = DigitalObjectImport.create!(import_job: test_import_job)

      digital_object_import2.success!

      # puts digital_object_import2.save!

      digital_object_import2.reload
      
      # puts digital_object_import2.inspect

      expect(test_import_job.success?).to eq(true)

    end

    it "returns false if some imports for the job were not successful: one failure" do

      test_user = User.new(id: test_id)
      test_import_job = ImportJob.create(id: test_id, name: 'All Jobs Successful', user: test_user)
      digital_object_import1 = DigitalObjectImport.new(import_job: test_import_job)

      # puts 'Here is digital_object_import1 before call to success!:' + digital_object_import1.inspect

      digital_object_import1.success!
      
      # puts 'Here is digital_object_import1 after call to success!:' + digital_object_import1.inspect

      # puts digital_object_import1.save!

      digital_object_import1.reload
      
      # puts 'Here is digital_object_import1 after reload:' + digital_object_import1.inspect

      digital_object_import2 = DigitalObjectImport.create!(import_job: test_import_job)

      digital_object_import2.failure!

      # puts digital_object_import2.save!

      digital_object_import2.reload
      
      # puts digital_object_import2.inspect

      expect(test_import_job.success?).to eq(false)

    end

    it "returns false if some imports for the job were not successful: one pending" do

      test_user = User.new(id: test_id)
      test_import_job = ImportJob.create(id: test_id, name: 'All Jobs Successful', user: test_user)
      digital_object_import1 = DigitalObjectImport.new(import_job: test_import_job)

      # puts 'Here is digital_object_import1 before call to success!:' + digital_object_import1.inspect

      digital_object_import1.success!
      
      # puts 'Here is digital_object_import1 after call to success!:' + digital_object_import1.inspect

      # puts digital_object_import1.save!

      digital_object_import1.reload
      
      # puts 'Here is digital_object_import1 after reload:' + digital_object_import1.inspect

      digital_object_import2 = DigitalObjectImport.create!(import_job: test_import_job)

      digital_object_import2.reload
      
      # puts digital_object_import2.inspect

      expect(test_import_job.success?).to eq(false)

    end

  end

  context "test ImportJob with mutliple dependent DigitalObjectModel:" do

    it "one ImportJob with two DigitalObjectImport instance" do

      test_user = User.create(id: test_id)
      test_import_job = ImportJob.create(id: test_id, name: 'All Jobs Successful', user: test_user)
      digital_object_import1 = DigitalObjectImport.create(id: test_id,import_job: test_import_job,
                                                          digital_object_data: 'Foo')
      digital_object_import2 = DigitalObjectImport.create(id: test_id_2,import_job: test_import_job,
                                                          digital_object_data: 'Moo')

      test_import_job.digital_object_import.all.where(digital_object_data: 'Moo').each do |import|

        puts import.inspect

      end

    end

  end

  xcontext "test destruction of dependent DigitalObjectModel:" do

    xcontext "Sanity check: depedent DigitalObjectModel exist and can be retrieved via ImportJob" do

      test_user = User.create(id: test_id)
      test_import_job = ImportJob.create(id: test_id, name: 'All Jobs Successful', user: test_user)
      digital_object_import1 = DigitalObjectImport.create(import_job: test_import_job)
      digital_object_import1 = DigitalObjectImport.create(import_job: test_import_job)

      it "sanity check: depedent DigitalObjectModel exist and can be retrieved via ImportJob" do

      end

    end

  end

end
