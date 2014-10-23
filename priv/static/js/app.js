$(function() {
  var $status= $("#status")
  if ($status.size() > 0) {
    var scene = new THREE.Scene();

    var width  = 720;
    var height = 480;
    var fov    = 60;
    var aspect = width / height;
    var near   = 1;
    var far    = 1000;
    var camera = new THREE.PerspectiveCamera(fov, aspect, near, far);
    camera.position.set(0, 40, 50);
    camera.rotation.set(-Math.PI/6, 0, 0);

    var renderer = new THREE.WebGLRenderer();
    renderer.setSize(width, height);
    document.getElementsByClassName("webgl")[0].appendChild(renderer.domElement);

    var poo_pos = {
        x: -80, y: 50, z: -70
    }

    // load model
    var toilet;
    var loader = new THREE.OBJLoader();
    loader.load('/models/toilet.obj', function(res) {
        toilet = res;
        toilet.position.set(-80, -20, -70);
        toilet.rotation.set(0, -Math.PI * 2/3, 0);
        scene.add(toilet);
    });
    var poo;
    loader.load('/models/poo.obj', function(res) {
        poo = res;
        poo.position.set(poo_pos['x'], poo_pos['y'], poo_pos['z']);
        poo.rotation.set(-Math.PI/2, 0, 0);
        scene.add(poo);
    });
    var figure;
    loader.load('/models/figure.obj', function(res) {
        figure = res;
        figure.position.set(0, -20, -60);
        figure.scale.set(7, 7, 7);
        //figure.rotation.set(0, -Math.PI/2, 0);
        scene.add(figure);
    });
    var desk;
    loader.load('/models/desk.obj', function(res) {
        desk = res;
        desk.position.set(70, -20, -70);
        desk.scale.set(0.1, 0.1, 0.1);
        desk.rotation.set(0, -Math.PI/3, 0);
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
        if (poo) {
            poo.position.set(poo_pos['x'], poo_pos['y'], poo_pos['z']);
        }
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
            if (status.distance == "Immediate") {
                var time = new Date();
                var moveTimerId = setInterval(function() {
                    poo_pos['y'] -= 5;
                    if (new Date() - time > 1000) {
                        poo_pos['y'] = 0;
                        clearInterval(moveTimerId);
                    }
                }, 100);
            }
        } else {
            distance = distance_to_point[status.distance];
        }
        figure.position.set(distance, -20, -60);
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
