class EmployeeEditsController < ApplicationController
  before_action :authenticate_admin!

  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @search_term = params[:search]
    puts params[:limit]

    @employees = Employee.none.page(params[:page])
    unless @search_term.blank?
      @employees = Employee.where("first_name ILIKE ? OR last_name ILIKE ?", "%#{@search_term}%", "%#{@search_term}%").
          order(last_name: :asc, first_name: :asc).page(params[:page])
    end
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to employee_edit_path(@employee), notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    if params[:employee][:password].blank? && params[:employee][:password_confirmation].blank?
      params[:employee].delete(:password)
      params[:employee].delete(:password_confirmation)
    end

    params[:employee][:is_admin] = false if params[:employee][:is_admin].blank?
    params[:employee][:is_active] = false if params[:employee][:is_active].blank?

    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to employee_edit_path(@employee), notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    if @employee.update(is_active: false)
      respond_to do |format|
        format.html { redirect_to employee_edits_path, notice: 'Employee was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = Employee.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def employee_params
    #params.fetch(:employee, {})
    params.require(:employee).permit(:first_name, :email, :last_name, :password, :password_confirmation, :is_admin, :is_active)
  end
end
