# AISR laboratory – CSAI4014 Algorithms for Intelligent Systems and Robotics

B.Tech CSE (AI & ML), Semester VII, Autumn 2026–27, UPES Dehradun. Course teacher: Dr. Resham Raj Shivwanshi.

| | |
|---|---|
| Name | Student Name |
| SAP ID | 5001XXXXX |
| Batch | A |
| Partner(s) | Partner Name (5001XXXXX) |

## Contents

| Folder | Experiment | Run with |
|---|---|---|
| `exp01-signals/` | 1. Time and frequency domain, and the pendulum | `exp01.ipynb` |
| `exp02-queens/` | 2. The eight queens problem | `exp02.ipynb` |
| `exp03-search/` | 3. Breadth-first and depth-first search | `exp03.ipynb` |
| `exp04-hillclimb/` | 4. Hill climbing | `exp04.ipynb` |
| `exp05-rl/` | 5. Reinforcement learning (tabular Q-learning) | `exp05.ipynb` |
| `exp06-neural/` | 6. A simple neural network (NumPy only) | `exp06.ipynb` |
| `exp07-webots/` | 7. Webots: e-puck swarm and Pioneer lidar navigation | see `NOTES.md` |
| `exp08-xembody/` | 8. Cross-embodiment transfer (PyBullet) | see `NOTES.md` |

Each notebook runs top to bottom on a fresh kernel and writes its figures to `figs/` and the numbers quoted in the report to `results.json`:

```
pip install numpy scipy matplotlib jupyter
jupyter nbconvert --to notebook --execute --inplace exp01-signals/exp01.ipynb
```

Tested with Python 3.13.5, NumPy 2.3.2, SciPy 1.16.1, Matplotlib 3.10.8 on Windows 11 (Intel Core i7-1165G7).
Experiment 7 used Webots R2025a.

## Sources

- CSAI4014 Laboratory Manual, Experiments 1 to 6 (aims, methods and the example code each notebook starts from)
- reshamrajs/webots-robotics-sim, README.md and GUIDE.md (Experiment 7)
- Textbooks: Oppenheim & Schafer; Strogatz; Russell & Norvig; Wirth; Sutton & Barto; Watkins & Dayan; Minsky & Papert; Rumelhart, Hinton & Williams; Braitenberg; Sezer & Gokasan (full list in the report's References)

## AI tools

Claude (Anthropic), used through Claude Code, wrote the notebooks and analysis scripts, ran the experiments and drafted the report text. I reviewed the code and the results. Details per experiment are in Appendix B of the report.
