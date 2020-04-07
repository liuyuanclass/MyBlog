class AccountsController < ApplicationController
  before_action :authenticate_user!
  def new
    @account = Account.new
  end

  def index
    @user = User.find(params[:id])
    @student = Student.find_by_student_id(@user.user_id)
    @account = Account.find_by_account_id(@user.user_id)
    if @account.nil?
      redirect_to action: :new
    else

    render 'accounts/index'
      end
  end
  #充值
  def charge
    @user =User.find(params[:id])
    @student = Student.find_by_student_id(@user.user_id)
    @account = Account.find_by_account_id(@user.user_id)
    charge = params[:balance].to_i
    if charge>=0
    @account.balance+=charge
    @account.update(balance: @account.balance)
    #记录
    @record = Record.create(user_id: @user.user_id,merchant_id:"流水充值",amount: charge,balance: @account.balance)
    render 'accounts/index'
    else
      flash[:notice] = '充值金额应大于0!'
      render 'accounts/index'
      end
  end

  def create
    @account = Account.create(account_params)
    @account.balance=0
    if @account.save
       render "home/index"
    else
      render "new"
    end
  end

  private
    def account_params
      params.require(:account).permit(:account_id, :password, :password_confirmation)
    end

end
