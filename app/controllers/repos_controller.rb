class ReposController < ApplicationController
  def index
    names = params[:repos].split(?,).uniq

    @repos = names.map { |name| Repo.find(current_user, name) }

  end


  def show
    @repo = Repo.find(current_user, "#{params[:user]}/#{params[:repo]}")
  end


end
