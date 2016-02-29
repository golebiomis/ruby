class Admin::EmployersController < AdminController

before_action :set_employer, :only => [:show, :edit, :destroy, :update]


  def index
    @employers = Employer.all
    respond_to do |format|
      format.html #index.html
      format.json { render json: @employers }
    end
  end

  def show
  # geting employer for set_employer
  respond_to do |format|
    format.html
    format.json { render json: @employer}
  end
  end

def new
    @employer = Employer.new
end

def create
  @employer = Employer.new(employer_params)
  respond_to do |format|
    if @employer.save
      flash[:success] = 'Pracownik dodany'
      format.html { redirect_to admin_employers_path}
      format.json { render :show, status: :created, location: admin_employers_path }
    else
      flash[:success] = 'Błąd podczas dodawania'
      format.html { render action: 'new'}
      format.json { render json: @employer.errors, status: :unprocessable_entity }

    end
  end
end

def edit
# geting employer for set_employer
end

def update
  respond_to do |format|
      if @employer.update(employer_params)
        flash[:success] = 'Pracownik zakutalizowany'
        format.html { redirect_to admin_employer_path(@employer)}
         format.json { render :show, status: :ok, location: @employer }
        else
          flash[:success] = 'Pracownik zakutalizowany'
          format.html {  render action: 'edit'}
               format.json { render json: @employer.errors, status: :unprocessable_entity }
        end
      end
end

def destroy
  @employer.destroy
  respond_to do |format|
    flash[:success] = 'Pracownik usunięty'
    format.html {redirect_to admin_employers_path}
  end
end

protected

def set_employer
  @employer = Employer.find(params[:id])
end

def employer_params

params.require(:employer).permit(:name, :surname, :phone, :address, :PESEL, :description, skill_ids:[])

end

end
