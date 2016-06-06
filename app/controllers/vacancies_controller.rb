class VacanciesController < ApplicationController
  load_and_authorize_resource 
  before_action :authenticate_user!, :except => [:recent]
  
  def index
    @vacancies = Vacancy.all
  end

  def create
    @company = Company.find(params[:company_id])
    @vacancy = @company.vacancies.new(vacancy_params)
         @vacancy.save
    redirect_to company_path(@company)
  end
  
  def show
    @vacancy = Vacancy.find(params[:id])
  end

  def new
    @vacancy = Vacancy.new
  end

  def destroy
    @company = Company.find(params[:company_id])
    @vacancy = @company.vacancies.find(params[:id])
    @vacancy.destroy
    redirect_to company_path(@company)
  end

 # def apply
  #  @vacancy = Vacancy.find(params[:id])
   # @appieduser = Vacancy.apply(@vacancy,current_user.id)
  #end

  def recent
      #@recent_vacancies = Vacancy.most_recent
    if params[:search]
      @vacancies = Vacancy.search(params[:search]).order("created_at DESC")
    else
      @vacancies = Vacancy.all.order('created_at DESC')
    end
  end

  private

  def vacancy_params
    params.require(:vacancy).permit(:name,:number_of_vacancy,:eligibility,:technology,:salary,:experience,:key_skills)
  end
   
end




