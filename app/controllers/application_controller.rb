class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  #rescue_from CanCan::AccessDenied, :with => :no_access



def no_access
  respond_to do |type|
		type.html { render :file => "#{Rails.root}/public/422", :layout => false, :status => :not_found }
     type.all  { raise ActionController::RoutingError.new('422') }
   end
   true
 end

  end
