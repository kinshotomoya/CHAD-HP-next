class Admin::AdusersController < Admin::ApplicationController

  def index
    @adusers = Aduser.all
    @adkiseis = Adkisei.all
  end

  def new
    @aduser = Aduser.new
    @adkiseis = Adkisei.all
  end

  def search
    @adkiseis = Adkisei.all
    @adkisei_param = params[:aduser][:adkisei_id]
    @name_param = params[:aduser][:name]

    if @adkisei_param.nil? && @name_param.nil?
      redirect_to admin_root_path
    elsif @adkisei_param.present? && @name_param.present?
      @adusers = Aduser.where("adkisei_id = ? AND name LIKE?", params[:aduser][:adkisei_id], "%#{params[:aduser][:name]}%")
      return @adusers
    elsif @name_param.present?
      @adusers = Aduser.where('name LIKE?', "%#{params[:aduser][:name]}%")
      return @adusers
    elsif @adkisei_param.present?
      @adusers = Aduser.where("adkisei_id = ?", params[:aduser][:adkisei_id])
      return @adusers
    end
  end

  def create
    @aduser = Aduser.new(aduser_params)
    if @aduser.save
      redirect_to  admin_adusers_path
    else
    end
  end

  def edit
    @aduser = Aduser.find(params[:id])
    @adkiseis = Adkisei.all
  end

  def update
    @aduser = Aduser.find(params[:id])
    if @aduser.update(aduser_params)
      redirect_to admin_adusers_path
    else
    end
  end

  def show
    @aduser = Aduser.find(params[:id])
  end

  def destroy
    @aduser = Aduser.find(params[:id])
    if @aduser.destroy
      redirect_to admin_adusers_path
    else
    end
  end


  private

  def aduser_params
    params.require(:aduser).permit(:adkisei_id, :name, :role, :email, :adress, :phone, :avator, :university, :studentnumber)
  end

end
