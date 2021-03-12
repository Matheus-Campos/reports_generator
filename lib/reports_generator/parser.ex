defmodule ReportsGenerator.Parser do
  def parse_file(file) do
    file
    |> File.stream!()
    |> Stream.map(fn line -> parse_line(line) end)
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
  end
end
