setupWebsocket = function() {
	var ws;
    if ("WebSocket" in window) {
        ws = new WebSocket("ws://localhost:80/websocket");
    } else {
        ws = new MozWebSocket("ws://localhost:80/websocket");
    }

    ws.onmessage = function( event ) {
        var data = JSON.parse(event.data);
        var addr = data.addr;
        var value = data.value;
        
        console.log(value[0], value[1], value[2]);
        
		mset1_rot_speed = value[0];
		mset2_rot_speed = value[1];
		mset3_rot_speed = value[2];
    }

    ws.onopen = function( event ) {
    }
}

setupWebsocket();
