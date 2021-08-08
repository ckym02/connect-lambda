class HomeController < ApplicationController
  def show
    # TODO: 例外処理
    # curl -X POST -H "Content-Type: application/json" -d '{"hoge":"hogehoge"}' localhost:3000/show
    # curl -v -G -d hoge='hogehoge' -d piyo='piyopiyo' localhost:3000/show
    if params[:hoge]
      result = TestResult.new(
        message: params[:hoge]
      )
      result.save!
    end

    # TODO: undefined method `message' for nil:NilClass
    @data = TestResult.last.message
  end
end
