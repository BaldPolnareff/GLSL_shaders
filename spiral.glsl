void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    // Normalize coordinates
    vec2 p = (fragCoord - 0.5 * iResolution.xy) / iResolution.y;

    // Calculate distance from the center
    float radius = length(p);

    // Create a time-dependent wave effect
    float wave = sin(iTime * 1.5 + radius * 1.0);
    p *= 2.8*mat2(cos(iTime), sin(iTime), -sin(iTime), cos(iTime));
    p *= 1.5;
    float f = 1.;

    for (float i = 1.2; i <= 2.5; i++) {
        p = fract(abs(p) / dot(p, p) - 0.38);
        f *= fract(dot(1.*p, p));

        wave += f * sin(iTime * i + radius * i * 5.0) * 0.2 / i;
        wave /= cos(iTime * i + radius * i * 5.0) * 2.4;
    
        // Apply distortion to the coordinates
        vec2 distortedUV = vec2(p.x/3. + wave * 1.1, p.y - wave * .5);

        // Calculate color based on the distorted coordinates
        vec3 color = vec3(distortedUV, 0.5 + 2. * f * i * sin(iTime));

    fragColor = vec4(.03*color.x, .8*color.y, sin(.4*color.z + iTime * 0.1), 1.0);
    }
}
