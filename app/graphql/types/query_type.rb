module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :current_date, String, null: false, description: '今日の日付'
    def current_date
      Date.today.strftime("%Y年 %m月 %d日")
    end

    field :today_weather, WeatherType, null: false, description: '今日の天気'
    def today_weather
      { weather: '晴れ', temperature: 60 }
    end
  end
end
