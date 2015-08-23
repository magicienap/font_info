defmodule FontInfo.OffsetTable do
  defstruct [
    :sfnt_version,
    :num_tables,
    :search_range,
    :entry_selector,
    :range_shift
  ]

  def new(bytes) do
    <<
      sfnt_version   :: size(32),
      num_tables     :: size(16),
      search_range   :: size(16),
      entry_selector :: size(16),
      range_shift    :: size(16)
    >> = bytes

    %FontInfo.OffsetTable{
      sfnt_version:   sfnt_version,
      num_tables:     num_tables,
      search_range:   search_range,
      entry_selector: entry_selector,
      range_shift:    range_shift
    }
  end
end
