class InternetsController < ApplicationController
  before_action :set_internet, only: [:show, :edit, :update, :destroy]

  # GET /internets
  # GET /internets.json
  def index
    @internets = Internet.all
  end

  # GET /internets/1
  # GET /internets/1.json
  def show
  end

  def read
    @user =User.find(params[:id])
    @student = Student.find_by_student_id(@user.user_id)
    @internet = Internet.find_by_user_id(@student.student_id)
    if @internet.nil?
      @internet=Internet.new(user_id:@user.user_id,balance: 0,merchant: "网费缴纳")
      @internet.save
    end
    render "internets/index"
  end

  def charge
    @user =User.find(params[:id])
    @student = Student.find_by_student_id(@user.user_id)
    @account = Account.find_by_account_id(@user.user_id)
    @internet = Internet.find_by_user_id(@user.user_id)
    charge = params[:balance].to_i
    if charge>=0
      if @account.balance>=charge
    @account.balance-=charge
    @internet.balance+=charge
    @account.update(balance: @account.balance)
    @internet.update(balance: @internet.balance)

    #记录
    @record = Record.create(user_id: @user.user_id,merchant_id:"网费缴纳",amount: charge,balance: @account.balance)
      else
        flash[:notice] = '余额不足!'
    render 'internets/show'
    end
    else
      flash[:notice] = '充值金额应大于0!'
      render 'internets/show'
      end
  end

  # GET /internets/new
  def new
    @internet = Internet.new
  end

  # GET /internets/1/edit
  def edit
  end

  # POST /internets
  # POST /internets.json
  def create
    @internet = Internet.new(internet_params)

    respond_to do |format|
      if @internet.save
        format.html { redirect_to @internet, notice: 'Internet was successfully created.' }
        format.json { render :show, status: :created, location: @internet }
      else
        format.html { render :new }
        format.json { render json: @internet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /internets/1
  # PATCH/PUT /internets/1.json
  def update
    respond_to do |format|
      if @internet.update(internet_params)
        format.html { redirect_to @internet, notice: 'Internet was successfully updated.' }
        format.json { render :show, status: :ok, location: @internet }
      else
        format.html { render :edit }
        format.json { render json: @internet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /internets/1
  # DELETE /internets/1.json
  def destroy
    @internet.destroy
    respond_to do |format|
      format.html { redirect_to internets_url, notice: 'Internet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_internet
      @internet = Internet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def internet_params
      params.require(:internet).permit(:user_id, :balance, :merchant)
    end
end
