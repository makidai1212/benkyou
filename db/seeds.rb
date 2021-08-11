# メインのサンプルユーザーを1人作成する
User.create!(name:  "Example User",
  email: "example@railstutorial.org",
  password:              "foobar",
  password_confirmation: "foobar",
  admin: true)

  user = User.first
  user.projects.create!(
    goal: "web",
    step_1: "a",
    step_2: "a",
    step_3: "a",
    step_4: "a",
    step_5: "a",
    step_6: "a"
  )