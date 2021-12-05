Rails.application.routes.draw do

  get("/export_text", { :controller => "text", :action => "export" })

  get("/text",  { :controller => "magic", :action => "text_form" })
  
  post("/process_text", { :controller => "magic", :action => "text_results" })

  # =============================

  get("/vision",  { :controller => "vision", :action => "homepage" })

  get("/vision/:detector", { :controller => "vision", :action => "form" })
  post("/vision/:detector", { :controller => "vision", :action => "magic" })

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
