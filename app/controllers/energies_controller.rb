class EnergiesController < ApplicationController
  before_action :set_energy, only: [:show, :edit, :update, :destroy]

  # GET /energies
  # GET /energies.json
  def index
    @energies = Energy.all
  end

  # GET /energies/1
  # GET /energies/1.json
  def show
  end

  def read
    @user =User.find(params[:id])
    @student = Student.find_by_student_id(@user.user_id)
    @energy = Energy.find_by_dormitory(@student.dormitory)
    if @energy.nil?
      @energy=Energy.new(dormitory:@student.dormitory,balance: 0,merchant: "电费缴纳")
      @energy.save
    end
    render "energies/index"
  end

  def charge
    @user =User.find(params[:id])
    @student = Student.find_by_student_id(@user.user_id)
    @account = Account.find_by_account_id(@user.user_id)
    @energy = Energy.find_by_dormitory(@student.dormitory)
    charge = params[:balance].to_i
    if charge>=0
      if @account.balance>=charge
       @account.balance-=charge
       @energy.balance+=charge
       @account.update(balance: @account.balance)
      @energy.update(balance: @energy.balance)
      #记录
      @record = Record.create(user_id: @user.user_id,merchant_id:"电费缴纳",amount: charge,balance: @account.balance)
       render 'energies/show'
      else
        flash[:notice] = '余额不足!'
      render 'energies/index'
      end
    else
      flash[:notice] = '充值金额应大于0!'
      render 'energies/index'
      end
  end

  # GET /energies/new
  def new
    @energy = Energy.new
  end

  # GET /energies/1/edit
  def edit
  end

  # POST /energies
  # POST /energies.json
  def create
    @energy = Energy.new(energy_params)

    respond_to do |format|
      if @energy.save
        format.html { redirect_to @energy, notice: 'Energy was successfully created.' }
        format.json { render :show, status: :created, location: @energy }
      else
        format.html { render :new }
        format.json { render json: @energy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /energies/1
  # PATCH/PUT /energies/1.json
  def update
    respond_to do |format|
      if @energy.update(energy_params)
        format.html { redirect_to @energy, notice: 'Energy was successfully updated.' }
        format.json { render :show, status: :ok, location: @energy }
      else
        format.html { render :edit }
        format.json { render json: @energy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /energies/1
  # DELETE /energies/1.json
  def destroy
    @energy.destroy
    respond_to do |format|
      format.html { redirect_to energies_url, notice: 'Energy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_energy
      @energy = Energy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def energy_params
      params.require(:energy).permit(:dormitory, :balance, :merchant)
    end
end
