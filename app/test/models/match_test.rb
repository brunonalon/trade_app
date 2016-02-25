require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  test "Match Created!" do
    @item1 = items(:one)
    @item2 = items(:two)
    puts @item1.inspect
    puts @item2.inspect
    @like1 = Like.create(item_offered: @item1, item_liked: @item2)
    @like2 = Like.create(item_offered: @item2, item_liked: @item1)
    puts @like1.inspect
    puts @like2.inspect
    @match = Match.where(item_offered: @item2, item_liked: @item1).first
    puts @match.inspect
    assert_equal(@item2.id, @match.item_offered_id, 'match exists')
    assert_equal(@item1.id, @match.item_liked_id, 'match exists')
  end
end
