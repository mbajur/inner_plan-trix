module InnerPlan
  module Trix
    class Engine < ::Rails::Engine
      isolate_namespace InnerPlan::Trix

      config.to_prepare do
        Dir.glob(File.join(File.dirname(__FILE__), '../../../app/**/*_patch*.rb')) do |c|
          Rails.configuration.cache_classes ? require(c) : load(c)
        end

        InnerPlan.importmap.pin "trix"
        InnerPlan.importmap.pin "@rails/actiontext", to: "actiontext.esm.js"
        InnerPlan.importmap.pin "inner_plan/trix/application", to: "inner_plan/trix/application.js", preload: true

        InnerPlan.configuration.additional_importmap_modules << 'inner_plan/trix/application'
      end

      initializer "inner_plan_trix.importmap", before: "importmap" do |app|
        # https://github.com/rails/importmap-rails#sweeping-the-cache-in-development-and-test
        app.config.importmap.cache_sweepers << root.join("app/javascript")
      end

      initializer "inner_plan_trix.assets" do |app|
        # my_engine/app/javascript needs to be in the asset path
        app.config.assets.paths << root.join("app/javascript")
      end

      config.after_initialize do
        InnerPlan.configuration.task_edit_view_rows
          .get(:secondary_row)
          .content
          .replace(:description, InnerPlan::SmartArray::Item.new(
            :description,
            { span: 12 },
            proc { |context:, form:|
              InnerPlan::Tasks::Form::ItemComponent.new(icon: Phlex::Icons::Tabler::FileText, title: 'Description') do
                context.plain form.rich_text_area(:description, autofocus: (context.focus == :description))
              end
            })
          )
      end
    end
  end
end
