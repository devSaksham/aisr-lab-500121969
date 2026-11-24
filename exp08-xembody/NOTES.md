# Experiment 8 – Cross-embodiment transfer of a manipulation skill (PyBullet)

Source: course package `AISR-Cross-Embodiment-PyBullet` (README.md, MANUAL.md). Only my outputs are
committed here, not the package itself. The instructor's reference results were moved out of `results/`
before running, so everything in `results/` and `exercises/` comes from my run.

## Environment

PyBullet has no Windows wheel on PyPI, so it comes from conda-forge (Miniforge):

```
conda create -n aisr-xembody python=3.11 pybullet numpy matplotlib scikit-learn pillow
conda install -n aisr-xembody "libblas=*=*openblas"
conda activate aisr-xembody
```

Python 3.11.18, PyBullet 3.25, NumPy 2.4.6, scikit-learn 1.9.1, Matplotlib 3.11.2, Pillow 13.0.
Windows 11 Home, Intel Core i7-1165G7, no GPU.

**Problem met:** the first `run_all.py` crashed in Part 1 with Windows error `0xC06D007F` inside
Matplotlib. Any NumPy matrix product crashed: conda had installed the MKL BLAS (`mkl 2026.1`), which
failed to load on this PC. Switching the BLAS to OpenBLAS (second command above) fixed it.

## Commands run

```
python run_all.py                                              # Parts 0-5, default settings
bash run_exercises.sh                                          # exercises E1 and E2
```

`run_exercises.sh` runs `experiments/04_learn_once_deploy_many.py --source xarm6` (E1) and
`--demos 10 / 20 / 40` (E2). Part 4 always writes the same file name, so each output is copied to
`exercises/` and the default 60-demonstration Part 4 outputs are put back in `results/` afterwards.

## Files

- `results/` – CSVs and figures of Parts 0–5 (`01_workspace.png` … `05_multi_embodiment.png`)
- `exercises/` – E1 (`04_learn_once_deploy_many_xarm6.csv/.png`), E2 (`E2_demos10/20/40/60.csv`)
- `logs/` – console output of every run
- `run_exercises.sh` – the exercise script
- `code_excerpt.txt` – the library lines quoted in the report (IK adapter, observation features, DART)
