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

  def pretty_datetime(datetime)
    datetime.strftime("%m/%d/%Y %OI:%M %Z") if datetime
  end
end
