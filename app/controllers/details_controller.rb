class DetailsController < ApplicationController
  def index
    @detailable = find_detailable
    @details = @detailable.details
  end

  private

  def find_detailable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
  end
end
