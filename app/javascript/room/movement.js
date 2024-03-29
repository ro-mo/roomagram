import { getFramePlacing, getInputMode, getVisualizeMode, placeFrame, removeFrame, toggleFramePlacing, toggleVisualizeFrame } from './frames.js';
import { gamepadConnected, gamepadMovement } from './gamepad.js';
import { getInteractingFrame } from './raycast.js';
import { getForwardVector, getSideVector } from './vectors.js';

let keyStates = {};

export function listenersInit() {

    document.addEventListener( 'keydown', ( event ) => { 

        if (event.code == "KeyE" && (getVisualizeMode() || getInteractingFrame() != null))
            toggleVisualizeFrame();
        
        else if (event.code == "KeyT")
            if (getFramePlacing())
                toggleFramePlacing()
            else
                placeFrame();
        
        else if (event.code == "KeyY" && getInteractingFrame() != null)
            removeFrame();
    
        else if (!getInputMode())
            keyStates[ event.code ] = true;

    });

    document.addEventListener( 'keyup', ( event ) => {

        keyStates[ event.code ] = false;

    } );

    document.getElementsByTagName('canvas')[0].addEventListener( 'mousedown', () => {

        if (getInputMode()) return;

        if (getVisualizeMode()) 
            toggleVisualizeFrame()

        document.body.requestPointerLock();

    } );

    window.addEventListener( 'resize', onWindowResize );

    function onWindowResize() {
        const camera = window.camera;
        camera.aspect = window.innerWidth / window.innerHeight;
        camera.updateProjectionMatrix();

        const renderer = window.renderer;
        renderer.setSize( window.innerWidth, window.innerHeight );
    }
}

export function controls( deltaTime, playerVelocity, camera, playerDirection ) {

    const speedDelta = deltaTime * 250;

    playerVelocity.set(0, 0, 0)

    if (!gamepadConnected()) {

        if ( keyStates[ 'KeyW' ] ) playerVelocity.add( getForwardVector(camera, playerDirection).multiplyScalar( speedDelta ) );

        if ( keyStates[ 'KeyS' ] ) playerVelocity.add( getForwardVector(camera, playerDirection).multiplyScalar( - speedDelta ) );

        if ( keyStates[ 'KeyA' ] ) playerVelocity.add( getSideVector(camera, playerDirection).multiplyScalar( - speedDelta ) );

        if ( keyStates[ 'KeyD' ] ) playerVelocity.add( getSideVector(camera, playerDirection).multiplyScalar( speedDelta ) );

        return playerVelocity;
    }

    const gamepad = gamepadMovement();

    playerVelocity.add( getForwardVector(camera, playerDirection).multiplyScalar( speedDelta * gamepad.y ) );

    playerVelocity.add( getSideVector(camera, playerDirection).multiplyScalar( speedDelta * gamepad.x ) );

    return playerVelocity;
}