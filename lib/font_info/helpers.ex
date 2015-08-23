defmodule FontInfo.Helpers do
  def fixed_to_string(integer, fraction) do
    Integer.to_string(integer) <> "." <> Integer.to_string(fraction)
  end

  def bit_to_boolean(0), do: false
  def bit_to_boolean(1), do: true
end
