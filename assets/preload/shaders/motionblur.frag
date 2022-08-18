// Original shader that started my idea
//    www.shadertoy.com/view/MtBXz1
//const float size = 4.0;
//const float interleave = 5.0;
#pragma header
uniform float iTime;
    
void mainImage() {
    vec4 result = vec4(0);
   	
    bool motionBlur = true; // change this
    if ( motionBlur ) {
        #define BLUR 30
        for (int i = 0 ; i < BLUR ; i++) {
            float rnd = hash13(vec3(fragCoord, iFrame*100+i));
            float time = iTime + rnd / 60.0;
            result += flixel_texture2D(fragCoord, time);
        }
        result /= float(BLUR);
    } else {
        result = scene(fragCoord, iTime);
    }
    
    fragColor = pow(result, vec4(1.0/2.2));
}