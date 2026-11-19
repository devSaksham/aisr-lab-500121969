# Experiment 8 – Cross-embodiment transfer (PyBullet)

Not run yet. The instructions and code are in the course zip `AISR-Cross-Embodiment-PyBullet`
(README.md, MANUAL.md, docs/MANUAL.pdf), which is not on the course teacher's GitHub.

Environment check on this machine (Windows 11, Python 3.11 venv): `pip install pybullet` has no
Windows wheel and needs Microsoft C++ Build Tools to compile. The conda-forge package
(`conda env aisr-xembody`, as the guidelines name it) is the easier route.

Planned commands, once the zip is in place:

```
python experiments/00_check_setup.py          # expect: SETUP OK
python experiments/01_explore_embodiments.py
python experiments/02_joint_space_transfer.py
python experiments/03_task_space_transfer.py
python experiments/04_learn_once_deploy_many.py
python experiments/05_multi_embodiment.py
```
