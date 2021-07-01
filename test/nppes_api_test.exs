defmodule NppesApiTest do
  use ExUnit.Case
  doctest NppesApi

  test "greets the world" do
    assert NppesApi.hello() == :world
  end
end
