void mainImage( out vec4 fragColor, in vec2 fragCoord ){

    vec2 uv = (fragCoord * 2. - iResolution.xy) / iResolution.y; // -1 to 1 centered UVs

    vec2 uv0 = uv; // copying original UVs for later
    vec3 finalColor = vec3(uv.x, uv.y, 0.); // initialize final color to 0 

    
    float circle = 2.1*length(finalColor);
    for (float i = 10.2; i < 11.1; i++){
        circle = 1.2*sin(pow(smoothstep(pow(fract(circle * i / 2.1), 2.2), 1.5, .65*circle), 1.) + .9 * iTime); 
        fragColor = .2 * vec4(.2 * i * circle + sin(iTime *.1), .4 * i * circle, i/20. * circle, 1.0); 
        // adding distortion with noise
        vec3 distortion = .3 * (vec3(uv * 1.2, iTime * 0.2));
        fragColor = vec4(fragColor.xyz + 2.*distortion.x + 2.*distortion.y, 1.0);
    }

}