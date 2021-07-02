defmodule Nppes.Parser do
  @moduledoc """
  Generic parser to parse all the NPPES api responses
  """

  @type status_code :: integer
  @type headers :: map
  @type response ::
          {:ok, [struct], headers}
          | {:ok, struct, headers}
          | :ok
          | {:error, map, status_code}
          | {:error, map}
          | any

  @doc """
  Parses the response from nppes API calls
  """
  @spec parse(tuple) :: response
  def parse({:ok, %HTTPoison.Response{body: body, headers: headers, status_code: status}})
      when status in [200, 201] do
    {:ok, parse_response_body(body), parse_headers(headers)}
  end

  def parse({:ok, %HTTPoison.Response{body: _body, status_code: 204}}), do: :ok
  def parse({:error, %HTTPoison.Error{id: _, reason: reason}}), do: {:error, %{reason: reason}}

  def parse({:ok, %HTTPoison.Response{body: body, status_code: 403}}),
    do: {:error, parse_response_body(body), 403}

  def parse({:ok, %HTTPoison.Response{body: body, headers: _, status_code: status}}),
    do: {:error, parse_response_body(body), status}

  def parse(response), do: response

  defp parse_response_body(body), do: Jason.decode!(body, keys: :atoms)
  defp parse_headers(headers), do: Map.new(headers)
end
