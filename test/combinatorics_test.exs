defmodule CombinatoricsTest do
  use ExUnit.Case
  import Combinatorics

  @alpha for n <- ?a..?z, do: << n :: utf8 >>
  @numer for n <- ?0..?9, do: << n :: utf8 >>

  @tag :greet
  test "greets the world" do
    assert cross(["hello"], ["world"])
      |> Enum.map(&Enum.join/1)
      == ["helloworld"]
  end

  @tag :one_by_two
  test "one times two" do
    assert cross(["a"], ["1", "2"])
      |> Enum.map(&Enum.join/1)
      == ["a1", "a2"]
  end

  @tag :two_by_one
  test "two times one" do
    assert cross(["x", "y"], ["9"])
      |> Enum.map(&Enum.join/1)
      == ["x9", "y9"]
  end

  @tag :two_by_two
  test "two times two" do
    assert cross(["+","-"],["1","5"])
      |> Enum.map(&Enum.join/1)
      == ["+1","+5","-1","-5"]
  end

  @tag :two_sixty
  test "really big combo" do
    result = cross(@alpha,@numer)
      |> Enum.map(&Enum.join/1)
    assert Enum.count(result) == 260
  end
end
