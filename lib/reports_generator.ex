defmodule ReportsGenerator do
  alias ReportsGenerator.Parser

  @months [
    "janeiro",
    "fevereiro",
    "março",
    "abril",
    "maio",
    "junho",
    "julho",
    "agosto",
    "setembro",
    "outubro",
    "novembro",
    "dezembro"
  ]

  def generate(file_name \\ "resources/gen_report.csv") do
    file_name
    |> Parser.parse_file()
    |> Enum.reduce(initial_report(), fn line, report -> sum_values(line, report) end)
  end

  defp sum_values(
         [person, hours, _day, month, year],
         %{
           "all_hours" => all_hours,
           "hours_per_month" => per_month,
           "hours_per_year" => per_year
         }
       ) do
    hours = String.to_integer(hours)
    month = String.to_integer(month)

    all_hours = sum_all_hours(all_hours, person, hours)
    per_month = sum_hours_per_month(per_month, person, month, hours)
    per_year = sum_hours_per_year(per_year, person, year, hours)

    build_report(all_hours, per_month, per_year)
  end

  defp sum_all_hours(all_hours, person_name, hours) do
    person_hours = Map.get(all_hours, person_name) || 0
    Map.put(all_hours, person_name, person_hours + hours)
  end

  defp sum_hours_per_month(hours_per_month, person_name, month, hours) do
    person_hours_per_month = Map.get(hours_per_month, person_name) || initial_per_month_report()

    month_name = Enum.at(@months, month - 1)

    person_hours_per_month =
      Map.put(person_hours_per_month, month_name, person_hours_per_month[month_name] + hours)

    Map.put(hours_per_month, person_name, person_hours_per_month)
  end

  defp sum_hours_per_year(hours_per_year, person_name, year, hours) do
    person_hours_per_year = Map.get(hours_per_year, person_name) || initial_per_year_report()

    person_hours_per_year =
      Map.put(person_hours_per_year, year, person_hours_per_year[year] + hours)

    Map.put(hours_per_year, person_name, person_hours_per_year)
  end

  defp build_report(all_hours, hours_per_month, hours_per_year) do
    %{
      "all_hours" => all_hours,
      "hours_per_month" => hours_per_month,
      "hours_per_year" => hours_per_year
    }
  end

  defp initial_report do
    %{"all_hours" => %{}, "hours_per_month" => %{}, "hours_per_year" => %{}}
  end

  defp initial_per_month_report do
    %{
      "janeiro" => 0,
      "fevereiro" => 0,
      "março" => 0,
      "abril" => 0,
      "maio" => 0,
      "junho" => 0,
      "julho" => 0,
      "agosto" => 0,
      "setembro" => 0,
      "outubro" => 0,
      "novembro" => 0,
      "dezembro" => 0
    }
  end

  defp initial_per_year_report do
    %{
      "2016" => 0,
      "2017" => 0,
      "2018" => 0,
      "2019" => 0,
      "2020" => 0
    }
  end
end
