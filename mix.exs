defmodule FontInfo.Mixfile do
  use Mix.Project

  def project do
    [app: :font_info,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     package: package,
     name: "FontInfo",
     source_url: "https://github.com/magicienap/font_info",
     description: """
     Parse the information contained in an SFNT font file (PostScript, TrueType, OpenType, Web Open Font Format)
     """]
  end

  # Configuration for the OTP application
  def application do
    [applications: [:logger]]
  end

  defp deps do
    []
  end

  defp package do
    [contributors: ["Antoine Proulx"],
     licenses: ["MIT"],
     links: %{"GitHub": "https://github.com/magicienap/font_info"}]
  end
end
