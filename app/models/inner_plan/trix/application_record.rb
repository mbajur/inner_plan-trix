module InnerPlan
  module Trix
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
