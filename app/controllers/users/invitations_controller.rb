class Users::InvitationsController < Devise::InvitationsController
  def new
    super
  end
  
  def create
    @family_id = params[:user].delete(:family_id)
    super
    @group = Group.new
    @group.user_id = User.find_by(email: params[:user][:email]).id
    @group.family_id = @family_id
    @group.save
  end

  def edit
    super
  end

  def update
    super
  end

  def destroy
    super
  end
end
