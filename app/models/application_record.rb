class ApplicationRecord < ActiveRecord::Base
  # ApplicationRecordのDBを探さないようにする為
  self.abstract_class = true
end
