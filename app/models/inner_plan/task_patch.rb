module InnerPlan
  module TaskPatch
    def self.prepended(base)
      base.has_rich_text :description
    end
  end
end

InnerPlan::Task.prepend(InnerPlan::TaskPatch)
