Shader "Ulsa/BasicShader"
{
    Properties
    {
        _MainTex("Main Texture", 2D)="white"{}
        _NormalTex("Normal Map", 2D)="bump"{}
        _Albedo("Albedo", Color)= (1,1,1,1)//tipo vec4
        //_NormalStrength("Normal value", Range(-4.0, 4.0))
    }

    SubShader
    {
        Tags{"RenderType" = "Opaque"}

        CGPROGRAM

        #pragma surface surf Lambert

        fixed4 _Albedo;
        sampler2D _MainTex;
        sampler2D _NormalTex;

        struct Input
        {
            float2 uv_MainTex;
            float4 color : COLOR;
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = 1;
            o.Albedo = _Albedo.rgb;
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb*_Albedo.rgb;
            o.Normal = UnpackNormal(tex2D(_NormalTex, IN.uv_MainTex));
        }
        ENDCG

    }
}
