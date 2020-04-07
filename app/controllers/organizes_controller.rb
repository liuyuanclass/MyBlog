class OrganizesController < ApplicationController
  before_action :set_organize, only: [:show, :edit, :update, :destroy]

  # GET /organizes
  # GET /organizes.json
  def index
    @organizes = Organize.all
  end
   def read
     @user =User.find(params[:id])
     @student = Student.find_by_student_id(@user.user_id)
     @organizes = Organize.where(student_id: @student.student_id )
     if @organizes.nil?
       render "organizes/new"
     else

       render "organizes/index"
     end
   end
   def add_organize
     @user =User.find(params[:id])
     @student = Student.find_by_student_id(@user.user_id)
     @community = Community.find(params[:cid])
     @organize = Organize.create(student_id: @student.student_id,community_id:@community.community_id)

     @organizes = Organize.where(student_id: @student.student_id )
     render "organizes/index"
   end

  def my_organize
    @user =User.find(params[:id])
    @student = Student.find_by_student_id(@user.user_id)
    @communities = Community.where(leader:@student.student_id)
    render "organizes/my_organize"
  end

  def show
  end

  # GET /organizes/new
  def new
    @organize = Organize.new
  end

  # GET /organizes/1/edit
  def edit
  end

  # POST /organizes
  # POST /organizes.json
  def create
    @organize = Organize.new(organize_params)

    respond_to do |format|
      if @organize.save
        format.html { redirect_to @organize, notice: 'Organize was successfully created.' }
        format.json { render :show, status: :created, location: @organize }
      else
        format.html { render :new }
        format.json { render json: @organize.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizes/1
  # PATCH/PUT /organizes/1.json
  def update
    respond_to do |format|
      if @organize.update(organize_params)
        format.html { redirect_to @organize, notice: 'Organize was successfully updated.' }
        format.json { render :show, status: :ok, location: @organize }
      else
        format.html { render :edit }
        format.json { render json: @organize.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizes/1
  # DELETE /organizes/1.json
  def destroy
    @organize.destroy
    @user = User.find_by_user_id(@organize.student_id)
    respond_to do |format|
      format.html {  redirect_to  action: :read,:id=>@user.id , notice: 'Organize was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organize
      @organize = Organize.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organize_params
      params.require(:organize).permit(:student_id, :community_id)
    end
end
