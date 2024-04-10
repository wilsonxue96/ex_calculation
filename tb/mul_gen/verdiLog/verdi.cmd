debImport "-f" "./file.f"
debLoadSimResult /home/wilson/code/ex_calculation/tb/mul_gen/a.fsdb
wvCreateWindow
srcHBSelect "tb_mul_gen.U_MUL_GEN_0" -win $_nTrace1
srcHBAddObjectToWave -clipboard
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 45.797571 -snap {("U_MUL_GEN_0" 1)}
wvSetCursor -win $_nWave2 145.337189 -snap {("G2" 0)}
wvSetCursor -win $_nWave2 68.229034 -snap {("U_MUL_GEN_0" 3)}
wvSetCursor -win $_nWave2 70.565645 -snap {("U_MUL_GEN_0" 1)}
debExit
