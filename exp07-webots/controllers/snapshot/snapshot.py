"""Supervisor that saves the 3D view as an image after --at seconds, then quits (used for Figure 7.1)."""
import sys
from controller import Supervisor

args = dict(a.lstrip("-").split("=", 1) for a in sys.argv[1:])
sup = Supervisor()
dt = int(sup.getBasicTimeStep())
while sup.step(dt) != -1:
    if sup.getTime() >= float(args.get("at", "20")):
        sup.exportImage(args["out"], 100)
        sup.step(dt)
        print("saved", args["out"])
        sup.simulationQuit(0)
        break
