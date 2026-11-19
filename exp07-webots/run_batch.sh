#!/bin/bash
# Sequential: run_experiment.py reuses one temp world file per world, so no parallel runs.
cd "$(dirname "$0")"
run(){ label=$1; shift; [ -f analysis/runs/$label.csv ] && return; python tools/run_experiment.py "$@" --name $label > logs/$label.txt 2>&1; echo "$label done"; }
for r in 1 2 3; do run swarm_default_r$r swarm --seconds 120; done
for r in 1 2 3; do run swarm_cruise0.9_r$r swarm --seconds 120 --set cruise=0.9; done
for r in 1 2 3; do run pioneer_default_r$r pioneer --seconds 180; done
for r in 1 2 3; do run pioneer_bubble0.15_r$r pioneer --seconds 180 --set bubble=0.15; done
for r in 1 2 3; do run pioneer_bubble0.9_r$r pioneer --seconds 180 --set bubble=0.9; done
for c in 0.2 0.4 0.6 0.8 1.0; do for r in 1 2 3; do run ex1_cruise${c}_r$r swarm --seconds 120 --set cruise=$c; done; done
for r in 1 2 3; do run ex4_ts64_r$r swarm_ts64 --seconds 120; done
for r in 1 2 3; do run ex4_ts8_r$r swarm_ts8 --seconds 120; done
echo ALL_DONE
