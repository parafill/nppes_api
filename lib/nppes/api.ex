defmodule Nppes.Api do
  @moduledoc """
  Simple API wrapper for NPPES Api
  """

  alias Nppes.Parser

  @default_version "2.1"

  @base_url "https://npiregistry.cms.hhs.gov/api/?"

  @expected_fields ~w(
    version number enumeration_type taxonomy_description first_name use_first_name_alias last_name organization_name address_purpose city state postal_code country_code limit skip pretty
  )a

  def search(terms) do
    terms
    |> build_params()
    |> build_url()
    |> HTTPoison.get()
    |> Parser.parse()
  end

  defp build_url(query_string) do
    @base_url <> query_string
  end

  defp build_params(query_params) do
    query_params
    |> Map.take(@expected_fields)
    |> Map.put_new(:version, @default_version)
    |> URI.encode_query()
  end
end
