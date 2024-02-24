/*
* HIGHP = can have performances hit and might not work on some devices
* LOWP = can create bugs by the lack of precision
* MEDIUMP = We uually us it
*/
// precision mediump float;

// Récupérer uColor dans l'uniform matérial
uniform vec3 uColor;

// On importe la variable créer dans vertex avec sa valeur qu'on lui a donné
varying float vRandom;
varying float vElevation;
varying vec2 vUv;

void main()
{
    // Change color
    // vRandom permet de modifier la couleurs des piques, si ils sont proche de 1 = couleur si ils sont proche de 0 autre couleur
    vec4 textureColor = vec4(0.5, vRandom, 1.5, 1.0);
    textureColor.rgb += vElevation  ; 

    gl_FragColor = textureColor;
    // gl_FragColor = vec4(vUv, 1.0, 1.0);
}