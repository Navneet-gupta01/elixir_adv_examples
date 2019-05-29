defmodule I18n do
  use I18n.Translator

  @moduledoc """
  Documentation for I18n.
  """

  locale("en",
    flash: [hello: "Hello %{first} %{last}!", bye: "Bye, %{name}!"],
    users: [
      title: "Users"
    ]
  )

  locale("fr",
    flash: [hello: "Salut %{first} %{last}!", bye: "Au revoir, %{name}!"],
    users: [
      title: "Utilisateurs"
    ]
  )
end

# iex -S mix
# iex(1)> I18n.t("en", "flash.hello", first: "Chris", last: "McCord")
# "Hello Chris Mccord!"
# iex(2)> I18n.t("fr", "flash.hello", first: "Chris", last: "McCord")
# "Salut Chris McCord!"
# iex(3)> I18n.t("en", "users.title")
# "Users"
