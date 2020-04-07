class Class1sController < ApplicationController
 before_action :set_class1, only: [ :show, :edit,:update, :destroy]

  # GET /class1s
  # GET /class1s.json
  def index
    @class1s = Class1.all

  end

 def show

 end

 def search

   @class1s= Class1.where('class_id like :str', str: "%#{params[:id]}%")
   render "class1s/index"
 end
  # GET /class1s/1
  # GET /class1s/1.json


  # GET /class1s/new
  def new
    @class1 = Class1.new
  end

  # GET /class1s/1/edit
  def edit

  end

  # POST /class1s
  # POST /class1s.json
  def create
    @class1 = Class1.new(class1_params)

    respond_to do |format|
      if @class1.save
        format.html { redirect_to @class1, notice: 'Class1 was successfully created.' }
        format.json { render :show, status: :created, location: @class1 }
      else
        format.html { render :new }
        format.json { render json: @class1.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class1s/1
  # PATCH/PUT /class1s/1.json
  def update
    respond_to do |format|
      if @class1.update(class1_params)
        format.html { redirect_to @class1, notice: 'Class1 was successfully updated.' }
        format.json { render :show, status: :ok, location: @class1 }
      else
        format.html { render :edit }
        format.json { render json: @class1.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class1s/1
  # DELETE /class1s/1.json
  def destroy
    @class1.destroy
    respond_to do |format|
      format.html { redirect_to class1s_url, notice: 'Class1 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class1
      @class1 = Class1.find(params[:id])
      @students = Student.where("class_id"=>@class1.class_id)
      @teacher = Teacher.find_by_teacher_id(@class1.director_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def class1_params
      params.require(:class1).permit(:class_id, :depart_id, :director_id)
    end
end
