debImport "-f" "./file.f"
debLoadSimResult /home/wilson/code/ex_calculation/tb/sel/a.fsdb
wvCreateWindow
srcHBSelect "tb_selection.U_SELECTION_0" -win $_nTrace1
srcHBAddObjectToWave -clipboard
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 140.696517 -snap {("U_SELECTION_0" 5)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 668.308458 -snap {("U_SELECTION_0" 1)}
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "U_SELECTION_0" 4 )} 
wvSelectSignal -win $_nWave2 {( "U_SELECTION_0" 5 )} 
wvSelectSignal -win $_nWave2 {( "U_SELECTION_0" 4 )} 
wvSelectSignal -win $_nWave2 {( "U_SELECTION_0" 3 )} 
wvSetPosition -win $_nWave2 {("U_SELECTION_0" 3)}
wvExpandBus -win $_nWave2 {("U_SELECTION_0" 3)}
wvSetPosition -win $_nWave2 {("U_SELECTION_0" 20)}
wvScrollUp -win $_nWave2 5
wvSelectSignal -win $_nWave2 {( "U_SELECTION_0" 4 )} 
wvSelectSignal -win $_nWave2 {( "U_SELECTION_0" 4 5 6 7 )} 
wvSelectSignal -win $_nWave2 {( "U_SELECTION_0" 5 )} 
wvSelectSignal -win $_nWave2 {( "U_SELECTION_0" 4 )} 
wvSelectSignal -win $_nWave2 {( "U_SELECTION_0" 4 5 6 7 )} 
wvCreateBusOpen -win $_nWave2
wvSetPosition -win $_nWave2 {("U_SELECTION_0" 20)}
wvSetPosition -win $_nWave2 {("U_SELECTION_0" 20)}
wvSetPosition -win $_nWave2 {("U_SELECTION_0" 21)}
wvSetPosition -win $_nWave2 {("U_SELECTION_0" 20)}
wvSetPosition -win $_nWave2 {("U_SELECTION_0" 20)}
wvCreateBus -win $_nWave2 "int\[3:0\]" "/tb_selection/U_SELECTION_0/data\[14\]" \
           "/tb_selection/U_SELECTION_0/data\[13\]" \
           "/tb_selection/U_SELECTION_0/data\[12\]" \
           "/tb_selection/U_SELECTION_0/data\[11\]"
wvSetPosition -win $_nWave2 {("U_SELECTION_0" 21)}
wvSetPosition -win $_nWave2 {("U_SELECTION_0" 21)}
wvSelectSignal -win $_nWave2 {( "U_SELECTION_0" 8 )} 
wvScrollDown -win $_nWave2 3
wvScrollDown -win $_nWave2 5
wvSelectSignal -win $_nWave2 {( "U_SELECTION_0" 8 9 10 11 12 13 14 15 16 17 18 \
           )} 
wvCreateBusOpen -win $_nWave2
wvSetPosition -win $_nWave2 {("U_SELECTION_0" 21)}
wvSetPosition -win $_nWave2 {("U_SELECTION_0" 21)}
wvSetPosition -win $_nWave2 {("U_SELECTION_0" 22)}
wvSetPosition -win $_nWave2 {("U_SELECTION_0" 21)}
wvSetPosition -win $_nWave2 {("U_SELECTION_0" 21)}
wvCreateBus -win $_nWave2 "frame\[10:0\]" \
           "/tb_selection/U_SELECTION_0/data\[10\]" \
           "/tb_selection/U_SELECTION_0/data\[9\]" \
           "/tb_selection/U_SELECTION_0/data\[8\]" \
           "/tb_selection/U_SELECTION_0/data\[7\]" \
           "/tb_selection/U_SELECTION_0/data\[6\]" \
           "/tb_selection/U_SELECTION_0/data\[5\]" \
           "/tb_selection/U_SELECTION_0/data\[4\]" \
           "/tb_selection/U_SELECTION_0/data\[3\]" \
           "/tb_selection/U_SELECTION_0/data\[2\]" \
           "/tb_selection/U_SELECTION_0/data\[1\]" \
           "/tb_selection/U_SELECTION_0/data\[0\]"
wvSetPosition -win $_nWave2 {("U_SELECTION_0" 22)}
wvSetPosition -win $_nWave2 {("U_SELECTION_0" 22)}
srcDeselectAll -win $_nTrace1
srcSetOptions -win $_nTrace1 -annotate on
schSetOptions -win $_nSchema1 -annotate on
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "U_SELECTION_0" 18 )} 
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 488.669154 -snap {("U_SELECTION_0" 12)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "U_SELECTION_0" 22 )} 
wvScrollUp -win $_nWave2 6
wvSelectSignal -win $_nWave2 {( "U_SELECTION_0" 3 )} 
wvSetPosition -win $_nWave2 {("U_SELECTION_0" 3)}
wvCollapseBus -win $_nWave2 {("U_SELECTION_0" 3)}
wvSetPosition -win $_nWave2 {("U_SELECTION_0" 3)}
wvSetPosition -win $_nWave2 {("U_SELECTION_0" 7)}
wvSetCursor -win $_nWave2 150.746269 -snap {("U_SELECTION_0" 5)}
wvSelectSignal -win $_nWave2 {( "U_SELECTION_0" 6 )} 
wvSelectSignal -win $_nWave2 {( "U_SELECTION_0" 7 )} 
wvSelectSignal -win $_nWave2 {( "U_SELECTION_0" 7 )} 
wvSetRadix -win $_nWave2 -format Bin
wvSelectSignal -win $_nWave2 {( "U_SELECTION_0" 7 )} 
wvSetRadix -win $_nWave2 -format Hex
wvSetCursor -win $_nWave2 74.116915 -snap {("U_SELECTION_0" 7)}
wvSetCursor -win $_nWave2 111.803483 -snap {("U_SELECTION_0" 5)}
wvSetCursor -win $_nWave2 123.109453 -snap {("U_SELECTION_0" 5)}
wvSetCursor -win $_nWave2 128.134328 -snap {("U_SELECTION_0" 1)}
wvSetCursor -win $_nWave2 108.034826 -snap {("U_SELECTION_0" 5)}
wvSetCursor -win $_nWave2 120.597015 -snap {("U_SELECTION_0" 5)}
wvSetCursor -win $_nWave2 128.134328 -snap {("U_SELECTION_0" 1)}
wvSetCursor -win $_nWave2 272.599502 -snap {("U_SELECTION_0" 7)}
wvSetCursor -win $_nWave2 268.830846 -snap {("U_SELECTION_0" 1)}
wvSelectSignal -win $_nWave2 {( "U_SELECTION_0" 7 )} 
wvSelectSignal -win $_nWave2 {( "U_SELECTION_0" 7 )} 
wvSetRadix -win $_nWave2 -format Bin
wvSetCursor -win $_nWave2 75.373134 -snap {("U_SELECTION_0" 7)}
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 631.490857 -snap {("U_SELECTION_0" 7)}
wvSetCursor -win $_nWave2 615.943593 -snap {("U_SELECTION_0" 7)}
wvSetCursor -win $_nWave2 610.968468 -snap {("U_SELECTION_0" 1)}
wvSetCursor -win $_nWave2 670.048070 -snap {("U_SELECTION_0" 1)}
wvSetCursor -win $_nWave2 709.227175 -snap {("U_SELECTION_0" 1)}
wvSetCursor -win $_nWave2 770.183908 -snap {("U_SELECTION_0" 1)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 1465.174129 -snap {("U_SELECTION_0" 1)}
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 1429.433606 -snap {("U_SELECTION_0" 1)}
debExit
