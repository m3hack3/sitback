defmodule Sitback.Location do
  def location_by_beacon_version(major, minor) do
    locations = %{
      "1_0" => "自席",
      "1_1" => "トイレ"
    }
    locations["#{major}_#{minor}"]
  end
end 
