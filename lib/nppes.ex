defmodule Nppes do
  @moduledoc """
  NPPES API is an Elixir wrapper to interface with the NPPES API

  ## Usage

  NPPES.search(%{first_name: "William"})

  NPPES.search(%{last_name: "Scott"})

  NPPES.search(%{number: "1111111111"})
  """

  defdelegate search(term), to: Nppes.Api
end
