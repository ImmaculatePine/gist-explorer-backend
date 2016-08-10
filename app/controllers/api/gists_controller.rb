module API
  class GistsController < BaseController
    before_action :authenticate!
    before_action :set_label
    before_action :set_gist

    # POST /api/labels/:label_id/gists
    def toggle
      if @gist
        perform_destroy
      else
        perform_create
      end
    end

    private

    def set_label
      @label = current_user.labels.find(params[:label_id])
    end

    def set_gist
      @gist = @label.gist_labels.find_by(gist_id: gist_params[:id])
    end

    def gist_params
      params[:gist] || {}
    end

    def perform_create
      @gist = @label.gist_labels.build(
        gist_id: gist_params[:id]
      )
      if @gist.save
        render json: @label, status: :created
      else
        render json: @gist.errors, status: :unprocessable_entity
      end
    end

    def perform_destroy
      @gist.destroy
      render json: @label, status: :ok
    end
  end
end
