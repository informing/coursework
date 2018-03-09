//VARYING VAR
varying vec3 Normal_V;
varying vec3 Position_V;
varying vec4 PositionFromLight_V;
varying vec2 Texcoord_V;

uniform mat4 lightViewMatrix;
uniform mat4 lightProjectMatrix;

varying mat4 mvMatrix;
varying vec4 shadowCoord;

//UNIFORM VAR
// Inverse world matrix used to render the scene from the light POV
uniform mat4 lightViewMatrixUniform;
// Projection matrix used to render the scene from the light POV
uniform mat4 lightProjectMatrixUniform;

void main() {
	Normal_V = normalMatrix * normal;
	Position_V = vec3(modelViewMatrix * vec4(position, 1.0));
	Texcoord_V = uv;
   
	//we’ll do everything in camera space, because it’s simpler to get the fragment’s position in this space. This is why we multiply our T,B,N vectors with the ModelView matrix.
	
	mvMatrix = modelViewMatrix;

	mat4 biasMatrix = mat4(
		vec4(0.5, 0.0, 0.0, 0.0),
		vec4(0.0, 0.5, 0.0, 0.0),
		vec4(0.0, 0.0, 0.5, 0.0),
		vec4(0.5, 0.5, 0.5, 1.0));
		
	mat4 depthBiasMVP = biasMatrix * lightProjectMatrix * lightViewMatrix * modelMatrix;
	shadowCoord = depthBiasMVP * vec4(position, 1.0);
   
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}
