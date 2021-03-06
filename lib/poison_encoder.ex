# This is required so that we can correctly serialize our models into JSON
# https://coderwall.com/p/fhsehq/fix-encoding-issue-with-ecto-and-poison
defimpl Poison.Encoder, for: Any do
  def encode(%{__struct__: _} = struct, options) do
    map = struct
          |> Map.from_struct
          |> sanitize_map
          |> Poison.Encoder.Map.encode(options)
  end

  defp sanitize_map(map) do
    Map.drop(map, [:__meta__, :__struct__])
  end
end
