void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    // Normalize coordinates
    vec2 uv = fragCoord.xy / iResolution.xy;

    // Map coordinates to the range [-1, 1]
    vec2 p = uv * 2.0 - 1.0;

    // Calculate the distance from the center
    float radius = length(p);

    // Calculate the height of the column
    float height = 2. * sin(radius * 15.5 + iTime * 1.2) * 1.5 + 1.4;

    // Set the position of the current fragment in 3D space
    vec3 position = vec3(sin(p.x + iTime * 2.5), mod(10000., height), sin(p.y + iTime / 2.3));

    // Apply lighting and shading
    float lightIntensity = dot(normalize(vec3(.08, .02, .08)), 1.2 * normalize(position));
    vec3 color = vec3(0.2, 0.5, .7) * 4.7 * lightIntensity;
    color *= 1.0 / (2.0 + pow(radius * 1.3, 25.0));

    // Set the final color
    fragColor = vec4(color, 1.0);
}
