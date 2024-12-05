module InnerPlan
  module Trix
    class Railtie < ::Rails::Railtie
      config.after_initialize do
        InnerPlan::Task.prepend(TaskPatch)
        InnerPlan::Tasks::DescriptionRenderer.prepend(DescriptionRendererPatch)

        InnerPlan::Tasks::EditView::ROWS
          .get(:secondary_row)
          .content
          .replace(:description, InnerPlan::SmartArray::Item.new(
            :description,
            { span: 12 },
            proc { |context:, form:|
              InnerPlan::Tasks::Form::ItemComponent.new(icon: Phlex::Icons::Tabler::FileText, title: 'Description') do
                context.plain form.rich_textarea(:description, autofocus: (context.focus == :description))
              end
            })
          )
      end
    end
  end
end
