$(function() {
  var $status= $("#status")
  if ($status.size() > 0) {
    var scene = new THREE.Scene();

    var width  = 600;
    var height = 400;
    var fov    = 60;
    var aspect = width / height;
    var near   = 1;
    var far    = 1000;
    var camera = new THREE.PerspectiveCamera(fov, aspect, near, far);
    camera.position.set(0, 40, 50);
    camera.rotation.set(-Math.PI/6, 0, 0);

    var renderer = new THREE.WebGLRenderer();
    renderer.setSize(width, height);
    document.body.appendChild(renderer.domElement);

    // load model
    var toilet;
    var loader = new THREE.OBJLoader();
    loader.load('/models/toilet.obj', function(res) {
        toilet = res;
        toilet.position.set(-70, -20, -70);
        toilet.rotation.set(0, -Math.PI/2, 0);
        scene.add(toilet);
    });
    var figure;
    loader.load('/models/figure.obj', function(res) {
        figure = res;
        figure.position.set(0, -20, -70);
        figure.scale.set(5, 5, 5);
        //figure.rotation.set(0, -Math.PI/2, 0);
        scene.add(figure);
    });
    var desk;
    loader.load('/models/desk_chair.obj', function(res) {
        desk = res;
        desk.position.set(90, -20, -70);
        desk.scale.set(10, 10, 10);
        //figure.rotation.set(0, -Math.PI/2, 0);
        scene.add(desk);
    });

    var directionalLight = new THREE.DirectionalLight(0xffffff);
    directionalLight.position.set(0, 0.7, 0.7);
    scene.add(directionalLight);

    // var geometry = new THREE.BoxGeometry(30, 30, 30);
    // var material = new THREE.MeshPhongMaterial({ color: 0xff0000 });
    // var mesh = new THREE.Mesh(geometry, material);
    // scene.add(mesh);

    renderer.render(scene, camera);

    (function renderLoop() {
        requestAnimationFrame(renderLoop);
        renderer.render(scene, camera);
    })();

    var socket = new Phoenix.Socket("/ws");
    var distance_to_point = {
        "Immediate": 69,
        "Near": 60,
        "Far": 10,
        "Out": 0
    }
    
    socket.join("channel", "status", {}, function(channel) {
      channel.on("update", function(status) {
        var status_str =  status.user_name + "が" + status.location + "に" + status.distance;
        $status.html(status_str);
        console.log(status_str);
        var distance;
        if (status.location == "toilet") {
            distance = - distance_to_point[status.distance];
        } else {
            distance = distance_to_point[status.distance];
        }
        figure.position.set(distance, -20, -70);
      });
    
      channel.on("join", function(message) {
        console.log("Got " + message.content);
      });
    
      channel.on("error", function(error) {
        console.log("Failed to join topic. Reason: " + error.reason);
      });
    
    });
  }
});
