# Experiment 7 – Webots: e-puck swarm and Pioneer 3-DX lidar navigation

Source project: <https://github.com/reshamrajs/webots-robotics-sim> (README.md, GUIDE.md).
Only the files I changed or added are in this folder, as the lab guidelines ask.

## Setup

- Webots R2025a for Windows, installed in `C:\Program Files\Webots`
- Python 3.13.5 for the controllers and the analysis (NumPy 2.3.2, Matplotlib 3.10.8)
- Windows 11 Home, Intel Core i7-1165G7

```
git clone https://github.com/reshamrajs/webots-robotics-sim.git
cd webots-robotics-sim
mv analysis/runs analysis/runs_reference   # keep the author's example runs out of my results
mkdir analysis/runs
```

## Files changed or added (see `changes.diff`)

| File | Change |
|---|---|
| `tools/run_experiment.py` | **Windows bug fix.** The CSV path (`D:\...`) was put into a `re.sub` replacement string, where `\A` is read as an escape: `re.error: bad escape \A`. Now the path uses `/` and the replacement is a function. Also added two worlds for exercise 4, and raised the wall-clock timeout (`3 × seconds` was too short for the 8 ms time step, so those runs were killed half-way). |
| `analysis/plot_trajectories.py` | Added axis labels in metres. |
| `worlds/swarm_arena_ts64.wbt`, `worlds/swarm_arena_ts8.wbt` | Copies of `swarm_arena.wbt` with `basicTimeStep 64` and `8` (GUIDE.md exercise 4). |
| `run_batch.sh` | Runs every setting 3 times, one after another (the runner reuses one temporary world file, so runs must not overlap). |

## Commands run

```
python tools/run_experiment.py swarm --seconds 120 --name swarm_default_r1
bash run_batch.sh          # 36 runs: see the script for the full list
```

Settings, 3 repeats each:

- Part A (120 s): swarm default; `cruise=0.9`
- Part B (180 s): Pioneer default; `bubble=0.15`; `bubble=0.9`
- Exercise 1 (speed vs safety): `cruise` = 0.2, 0.4, 0.6, 0.8, 1.0 (0.5 = default runs)
- Exercise 4 (time step): `basicTimeStep` 64 and 8 ms (32 ms = default runs)

The trajectory CSVs are in `runs/`, the runner output for each run in `logs/`.
`exp07_analysis.ipynb` computes every table and figure in the report from `runs/*.csv`.

## Problems met

- `run_experiment.py` crashed on Windows (path escape, fixed above).
- The 8 ms runs are slow (4× more steps) and hit the runner's wall-clock timeout (`3 × seconds`), so the
  timeout was raised. A few runs (8 ms and one 64 ms) still stopped early while another Webots
  project was running on the same machine at the same time (port 1234 in use). Every truncated CSV was
  discarded and that run repeated (one 8 ms repeat failed twice, so the 8 ms setting has 2 runs); only complete 120 s / 180 s logs are in `runs/`.
- Repeats are bit-for-bit identical here (same file checksum for r1, r2, r3 of every setting): fast mode with
  synchronous controllers, and the e-puck noise is seeded by robot name, so nothing random is left.
