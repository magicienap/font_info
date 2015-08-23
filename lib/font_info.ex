defmodule FontInfo do
  defstruct [
    :file,
    :offset_table,
    :table_record
  ]

  def new(font_file_name) do
    font_file = File.open!(font_file_name)

    offset_table = font_file |> IO.binread(12) |> FontInfo.OffsetTable.new

    table_record = for _ <- 0..offset_table.num_tables-1 do
      font_file |> IO.binread(16) |> FontInfo.TableRecordEntry.new
    end

    %FontInfo{
      file: font_file,
      offset_table: offset_table,
      table_record: table_record
    }
  end

  def head(font_info) do
    table = font_info.table_record |> Enum.find fn entry ->
      entry.tag == "head"
    end

    :file.position(font_info.file, table.offset)
    bytes = IO.binread(font_info.file, table.length)
    FontInfo.FontHeader.new(bytes)
  end
end
