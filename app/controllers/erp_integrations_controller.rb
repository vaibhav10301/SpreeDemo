class ErpIntegrationsController < ApplicationController
  before_action :set_erp_integration, only: [:show, :edit, :update, :destroy]
  # GET /erp_integrations
  # GET /erp_integrations.json
  def index
    @erp_integrations = ErpIntegration.all
  end

  # GET /erp_integrations/1
  # GET /erp_integrations/1.json
  def show
  end

  # GET /erp_integrations/new
  def new
    @erp_integration = ErpIntegration.new
  end

  # GET /erp_integrations/1/edit
  def edit
  end

  # POST /erp_integrations
  # POST /erp_integrations.json
  def create
    @erp_integration = ErpIntegration.new(erp_integration_params)

    respond_to do |format|
      if @erp_integration.save
        format.html { redirect_to @erp_integration, notice: 'Erp integration was successfully created.' }
        format.json { render :show, status: :created, location: @erp_integration }
      else
        format.html { render :new }
        format.json { render json: @erp_integration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /erp_integrations/1
  # PATCH/PUT /erp_integrations/1.json
  def update
    respond_to do |format|
      if @erp_integration.update(erp_integration_params)
        format.html { redirect_to @erp_integration, notice: 'Erp integration was successfully updated.' }
        format.json { render :show, status: :ok, location: @erp_integration }
      else
        format.html { render :edit }
        format.json { render json: @erp_integration.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_integration_source
    respond_to do |format|
      update_false_other_source(params[:id])
      @erp_integration = ErpIntegration.find(params[:id])
      @erp_integration.selected = true if params[:selected]
      @erp_integration.save
      format.json { render :show, status: :ok, location: @erp_integration }
    end
  end

  def update_false_other_source(id)
    erp_integrations = ErpIntegration.where.not(:id => params[:id])
    erp_integrations.each do |erp_integration|
      erp_integration.selected = false;
      erp_integration.save
    end
  end

  # DELETE /erp_integrations/1
  # DELETE /erp_integrations/1.json
  def destroy
    @erp_integration.destroy
    respond_to do |format|
      format.html { redirect_to erp_integrations_url, notice: 'Erp integration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_erp_integration
      @erp_integration = ErpIntegration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def erp_integration_params
      params.require(:erp_integration).permit(:name, :url, :selected, :token)
    end
end
