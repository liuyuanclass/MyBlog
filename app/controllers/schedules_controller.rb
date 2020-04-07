class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET /schedules
  # GET /schedules.json
  def index

   @schedules = Schedule.all
  end

 def read
   @user = User.find(params[:id])
   @student = Student.find_by_student_id(@user.user_id)
   @schedules= Schedule.where(student_id: @student.student_id)

   render "schedules/index"
 end
  #选课
 def selection
   @user = User.find(params[:id])
   @student = Student.find_by_student_id(@user.user_id)
   @teach_classes= TeachClass.all

   render "schedules/selection"
 end
def add_course
  @user = User.find(params[:id])
  @student = Student.find_by_student_id(@user.user_id)

  @teach_class = TeachClass.find(params[:tid])


  @schedule = Schedule.create(student_id:@student.student_id,teachclass_id:@teach_class.course_id,class_time: @teach_class.class_time,name: @teach_class.name,teacher_id:@teach_class.teacher_id)

  @schedules = Schedule.where(student_id:@student.student_id)
  render "schedules/index"
end
  #查找
  def search
     @user = User.find(params[:id])
     @student = Student.find_by_student_id(@user.user_id)
     @teach_classes = TeachClass.where(course_id: params[:tid])
     if @teach_classes.empty?
       @teach_classes = TeachClass.where(name:params[:tid])
     end

      render "schedules/selection"
  end

  def show
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy

    @user = User.find_by_user_id(@schedule.student_id)
    respond_to do |format|
      format.html { redirect_to  action: :read,:id=>@user.id , notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:student_id, :teachclass_id)
    end
end
