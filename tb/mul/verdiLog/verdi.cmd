debImport "-f" "./file.f"
debLoadSimResult /home/wilson/code/ex_calculation/tb/mul/a.fsdb
wvCreateWindow
srcHBSelect "tb_mul.U_MULTIPLIER_0.U_MUL_GEN_0" -win $_nTrace1
srcHBSelect "tb_mul.U_MULTIPLIER_0" -win $_nTrace1
srcHBAddObjectToWave -clipboard
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 7245.407215 -snap {("U_MULTIPLIER_0" 4)}
wvSetCursor -win $_nWave2 7627.021197 -snap {("U_MULTIPLIER_0" 5)}
wvSetCursor -win $_nWave2 7248.412049 -snap {("U_MULTIPLIER_0" 4)}
wvSetCursor -win $_nWave2 147.236891 -snap {("U_MULTIPLIER_0" 4)}
wvSetCursor -win $_nWave2 832.339160 -snap {("U_MULTIPLIER_0" 5)}
wvSetCursor -win $_nWave2 853.373001 -snap {("U_MULTIPLIER_0" 4)}
debExit
