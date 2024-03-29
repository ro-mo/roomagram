// import { MathUtils } from "three";
import { getInputMode } from "./frames.js";
import { gamepadCamera, gamepadConnected } from "./gamepad.js";

export const init = () => {
    document.body.addEventListener( 'mousemove', mouseCamera);
}

const mouseCamera = ( event ) => {
    if ( getInputMode() || gamepadConnected() || document.pointerLockElement !== document.body ) return;

    var y = event.movementY / 500;
    var x = event.movementX / 500;
    moveCamera(x, y);
}

export const setGamepadCamera = () => {
    var {x,y} = gamepadCamera();
    moveCamera(x/100, y/100);
}

const moveCamera = (x, y) => {
    let camera = window.camera;

    if (y > 0 && camera.rotation.x < -1.45)
        y = 0;
    else if (y < 0 && camera.rotation.x > 1.45)
        y = 0;

    camera.rotation.y -= x;
    camera.rotation.x -= y;

    window.camera = camera;
}

// export function setup_device_motion(window, camera) {
//     if (window.DeviceOrientationEvent) {
//         console.log(true)
//         window.addEventListener('deviceorientation', function (eventData) {
    
//             var tiltX =  eventData.gamma * 2;
//             var tiltY =   eventData.beta * 2;
    
//             deviceOrientationHandler(tiltX,tiltY);
//             console.log(tiltX, tiltY)
//         }, false);
//     }
    
//     function deviceOrientationHandler(tiltX, tiltY){
//         camera.rotation.y = tiltY/200;
//         camera.rotation.x = tiltX/200;
//     }
// }
