module API
  class LabelsController < BaseController
    before_action :authenticate!
    before_action :set_label, only: :destroy

    # GET /labels
    def index
      @labels = current_user.labels
      render json: @labels
    end

    # POST /labels
    def create
      @label = current_user.labels.build(label_params)
      if @label.save
        render json: @label, status: :created
      else
        render json: @label.errors.messages, status: :unprocessable_entity
      end
    end

    # DELETE /labels/:id
    def destroy
      @label.destroy
      render json: @label, status: :ok
    end

    private

    def set_label
      @label = current_user.labels.find(params[:id])
    end

    def label_params
      params.require(:label).permit(:name)
    end
  end
end
