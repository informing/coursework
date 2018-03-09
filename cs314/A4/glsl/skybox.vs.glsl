varying vec4 viewDirection;
varying vec4 nnormal;
//uniform vec3 cameraPosition;

void main() {
	//normalize(vec3(vec4(gl_Normal, 0.0) * modelMatrixInverse));
	nnormal = vec4(normal, 0.);
	viewDirection = modelMatrix * vec4(position, 1.0) - vec4(cameraPosition, 1.0);
	gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}
