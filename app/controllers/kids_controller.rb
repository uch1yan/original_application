class KidsController < ApplicationController
  def new
    @kid = Kid.new
  end

  def create
    @kid = Kid.new(kid_params)
    respond_to do |format|
      if @kid.save
        format.html { redirect_to kid_url(@kid), notice: "登録が完了しました！" }
        format.json { render :show, status: :created, location: @kid }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kid.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @kid = Kid.find(params[:id])
  end

  def update
    @kid = Kid.find(params[:id])
    respond_to do |format|
      if @kid.update(kid_params)
        format.html { redirect_to new_kid_url(@kid), notice: "情報を更新しました！" }
        format.json { render :show, status: :ok, location: @kid }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kid.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @kid = Kid.find(params[:id])
  end

  def destroy
    @kid = Kid.find(params[:id])
    @kid.destroy
    respond_to do |format|
      format.html { redirect_to new_kid_url, notice: "kid was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private

  def kid_params
    params.require(:kid).permit(:family_id, :kid_name, :date_of_birth, :avatar)
  end
end
