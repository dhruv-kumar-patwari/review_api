module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filter_attributes)
      results = where(nil)
      filter_attributes.keys.each do |attribute|
        if filter_attributes[attribute].present?
          results = results.where("#{attribute} like ?",
                                  "%#{filter_attributes[attribute]}%")
        end
      end
      results
    end
  end
end
