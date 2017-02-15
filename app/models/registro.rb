class Registro < ActiveRecord::Base
  belongs_to :user

  def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |registro|
				csv << registro.attributes.values_at(*column_names)
			end
		end
	end
end
