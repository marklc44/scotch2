class ProducersController < ApplicationController

  before_action :render_layout_if_html

  respond_to :json, :html

  def similar
    similar_profiles = findSimilarFlavors(params[:id])
    similar_producers = getSimilarProducers(similar_profiles)
    respond_with similar_producers
  end

  def show
    respond_with Producer.find_by_id(params[:id]).to_json(:include => [:region, :whiskies, :flavor_profile])
  end

  private
  def render_layout_if_html
    if request.format.symbol == :html
      render "layouts/application"
    end
  end

  def findSimilarFlavors(id)
    compare_to = FlavorProfile.where({flavored_id: id, flavored_type: 'Producer'})
    all_profiles = FlavorProfile.all
    similar_profiles = []
    # change this to check for anything +-1 in top flavor components
    # if I can figure out how to use regression in this comparison
    # that would be ideal
    all_profiles.each_with_index do |profile, index|
      if profile[:smoky] == compare_to[0][:smoky]
        if profile[:sweetness] == compare_to[0][:sweetness]
          if profile[:flavored_id] == compare_to[0].flavored_id
            similar_profiles.unshift(profile.flavored_id)
          else
            similar_profiles.push(profile.flavored_id)
          end
        end
      end
    end
    return similar_profiles
  end

  def getSimilarProducers(similar_flavors)
    similar_producers = []
    exceptions = [:id, :created_at, :updated_at, :broad_keyword1, :broad_keyword2, :flavored_id, :flavored_type]
    similar_flavors.each do |id|
      profile = Producer.select(:id, :name).find(id).to_json(:include => {:flavor_profile => {:except => exceptions}})
      similar_producers.push(JSON.parse(profile))
    end
    return similar_producers
  end

end
