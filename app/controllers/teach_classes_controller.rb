class TeachClassesController < ApplicationController
  before_action :set_teach_class, only: [:show, :edit, :update, :destroy]

  # GET /teach_classes
  # GET /teach_classes.json
  def index
    @teach_classes = TeachClass.all
  end

  def read
    @user = User.find(params[:id])
    @teacher = Teacher.find_by_teacher_id(@user.user_id)
    @teach_classes= TeachClass.where(teacher_id: @teacher.teacher_id)

    render "teach_classes/index"

  end

  def myclass
    @teacher_class = TeachClass.find(params[:id])
    @teacher = Teacher.find_by_teacher_id(@teacher_class.teacher_id)
    @schedules = Schedule.where(teachclass_id:@teacher_class.course_id)

    @schedules.each do |s|
      @students= Student.where(student_id: s.student_id)

    end

    render "teach_classes/myclass"
  end
  def show
  end

  # GET /teach_classes/new
  def new
    @teach_class = TeachClass.new
  end

  # GET /teach_classes/1/edit
  def edit
  end

  # POST /teach_classes
  # POST /teach_classes.json
  def create
    @teach_class = TeachClass.new(teach_class_params)
    @course = Course.new(course_id: @teach_class.course_id,describe: @teach_class.name)
    @course.save
    respond_to do |format|
      if @teach_class.save
        format.html { redirect_to @teach_class, notice: 'Teach class was successfully created.' }
        format.json { render :show, status: :created, location: @teach_class }
      else
        format.html { render :new }
        format.json { render json: @teach_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teach_classes/1
  # PATCH/PUT /teach_classes/1.json
  def update
    respond_to do |format|
      if @teach_class.update(teach_class_params)
        format.html { redirect_to @teach_class, notice: 'Teach class was successfully updated.' }
        format.json { render :show, status: :ok, location: @teach_class }
      else
        format.html { render :edit }
        format.json { render json: @teach_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teach_classes/1
  # DELETE /teach_classes/1.json
  def destroy
    @teach_class.destroy
    respond_to do |format|
      format.html { redirect_to teach_classes_url, notice: 'Teach class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teach_class
      @teach_class = TeachClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teach_class_params
      params.require(:teach_class).permit(:teacher_id, :course_id, :classroom_id,:class_time,:name)
    end
end
