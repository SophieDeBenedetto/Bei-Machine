class BeesController < ApplicationController

  def index
    @bees = Bee.all
  end

  def new
    # @bee = Bee.new
  end

  def create
    # binding.pry
    @findings = BeeScraper.new
    array = @findings.html(bee_params).collect do |found_html|
      Bee.find_or_create_by(link: found_html)
    end
    # binding.pry

    @findings.found_item(bee_params).each_with_index do |found, i|
      #binding.pry
      array[i].result_item= found
      array[i].save

      # Bee.all.each do |bee|
      #   bee.result_item = found
      #   bee.save
    end
    
    # binding.pry
    redirect_to action: "index"
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