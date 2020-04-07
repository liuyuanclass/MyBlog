class Class2sController < ApplicationController
  before_action :set_class2, only: [:show, :edit, :update, :destroy]

  def self.controller_path
    "class1s"
  end
  def index
    @class2s = Class2.all
  end

  # GET /class2s/1
  # GET /class2s/1.json
  def show
  end

  # GET /class2s/new
  def new
    @class2 = Class2.new
  end

  # GET /class2s/1/edit
  def edit
  end

  # POST /class2s
  # POST /class2s.json
  def create
    @class2 = Class2.new(class2_params)

    respond_to do |format|
      if @class2.save
        format.html { redirect_to @class2, notice: 'Class2 was successfully created.' }
        format.json { render :show, status: :created, location: @class2 }
      else
        format.html { render :new }
        format.json { render json: @class2.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class2s/1
  # PATCH/PUT /class2s/1.json
  def update
    respond_to do |format|
      if @class2.update(class2_params)
        format.html { redirect_to @class2, notice: 'Class2 was successfully updated.' }
        format.json { render :show, status: :ok, location: @class2 }
      else
        format.html { render :edit }
        format.json { render json: @class2.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class2s/1
  # DELETE /class2s/1.json
  def destroy
    @class2.destroy
    respond_to do |format|
      format.html { redirect_to class2s_url, notice: 'Class2 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_class2
    @user = User.find(params[:id])
    @teacher = Teacher.find_by_teacher_id(@user.user_id)
    if @teacher.nil?
      redirect_to new_teacher_path ,notice: "你还没有完善个人信息"
    else
      @class1 = Class1.find_by_director_id(@teacher.teacher_id)
      if @class1.nil?
        render :'class1s/nothing'
      else
        @students = Student.where("class_id"=>@class1.class_id)
        @teacher = Teacher.find_by_teacher_id(@class1.director_id)
      end
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def class2_params
      params.require(:class2).permit(:class2_id)
    end
end
