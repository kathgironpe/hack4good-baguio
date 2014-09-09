class ChallengePartnersController < ApplicationController
  before_action :set_challenge_partner, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, except: [:index, :show]

  def index
    @challenge_partners = ChallengePartner.order('name ASC')
  end

  def show
  end

  def new
    @challenge_partner = ChallengePartner.new
    authorize @challenge_partner, :create?
  end

  def edit
    authorize @challenge_partner, :update?
  end

  def create
    @challenge_partner = ChallengePartner.new(challenge_partner_params)
    authorize @challenge_partner, :create?

    respond_to do |format|
      if @challenge_partner.save
        format.html { redirect_to @challenge_partner }
      else
        format.html { render :new }
      end
    end
  end

  def update
    authorize @challenge_partner, :update?
    respond_to do |format|
      if @challenge_partner.update(challenge_partner_params)
        format.html { redirect_to @challenge_partner }
        format.json { render :show, status: :ok, location: @challenge_partner }
      else
        format.html { render :edit }
        format.json { render json: @challenge_partner.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @challenge_partner.destroy
    respond_to do |format|
      format.html { redirect_to challenge_partners_path }
      format.json { head :no_content }
    end
  end

  private

  def set_challenge_partner
    @challenge_partner = ChallengePartner.friendly.find(params[:id])
  end

  def challenge_partner_params
    params.require(:challenge_partner).permit(:name, :description, :website)
  end
end
