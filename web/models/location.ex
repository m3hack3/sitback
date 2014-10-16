defmodule Sitback.Location do
  def location_by_beacon_version(major, minor) do
    locations = %{
      "1_0" => "自席",
      "1_1" => "トイレ"
    }
    IO.puts major
    IO.puts minor
    IO.puts "#{major}_#{minor}"
    locations["#{major}_#{minor}"]
  end
end 
