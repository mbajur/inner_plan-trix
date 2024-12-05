require "inner_plan/trix/version"
require "inner_plan/trix/railtie"

module InnerPlan
  module Trix
    module TaskPatch
      def self.prepended(base)
        base.has_rich_text :description
      end
    end

    module DescriptionRendererPatch
      def self.prepended(base)
        base.step nil, delete: :apply_simple_format
      end
    end
  end
end
