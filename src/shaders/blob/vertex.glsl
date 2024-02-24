/*
*UNIFORM 
*/
// Récupérer la valeur de uFrequency dans uniform material
uniform vec3 uFrequency;
// Récupérer uTime pour animation 
uniform float uTime;


/*
*ATTRIBUTE
*/
// Récupérer les valeurs des randoms des attributes (float car THREE.BufferAttribute(randoms, ->1<-))
attribute float aRandom;
attribute vec2 Uv;

/*
*VARYING
*/
// Permet de créer une variable qu'on l'on pourra utiliser dans fragment ne pas oublier de la changer dans le code aprés
varying float vRandom;
varying float vElevation;
varying vec2 vUv;

void main()
{
    /*
    * projectionMatrix = Transform the coordinates into the clip space coordinates
    * viexMatrix = Apply transformations relative to the camera (position, rotation, fiels of view, near, far)
    * modelMatrix = Apply transformations relative to the Mesh (position, rotation, scale)

    * =>Return vec4
    */

    // POUR AVOIR PLUS DE CONTROLE ON FAIT ÇA CE QUI REVIENT A ATTRIBUER QU'UNE SEULE VARIABLE A gl_position
    vec4 modelPosition = modelMatrix * vec4(position,1.0);

    float elevation = smoothstep(-1.0, 0.5, (sin(modelPosition.x) * 0.3 * -cos(modelPosition.y) * 10.0) / 2.0) * sin(uTime);


    // Courber l'object = le *10 permet d'avoir une plus grosse valeur (plus grosse ondulation)
    // le *0.1 permet que l'ondulation n'aille pas trop loin (de -1 à 1 au lieu de -0.1 à +0.1)
    // modelPosition.z += sin(modelPosition.x * 40.0) * 0.1;

    // On ajoute ses vecteurs aléatoires a notre modelPosition pour lui donner un effet
    // modelPosition += aRandom * .1;

    // Ajouter uFrenquency pour l'ondulation et uTime pour l'animation 
    // modelPosition.z = sin(modelPosition.x * uFrequency.x - uTime);
    // modelPosition.z = sin(modelPosition.y * uFrequency.y - uTime);

    modelPosition.z += elevation * 10.0;


    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;

    gl_Position = projectedPosition;
    // gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);

    vRandom = aRandom;

    vElevation = elevation;

    vUv = Uv;
}