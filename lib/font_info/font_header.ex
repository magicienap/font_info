defmodule FontInfo.FontHeader do
  alias FontInfo.Helpers

  defstruct [
    :version,
    :font_revision,
    :check_sum_adjustment,
    :magic_number,
    :flags,
    :units_per_em,
    :created,
    :modified,
    :x_min,
    :y_min,
    :x_max,
    :y_max,
    :mac_style,
    :lowest_rec_ppem,
    :font_direction_hint,
    :index_to_loc_format,
    :glyph_data_format
  ]

  def new(bytes) do
    <<
      version_major        :: size(16),
      version_minor        :: size(16),
      font_revision_major  :: size(16),
      font_revision_minor  :: size(16),
      check_sum_adjustment :: size(32),
      magic_number         :: size(32),

      flag15 :: size(1),
      flag14 :: size(1),
      flag13 :: size(1),
      flag12 :: size(1),
      flag11 :: size(1),
      flag10 :: size(1),
      flag9  :: size(1),
      flag8  :: size(1),
      flag7  :: size(1),
      flag6  :: size(1),
      flag5  :: size(1),
      flag4  :: size(1),
      flag3  :: size(1),
      flag2  :: size(1),
      flag1  :: size(1),
      flag0  :: size(1),

      units_per_em :: size(16),
      created      :: signed-size(64),
      modified     :: signed-size(64),
      x_min        :: signed-size(16),
      y_min        :: signed-size(16),
      x_max        :: signed-size(16),
      y_max        :: signed-size(16),

      _mac_style15 :: size(1),
      _mac_style14 :: size(1),
      _mac_style13 :: size(1),
      _mac_style12 :: size(1),
      _mac_style11 :: size(1),
      _mac_style10 :: size(1),
      _mac_style9  :: size(1),
      _mac_style8  :: size(1),
      _mac_style7  :: size(1),
      mac_style6   :: size(1),
      mac_style5   :: size(1),
      mac_style4   :: size(1),
      mac_style3   :: size(1),
      mac_style2   :: size(1),
      mac_style1   :: size(1),
      mac_style0   :: size(1),

      lowest_rec_ppem     :: size(16),
      font_direction_hint :: signed-size(16),
      index_to_loc_format :: signed-size(16),
      glyph_data_format   :: signed-size(16)
    >> = bytes

    %FontInfo.FontHeader{
      version:              Helpers.fixed_to_string(version_major, version_minor),
      font_revision:        Helpers.fixed_to_string(font_revision_major, font_revision_minor),
      check_sum_adjustment: check_sum_adjustment,
      magic_number:         magic_number,

      flags: [
        flag0, flag1, flag2, flag3, flag4, flag5, flag6, flag7,
        flag8, flag9, flag10, flag11, flag12, flag13, flag14, flag15
      ],

      units_per_em: units_per_em,
      created:      created,  # TODO: Convert this to a DateTime
      modified:     modified, # TODO: Convert this to a DateTime
      x_min:        x_min,
      y_min:        y_min,
      x_max:        x_max,
      y_max:        y_max,

      mac_style: %{
        bold:      Helpers.bit_to_boolean(mac_style0),
        italic:    Helpers.bit_to_boolean(mac_style1),
        underline: Helpers.bit_to_boolean(mac_style2),
        outline:   Helpers.bit_to_boolean(mac_style3),
        shadow:    Helpers.bit_to_boolean(mac_style4),
        condensed: Helpers.bit_to_boolean(mac_style5),
        extended:  Helpers.bit_to_boolean(mac_style6)
      },

      lowest_rec_ppem:     lowest_rec_ppem,
      font_direction_hint: font_direction_hint,
      index_to_loc_format: index_to_loc_format,
      glyph_data_format:   glyph_data_format
    }
  end
end
