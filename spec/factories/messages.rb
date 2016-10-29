FactoryGirl.define do
  factory :message do
    body          "メッセージ送信！"
    image         "test.jpeg"
    group_id      "1"
    user_id       "1"
  end
end