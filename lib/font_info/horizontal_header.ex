defmodule FontInfo.HorizontalHeader do
  alias FontInfo.Helpers

  defstruct [
    :version,
    :ascender,
    :descender,
    :line_gap,
    :advance_width_max,
    :min_left_side_bearing,
    :min_right_side_bearing,
    :x_max_extent,
    :caret_slope_rise,
    :caret_slope_run,
    :caret_offset,
    :metric_data_format,
    :number_of_h_metrics
  ]

  def new(bytes) do
    <<
      version_major          :: size(16),
      version_minor          :: size(16),
      ascender               :: signed-size(16),
      descender              :: signed-size(16),
      line_gap               :: signed-size(16),
      advance_width_max      :: size(16),
      min_left_side_bearing  :: signed-size(16),
      min_right_side_bearing :: signed-size(16),
      x_max_extent           :: signed-size(16),
      caret_slope_rise       :: signed-size(16),
      caret_slope_run        :: signed-size(16),
      caret_offset           :: signed-size(16),
      _reserved              :: signed-size(64),
      metric_data_format     :: signed-size(16),
      number_of_h_metrics    :: size(16)
    >> = bytes

    %FontInfo.HorizontalHeader{
      version:                Helpers.fixed_to_string(version_major, version_minor),
      ascender:               ascender,
      descender:              descender,
      line_gap:               line_gap,
      advance_width_max:      advance_width_max,
      min_left_side_bearing:  min_left_side_bearing,
      min_right_side_bearing: min_right_side_bearing,
      x_max_extent:           x_max_extent,
      caret_slope_rise:       caret_slope_rise,
      caret_slope_run:        caret_slope_run,
      caret_offset:           caret_offset,
      metric_data_format:     metric_data_format,
      number_of_h_metrics:    number_of_h_metrics
    }
  end
end
