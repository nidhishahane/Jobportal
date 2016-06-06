class CompaniesController < ApplicationController

  load_and_authorize_resource 
	before_action :authenticate_user!, :except => [:search_by_city]

  def index
    @companies= Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)

    if @company.save
        redirect_to company_path(@company), notice: "The company has been successfully created"
    end 
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])

    if @company.update_attributes(company_params)
      redirect_to companies_path, notice: "The company has been successfully updated"
    end
  end

  def destroy
      @company = Company.find(params[:id])
      @company.destroy
  end
  
  def search_by_city
      #@recent_vacancies = Vacancy.most_recent
    if params[:search]
      @companies = Company.search(params[:search]).order("created_at DESC")
    else
      @companies= Company.all.order('created_at DESC')
    end
  end
  
  private
  
  def company_params
      params.require(:company).permit(:name,:address,:contactno,:email,:technology,:city,:state)
  end

end
 