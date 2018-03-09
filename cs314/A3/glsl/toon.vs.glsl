uniform vec3 lightDirection;

varying vec3 vNormal;
varying vec4 vLightDirection;
varying vec4 vPosition;

void main() {

	// TODO: PART 1D
	vNormal = normalMatrix * normal;
	vLightDirection = viewMatrix * vec4(lightDirection, 0.0);
	vPosition = modelViewMatrix * vec4(position, 1.0);
	
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}
