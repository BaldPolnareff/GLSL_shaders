void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    vec2 p = (2.0 * fragCoord - iResolution.xy) / iResolution.y; // Normalize coordinates

    // Scale and rotate the coordinate system
    p *= mat2(cos(iTime), sin(iTime), -sin(iTime), cos(iTime));
    p *= 5.0;

    float f = 1.0;
    for (float i = 0.; i < 7.6; i++) {
        p = abs(p) / dot(p, p) - 0.638;
        f *= dot(1.1*p, p);
    }

    // Apply coloring to the fractal
    vec3 color = vec3(f * 0.1 + .007*sin(iTime + 1.2), f * 0.8 + .007*cos(iTime + 1.2), f * 0.26 + .007*sin(iTime/10. + 0.2));

    // Add some variation to the coloring
    color += 0.002 * vec3(sin(fragCoord.x * 0.1), cos(fragCoord.y * 0.05), sin(iTime * 0.3));

    fragColor = 10.*vec4(color, 1.0);
}