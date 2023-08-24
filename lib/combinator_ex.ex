defmodule CombinatorEx do
  @moduledoc """
  Documentation for `CombinatorEx`.
  """

  @doc """
    cross( list1 :: list_of_strings, list2 :: list_of_strings ) :: list( binary )
    cross/2 will return a new list with each String in each list1
    prepended to each String in list2

  ## Examples

      iex> CombinatorEx.cross(["hello","goodbye"], ["world","friend"])
      ...> |> Enum.map(&Enum.join/1)
      [ "helloworld", "hellofriend", 
      "goodbyeworld", "goodbyefriend", ]

  """

  @type list_of_strings :: list(binary)

  @spec cross(list_of_strings, list_of_strings) :: list_of_strings()
  def cross(list1,list2) do
    Enum.map(list1,fn x ->
      Enum.map(list2, fn y ->
        [x,y]
      end)
    end)
    |> collapse
  end


  # Undo one level of nesting
  # defp collapse(iolist), do: Enum.map(iolist, fn x -> x |> Enum.map(&IO.chardata_to_string/1) end) |> List.flatten
  defp collapse(iolist), do: Enum.concat(iolist)
end
