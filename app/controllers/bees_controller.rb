class BeesController < ApplicationController

  def index
    @bees = Bee.all
  end

  def new
  end

  def create
    @findings = BeeScraper.new
    array = @findings.html(bee_params).collect do |found_html|
      Bee.find_or_create_by(link: found_html, user_id: current_user.id)
    end

    @findings.found_item(bee_params).each_with_index do |found, i|
      array[i].result_item= found
      array[i].save
    end
    
    redirect_to myresults_path
  end

  def update
  end

  def destroy
  end

  private

  def bee_params
    params["bee"]["terms"].split(" ").join("+")
  end

end