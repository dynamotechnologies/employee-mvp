module ApplicationHelper
  def resource_name
    :employee
  end

  def resource
    @employee ||= Employee.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:employee]
  end
end
