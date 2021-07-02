defmodule Nppes do
  @moduledoc """
  NPPES API is an Elixir wrapper to interface with the NPPES API

  ## Usage

  NPPES.search("npi")

  NPPES.search("William")

  NPPES.search("Scott")


  """

  defdelegate search(term), to: Nppes.Api
end
