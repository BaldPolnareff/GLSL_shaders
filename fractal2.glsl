void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    // Normalize coordinates
    vec2 p = (2.0 * fragCoord - iResolution.xy) / iResolution.y;

    // Apply zooming and panning effect
    p *= 1.2;
    p += 0.08 * vec2(sin(iTime * 1.), cos(iTime * 0.3));

    // Generate a fractal pattern
    float f = 1.0;
    for (float i = 0.; i < 11.5; i++) {
        p = abs(p) / dot(p, p) - 0.519;
        f *= dot(p, p);
    }

    // Apply color transformation based on fractal
    vec3 color = .3*vec3(f * 0.2, f * 0.4, f * 0.6);

    // Apply distortion using sine and cosine functions
    vec2 distortedUV = (vec2(p.x + sin(p.y * 10.2 + iTime * 2.0) * .1, p.y + cos(p.x * 8.0 + iTime * 3.1) * 0.01));

    // Apply color manipulation based on distorted coordinates
    color += vec3(distortedUV.x * 0.3, distortedUV.y * 0.3, sin(distortedUV.x * distortedUV.y));

    // Create an animated gradient effect
    vec2 gradientUV = .3*vec2(fragCoord.x / iResolution.x, fragCoord.y / iResolution.y);
    color += vec3(gradientUV.x, gradientUV.y, sin(iTime * 2.2 + gradientUV.x + gradientUV.y));

    fragColor = .98 * vec4(color.x * .9, color.yz*1.1, 1.0);
}
