# Experiment 8 – Cross-embodiment transfer (PyBullet)

Not run yet. The instructions and code are in the course zip `AISR-Cross-Embodiment-PyBullet`
(README.md, MANUAL.md, docs/MANUAL.pdf), which is not on the course teacher's GitHub.

Environment (ready): PyBullet has no Windows wheel on PyPI, so it is installed from conda-forge with Miniforge:

```
conda create -n aisr-xembody python=3.11 pybullet numpy matplotlib
conda activate aisr-xembody
```

Python 3.11.18, PyBullet (conda-forge), NumPy 2.4.6, Matplotlib 3.11.2; `p.connect(p.DIRECT)` works.

Planned commands, once the zip is in place:

```
python experiments/00_check_setup.py          # expect: SETUP OK
python experiments/01_explore_embodiments.py
python experiments/02_joint_space_transfer.py
python experiments/03_task_space_transfer.py
python experiments/04_learn_once_deploy_many.py
python experiments/05_multi_embodiment.py
```
