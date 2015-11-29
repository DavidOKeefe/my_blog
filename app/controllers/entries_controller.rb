class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end

  def show
    find_entry
  end

  def new
    @entry = Entry.new
  end

  def edit
    find_entry
  end

  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      redirect_to @entry
    end
  end

  def update
    find_entry

    if @entry.update(entry_params)
      render :show
    end
  end

  def destroy
    find_entry

    @entry.destroy

    redirect_to entries_url
  end


  private
    def find_entry
      @entry = Entry.find(params[:id])
    end

    def entry_params
      params.require(:entry).permit(:title, :description)
    end

end
