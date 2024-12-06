module InnerPlan::List::Operation
  module IndexPatch
    def self.prepended(base)
      base.step :include_description, after: :find_models
    end

    private

    def include_description(ctx, models:, **)
      ctx[:models] = models.includes(tasks: :rich_text_description)
    end
  end
end

InnerPlan::List::Operation::Index.prepend(InnerPlan::List::Operation::IndexPatch) unless InnerPlan::List::Operation::Index.include?(InnerPlan::List::Operation::IndexPatch)
