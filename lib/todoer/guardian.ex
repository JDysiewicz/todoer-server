defmodule Todoer.Guardian do
  use Guardian, otp_app: :todoer

  def subject_for_token(%Todoer.Accounts.User{} = user, _claims) do
    {:ok, to_string(user.id)}
  end

  def subject_for_token(_, _claims) do
    {:error, :reason}
  end

  def resource_from_claims(%{"sub" => id}) do
    case Todoer.Accounts.get_user!(id) do
      nil -> {:error, :resource_not_found}
      user -> {:ok, user}
    end
  end

  def resource_from_claims(_claims) do
    {:error, :reason}
  end
end
