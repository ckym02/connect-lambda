class HomeController < ApplicationController
  def show
    # TODO: 例外処理
    # curl -X POST -H "Content-Type: application/json" -d '{"hoge":"hogehoge"}' localhost:3000/show
    # curl -v -G -d hoge='hogehoge' -d piyo='piyopiyo' localhost:3000/show
    if params[:start_time] && params[:end_time]
      result = TestResult.new(
        start_time: params[:start_time],
        end_time: params[:end_time]
      )
      result.save!
    end

    # TODO: undefined method `message' for nil:NilClass
    @data = TestResult.last.message
  end
end
