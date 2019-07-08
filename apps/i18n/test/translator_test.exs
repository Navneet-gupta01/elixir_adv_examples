# =================================
# Below lines required only if tested using `elixir test/while_test.exs`
# If Tested using mix test its not required
ExUnit.start()
Code.require_file("../lib/i18n/translator.ex", __DIR__)
# ======================================

defmodule TranslatorTest do
  use ExUnit.Case

  defmodule I18nTest do
    use I18n.Translator

    locale("en",
      foo: "bar",
      flash: [
        notice: [
          alert: "Alert!",
          hello: "hello %{first} %{last}!"
        ]
      ],
      users: [
        title: "Users",
        profile: [title: "Profiles"]
      ]
    )

    locale("fr",
      flash: [
        notice: [
          hello: "salut %{first} %{last}!"
        ]
      ]
    )
  end

  test "it recursively walks translations tree" do
    assert I18nTest.t("en", "users.title") == "Users"
    assert I18nTest.t("en", "users.profile.title") == "Profiles"
  end

  test "it handles translations at root level" do
    assert I18nTest.t("en", "foo") == "bar"
  end
end
