class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, except: [:index, :show]

  def index
    @challenges = Challenge.all
  end

  def show
  end

  def new
    @challenge = Challenge.new
    authorize @challenge, :create?
  end

  def edit
    authorize @challenge, :update?
  end

  def create
    @challenge = Challenge.new(challenge_params.merge(user_id: current_user.id))

    authorize @challenge, :create?

    respond_to do |format|
      if @challenge.save
        format.html { redirect_to @challenge, notice: 'Challenge was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    authorize @challenge, :update?
    respond_to do |format|
      if @challenge.update(challenge_params)
        format.html { redirect_to @challenge, notice: 'Challenge was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    authorize @challenge, :destroy?
    @challenge.destroy
    respond_to do |format|
      format.html { redirect_to challenges_path, notice: 'Challenge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_challenge
    @challenge = Challenge.friendly.find(params[:id])
  end

  def challenge_params
    params.require(:challenge).permit(:user_id, :challenge_partner_id, :title, :description)
  end
end
