class BeesController < ApplicationController

  def index
    @bees = Bee.all
  end

  def new
  end

  def create
    @findings = BeeScraper.new
    results = @findings.html(search_params).collect do |found_html|
      Bee.find_or_create_by(link: found_html, user_id: current_user.id)
    end

    @findings.found_item(search_params).each_with_index do |found, i|
      results[i].result_item= found
      results[i].keyword = Keyword.create(keyword_terms: params[:bee][:terms])
      results[i].save
    end
    
    redirect_to myresults_path
  end


  def update
    @bee = Bee.find(params[:id])
    @bee.notes = params[:bee][:notes]
    @bee.save
    render :action => 'edit', :id => @bee.id
    # redirect_to myresults_path


  end

  def destroy
    # binding.pry
    @bee = Bee.find(params[:id])
    @bee.destroy
    redirect_to myresults_path
  end

  private

  def search_params
    params["bee"]["terms"].split(" ").join("+")
  end

end