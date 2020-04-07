class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy]

  # GET /businesses
  # GET /businesses.json
  def index
    @businesses = Business.all
  end

  def search

    @businesses= Business.where('business_id like :str', str: "%#{params[:id]}%")
    render "businesses/index"
  end


  def show
  end

  # GET /businesses/new
  def new
    @business = Business.new
  end

  # GET /businesses/1/edit
  def edit
  end

  def file_download

    @business = Business.find(params[:id])
    send_file "#{Rails.root}/public/upload/#{@business.plan_url}"
  end

  def mybusiness
    @user = User.find(params[:id])
    @student =Student.find_by_student_id(@user.user_id)
    @businesses = Business.where(leader_id: @student.student_id)

    render 'businesses/index'
  end

  def edit_state
     @business =Business.find(params[:id])
     state = params[:state]
    @business.state = state
    @business.update(business_params)

    render "teachers/mentor"
  end

  def create

    @business = Business.new(business_params)
    uploaded_file = params[:business][:plan_url]
    File.open(Rails.root.join('public', 'upload', uploaded_file.original_filename), 'wb') do |file|
      file.write(uploaded_file.read)
    end
    @business.plan_url = uploaded_file.original_filename
    @business.state = "待审核"
    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Business was successfully created.' }
        format.json { render :show, status: :created, location: @business }
      else
        format.html { render :new }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /businesses/1
  # PATCH/PUT /businesses/1.json
  def update
    respond_to do |format|
      if @business.update(business_params)
        format.html { redirect_to @business, notice: 'Business was successfully updated.' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :edit }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businesses/1
  # DELETE /businesses/1.json
  def destroy
    @business.destroy
    respond_to do |format|
      format.html { redirect_to businesses_url, notice: 'Business was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_params
          params.require(:business).permit(:business_id, :leader_id, :leader_name,:plan_url , :mentor, :state)
    end
end
