class Bee < ActiveRecord::Base
  has_one :keyword

  # def to_csv
  #   CSV.generate do |csv|
  #     csv << column_names
  #     all.each do |bee|
  #       csv << bee.attributes.values_at(*column_names)
  #     end
  #   end
  # end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |bee|
        csv << bee.attributes.values_at(*column_names)
      end
    end
  end


end