defmodule Todoer.Guardian do
  use Guardian, otp_app: :todoer

  def subject_for_token(user, _claims) do
    sub = to_string(user.id)
    {:ok, sub}
  end

  def subject_for_token(_, _claims) do
    {:error, :reason}
  end

  def resource_from_claims(claims) do
    user =
      claims["sub"]
      |> Todoer.Accounts.get_user!()

    {:ok, user}
  end

  def resource_from_claims(_claims) do
    {:error, :reason}
  end
end
