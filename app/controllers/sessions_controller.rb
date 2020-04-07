class SessionsController < ApplicationController

  def new
  end

  def create_energy
    @user = User.find(params[:id])
    @account = Account.find_by(account_id: @user.user_id).try(:authenticate, params[:password])
    @student = Student.find_by_student_id(@user.user_id)
    @energy = Energy.find_by_dormitory(@student.dormitory)
    respond_to do |format|
      if @account
        format.html { redirect_to action: "charge",controller: "energies",id:params[:id],balance:params[:balance], notice: 'Admin was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
          flash[:notice] = "密码错误"
        format.html {redirect_to action: "read",controller: "energies",id:params[:id]}

      end
    end
  end

  def create_internet
    @user = User.find(params[:id])
    @account = Account.find_by(account_id: @user.user_id).try(:authenticate, params[:password])
    @student = Student.find_by_student_id(@user.user_id)
    @internet = Internet.find_by_user_id(@user.user_id)
    respond_to do |format|
      if @account
        format.html { redirect_to action: "charge",controller: "internets",id:params[:id],balance:params[:balance], notice: 'Admin was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        flash[:notice] = "密码错误"
        format.html {redirect_to action: "read",controller: "internets",id:params[:id]}

      end
    end
  end
  private
  def account_params
    params.require(:session).permit(:balance,:password)
  end

end
