// UNIFORMS
uniform samplerCube skybox;
varying vec4 viewDirection;

void main() {
	gl_FragColor = textureCube(skybox, viewDirection.xyz);
}
