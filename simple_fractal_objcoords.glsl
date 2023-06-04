void mainImage( out vec4 fragColor, in vec2 fragCoord ) {
        vec2 uv = (fragCoord * 2.0 - iResolution.xy) / iResolution.y;
        vec2 uv0 = uv;
        vec3 finalColor = vec3(0.0);
        
        for (float i = 0.0; i < 1.3; i++){
            
            uv = fract(uv * 1.5) - .5;
            float d = length(uv);
           
            vec3 col = vec3((0.3 + fract(sin(iTime/2.2))), (0.15 + fract(sin(iTime/2.))), (0.6 + fract(sin(iTime/3.))));
            
            d = sin(d*8. + iTime)/8.;
            d = abs(d);
            
            d = 0.01/d;
            
            finalColor += col * d;
        }
        
        fragColor = vec4(finalColor, 1.0);
}