class EventSearchForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  
  attribute :keyword, :string
  attribute :page, :integer

  def search
    # searchkickでの検索メソッド
    Event.search(
      keyword_for_search,
      where: { start_at: { gt: start_at } },
      page: page,
      per_page: 10
    )
  end

  # start_atのアクセサは独自定義
  def start_at
    @start_at || Time.current
  end

  def start_at=(new_start_at)
    @start_at = new_start_at.in_time_zone
  end

  private

  # 未入力時は*で全検索
  def keyword_for_search
    keyword.presence || "*"
  end
end