class Api::V1::ScriptsController < ApplicationController
  def index
    scripts = Script.all
    if params[:user_id]
      select_scripts = User.find(params[:user_id]).scripts
      render json: select_scripts
    else
      render json: scripts
    end
  end

  def create
    script = Script.create(script_params)
    user = current_user
    user.scripts << script
    user.save
    script.save
    render json: script
  end

  def update
    script = Script.find(params[:id])
    script.update(user_params)
    render json: script
  end

  def show
    script = Script.find(params[:id])
    created_at = script.created_at.strftime("Saved on %m/%d/%Y, %I:%M%p")
    versions = script.versions.map do |version|
      {
        script_id: version.script_id,
        contentState: version.contentState,
        created_at: version.created_at.strftime("Saved on %m/%d/%Y, %I:%M%p")
      }
    end
    if script.versions.length > 0
      latest = {
        script_id: script.versions.last.script_id,
        contentState: script.versions.last.contentState,
        created_at: script.versions.last.created_at.strftime("Saved on %m/%d/%Y, %I:%M%p")
      }
    end
    render json: {script: {
                            id: script.id,
                            title: script.title,
                            subtitle: script.subtitle,
                            created_at: created_at
                          },
                  versions: versions,
                  comments: script.comments,
                  latest: latest
                }
  end

  def destroy
    script = Script.find(params[:id])
    script.destroy
    render json: {message: "Script successively destroyed"}
  end

  private

  def script_params
    params.require(:script).permit(:title, :subtitle)
  end


end
