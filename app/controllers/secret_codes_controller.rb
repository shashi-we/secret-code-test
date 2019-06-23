require 'securerandom'

class SecretCodesController < ApplicationController
  load_and_authorize_resource
  before_action :set_secret_code, only: [:destroy]

  def index
    @secret_codes = SecretCode.all
  end

  def destroy
    @secret_code.destroy
    respond_to do |format|
      format.html { redirect_to secret_codes_url, notice: 'Secret code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def generate
    params[:quantity].to_i.times do
      SecretCode.create(code: SecureRandom.hex(10))
    end
    redirect_to secret_codes_url, notice: 'Secret codes has been generated successfully.'
  end

  private

  def set_secret_code
    @secret_code = SecretCode.find(params[:id])
  end

end
