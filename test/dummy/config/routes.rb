Rails.application.routes.draw do
  mount InnerPlan::Trix::Engine => "/inner_plan-trix"
end
