void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    // Normalize coordinates
    vec2 uv = fragCoord.xy / iResolution.xy;

    // Calculate the bar width
    float barWidth = .3 / float(iResolution.x) * 10.0;

    // Calculate the bar height using a sine wave
    float barHeight = (sin(uv.x * 12.0 + iTime) + 1.) * .5;

    float radius = length(uv);
    // Create a time-dependent wave effect
    float wave = sin(iTime * 1.5 + radius * 1.0);
    uv *= 2.*mat2(cos(iTime), sin(iTime), -sin(iTime), cos(iTime));
    uv *= .4;
    float f = 1.;

    for (float i = 0.5; i < 5.2; i++) {
        f += sin(uv.x * 12.0 + iTime * .2 + i * 1.5) * .5;
        // Calculate the position of the bar
        vec2 barPos = f * vec2(uv.x, barHeight);

        // Apply color based on the bar position
        vec3 color = vec3(barPos.x, barPos.y, 1.0 + barPos.y);

        // Draw the bar chart
        float chart = f * smoothstep(barPos.y, fract(barPos.y * 2.) + 2.* barWidth, fract(uv.y * 12.));

        // Apply animation to the chart
        chart *= sin(iTime * .02 + barPos.x * 24.0) * .5 + 3.5;

        // Apply color to the chart
        color *= 1.1*chart;
        // Set the final color
        fragColor = vec4(color, 1.0);
    }

}
