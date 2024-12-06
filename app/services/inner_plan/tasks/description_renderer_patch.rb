module InnerPlan
  module Tasks
    module DescriptionRendererPatch
      def self.prepended(base)
        base.step nil, delete: :apply_simple_format
      end
    end
  end
end

# @todo why is that being called twice?
InnerPlan::Tasks::DescriptionRenderer.prepend(InnerPlan::Tasks::DescriptionRendererPatch) unless InnerPlan::Tasks::DescriptionRenderer.include?(InnerPlan::Tasks::DescriptionRendererPatch)
