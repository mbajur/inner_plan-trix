module InnerPlan::Searches
  module ResultComponentPatch
    def description
      div do
        excerpt(@result.description.to_plain_text, '')
      end
    end
  end
end

InnerPlan::Searches::ResultComponent.prepend(InnerPlan::Searches::ResultComponentPatch)
