require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  test "Match Created!" do
    @user1 = users(:one)
    @user2 = users(:two)
    puts @user1.inspect
    puts @user2.inspect
    @item1 = items(:one)
    @item2 = items(:two)
    # @item1.user_id = @user1.id
    # @item2.user_id = @user2.id
    puts @item1.inspect
    puts @item2.inspect
    @like1 = Like.create(item_offered: @item1, item_liked: @item2)
    @like2 = Like.create(item_offered: @item2, item_liked: @item1)
    puts @like1.inspect
    puts @like2.inspect
    @match = Match.where(item_offered: @item2, item_liked: @item1).first
    puts @match.inspect
    puts "get_all_item_matches"
    puts @item1.get_all_item_matches.inspect
    puts '----------'
    puts "get_all_user_items"
    puts @user1.get_all_user_items.inspect
    puts "-------"
    assert_equal(@user1.get_all_user_items.first.user_id, 1)
    assert_equal(@item2.id, @match.item_offered_id, 'match exists')
    assert_equal(@item1.id, @match.item_liked_id, 'match exists')
  end
end
