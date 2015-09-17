class ImportJob < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  has_many :digital_object_import, dependent: :destroy

  def success?

    my_id = id
    
    DigitalObjectImport.where(import_job: self).each do |import|

      puts 'Here is the DigitalObjectImport inside the where:' +  import.inspect
      return false if (import.pending? || import.failure?)

    end

    # if got here, the all imports were successfull
    true

  end



end
