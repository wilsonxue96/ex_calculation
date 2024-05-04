clean:
	rm -rf novas* *.log *.fsdb simv* ucli* ./csrc ./simv.daidir ./verdiLog

vcs_pre:
	vcs -full64 -R +v2k -fsdb +define+FSDB -sverilog -f file.f -l run.log

run_verdi:
	verdi -f ./file.f -ssf *.fsdb &
