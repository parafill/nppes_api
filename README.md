# Nppes

This is a Elixir wrapper for interacting with the CMS National Plan and Provider Enumeration System (NPPES) NPI lookup.

For more information visit the [NPI registry](https://npiregistry.cms.hhs.gov/)

## Usage

```elixir
Nppes.search(%{first_name: "William"})

Nppes.search(%{last_name: "Scott"})

Nppes.search(%{number: "1111111111"})
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `nppes_api` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:nppes_api, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/nppes_api](https://hexdocs.pm/nppes_api).
