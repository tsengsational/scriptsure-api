class Api::V1::VersionsController < ApplicationController

  def create
    version = Version.create(version_params)
    render json: version
  end

  def show
    version = Version.find(params[:id])
    script = version.script
    render json: { payload: {
      version: version,
      script: script
      }}
  end

  def destroy
    version = Version.find(params[:id])
    script_id = version.script_id
    version.destroy
    render json: {message: "Version successively destroyed", script_id: script_id}
  end

  private

  def version_params
    params.require(:version).permit(:script_id, :contentState)
  end
end
