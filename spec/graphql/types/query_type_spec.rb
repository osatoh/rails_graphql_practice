require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'query_type' do
    it 'loads query_type' do
      query_string = <<-GRAPHQL
      {
        currentDate
        todayWeather {
          temperature
          weather
        }
      }
      GRAPHQL
      result = RailsGraphqlSchema.execute(query_string, context: {}, variables: {} )
      puts result.inspect
      expect(result["data"]["currentDate"]).to eq Date.today.strftime("%Y年 %m月 %d日")
    end
  end
end