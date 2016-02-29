class Admin::SkillsController < AdminController

before_action :set_skill , :only => [:show, :edit, :destroy, :update]


  def index
    @skills = Skill.all
    respond_to do |format|
      format.html #index.html
      format.json { render json: @skills}
    end
  end

  def show
  # geting skill for set_skill
  respond_to do |format|
    format.html
    format.json { render json: @skill}
  end
  end

def new
    @skill = Skill.new
end

def create
  @skill = Skill.new(skill_params)
  respond_to do |format|
    if @skill.save
      flash[:success] = 'Umiejętność dodana'
      format.html { redirect_to admin_skills_path }
    else
      format.html {render action: 'new', alert: 'Błąd podczas dodawania'}
    end
  end
end

def edit
# geting skill for set_skill
end

def update
  respond_to do |format|
      if @skill.update(skill_params)
          flash[:success] = 'Umiejętność zakutalizowana'
          format.html { redirect_to admin_skills_path }
        else
          flash[:success] = 'Błąd poczas akutalizacji'
          format.html { render action: 'edit' }
        end
      end
end

def destroy
  @skill.destroy
  respond_to do |format|
    flash[:success] = 'Umiejetność usunięta'
    format.html { redirect_to admin_skills_path }
  end
end

protected

def set_skill
  @skill = Skill.find(params[:id])
end

def skill_params

params.require(:skill).permit(:name, :description)

end

end
