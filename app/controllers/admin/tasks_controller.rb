class Admin::TasksController < ApplicationController

  before_action :authenticate_admin!

  def index
    @tasks = Task.all
  end

  def show
  end

  def destroy
  end
end
