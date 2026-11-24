#!/bin/bash
# Exercises E1 (source = xarm6) and E2 (fewer demonstrations). Part 4 writes to a fixed file name,
# so each run's CSV/PNG is copied to exercises/ before the next run overwrites it.
cd "$(dirname "$0")"
PY="$USERPROFILE/miniforge3/envs/aisr-xembody/python.exe"
mkdir -p exercises logs
cp results/04_learn_once_deploy_many_kuka_iiwa.csv exercises/E2_demos60.csv   # default run = 60 demos
mkdir -p _keep && cp -r results/04_learn_once_deploy_many_kuka_iiwa.* results/models _keep/
"$PY" experiments/04_learn_once_deploy_many.py --source xarm6 > logs/E1_source_xarm6.txt 2>&1
cp results/04_learn_once_deploy_many_xarm6.csv results/04_learn_once_deploy_many_xarm6.png exercises/
for d in 10 20 40; do
  "$PY" experiments/04_learn_once_deploy_many.py --demos $d > logs/E2_demos$d.txt 2>&1
  cp results/04_learn_once_deploy_many_kuka_iiwa.csv exercises/E2_demos$d.csv
done
# put the default (60-demo) Part 4 outputs back
cp _keep/04_learn_once_deploy_many_kuka_iiwa.* results/ && cp -r _keep/models results/ && rm -r _keep
echo EXERCISES_DONE
