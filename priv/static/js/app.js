$(function() {
  var $status= $("#status")
  if ($status.size() > 0) {
    var socket = new Phoenix.Socket("/ws");
    
    socket.join("channel", "status", {}, function(channel) {
      channel.on("update", function(status) {
        var status_str =  status.user_name + "が" + status.location + "に" + status.distance;
        $status.html(status_str);
        console.log(status_str);
      });
    
      channel.on("join", function(message) {
        console.log("Got " + message.content);
      });
    
      channel.on("error", function(error) {
        console.log("Failed to join topic. Reason: " + error.reason);
      });
    
    //  setInterval(function() {
    //    channel.send("ping", {data: "json stuff"});
    //  }, 1000);
    
    });
  }
});
