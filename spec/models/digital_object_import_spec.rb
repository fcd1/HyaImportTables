require 'rails_helper'

RSpec.describe DigitalObjectImport, :type => :model do

  before(:context) do

    puts "resettting stuff"
    # new_import_job = ImportJob.create
    #@new_import_job = ImportJob.new(name: "New Job")
    #@new_digital_object_import = DigitalObjectImport.new(import_job: @new_import_job)
    # @new_digital_object_import = DigitalObjectImport.new(import_job: @new_import_job, status: 0)
    # @new_digital_object_import.pending!
    # @new_import_job.save!
    # @new_digital_object_import.save!

  end

  after(:context) do

    # ImportJob.delete(@new_import_job.id)
    # DigitalObjectImport.delete(@new_digital_object_import.id)
      
  end

  xcontext "#new:" do

    xit "instance is invalid if required ImportJob arg is not given" do

      # new_digital_import_object = DigitalObjectImport.new
      # new_import_job.save!
      # expect(new_import_job.valid?).to eq(false)
      @bad_object = DigitalObjectImport.new
      expect(DigitalObjectImport.new).to raise_error

    end

    it "instance is valid if required name arg is given" do
      
      new_import_job = ImportJob.new(name: "New Job")
      new_digital_object_import = DigitalObjectImport.new(import_job: new_import_job)

      expect(new_import_job.valid?).to eq(true)

    end

  end  

  xcontext "Newly created instance has the correct default values:" do

    it "the status of a newly created should be pending" do

      new_import_job = ImportJob.new(name: "New Job")
      new_digital_object_import = DigitalObjectImport.new(import_job: new_import_job)

      # @new_digital_object_import.reload
      expect(new_digital_object_import.pending?).to eq(true)

    end
    
  end

  xcontext "Changing status of newly created instance:" do

    it "call to #success! changes status to success" do

      # puts @new_digital_object_import.inspect

      puts @new_digital_object_import.inspect

      @new_digital_object_import.success!
      @new_digital_object_import.save!
      @new_digital_object_import.reload

      puts @new_digital_object_import.inspect

      expect(@new_digital_object_import.success?).to eq(true)

    end

    it "call to #pending? now return false" do

      puts @new_digital_object_import.inspect
      puts "Changed? #{@new_digital_object_import.changed?}"
      @new_digital_object_import.save!
      puts @new_digital_object_import.inspect
      @new_digital_object_import.reload
      @new_digital_object_import.reload
      puts @new_digital_object_import.inspect
      expect(@new_digital_object_import.pending?).to eq(false)

    end
    
  end

  context "Testing stuff" do

    it "Testing stuff" do

      new_import_job = ImportJob.new(name: "New Job")
      new_digital_object_import = DigitalObjectImport.new(import_job: new_import_job)

      puts "Changed? #{new_digital_object_import.changed?}"
      puts new_digital_object_import.inspect
      new_digital_object_import.success!
      puts "Changed? #{new_digital_object_import.changed?}"
      puts new_digital_object_import.inspect
      new_digital_object_import.status = 'failure'
      puts "Changed? #{new_digital_object_import.changed?}"
      puts new_digital_object_import.inspect
      new_digital_object_import.digital_object_data = 'Hi Fred'
      puts "Changed? #{new_digital_object_import.changed?}"
      puts new_digital_object_import.inspect
      new_digital_object_import.pending!
      puts "Changed? #{new_digital_object_import.changed?}"
      puts new_digital_object_import.inspect
      new_digital_object_import.save!
      new_digital_object_import.reload
      puts new_digital_object_import.inspect
      new_digital_object_import.save!
      puts new_digital_object_import.inspect
      new_digital_object_import.reload
      new_digital_object_import.reload
      puts new_digital_object_import.inspect
      expect(new_digital_object_import.pending?).to eq(false)

    end
    
  end

end
