defmodule FontInfo.TableRecordEntry do
  defstruct [
    :tag,
    :check_sum,
    :offset,
    :length
  ]

  def new(bytes) do
    <<
      tag       :: binary-size(4),
      check_sum :: size(32),
      offset    :: size(32),
      length    :: size(32)
    >> = bytes

    %FontInfo.TableRecordEntry{
      tag:       tag,
      check_sum: check_sum,
      offset:    offset,
      length:    length
    }
  end
end
