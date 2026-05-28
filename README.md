<div align="center">

# 🦾 kinematics-matlab

**A small library of MATLAB functions for robot-arm forward / inverse kinematics, the Jacobian, and trajectory generation.**

[![Language](https://img.shields.io/badge/MATLAB-R2020a+-0076A8?style=for-the-badge&logo=mathworks&logoColor=white&labelColor=0E1626)](https://www.mathworks.com/products/matlab.html)
[![Toolbox](https://img.shields.io/badge/Robotics%20Toolbox-Peter%20Corke-22D3EE?style=for-the-badge&labelColor=0E1626)](https://petercorke.com/toolboxes/robotics-toolbox/)
[![Topics](https://img.shields.io/badge/RRR%20·%20RRP%20·%20Jacobian%20·%20Trajectory-Manipulator%20kinematics-5A8DFF?style=for-the-badge&labelColor=0E1626)](#-whats-inside)

</div>

---

## 🎯 What is it

A tidy set of MATLAB `.m` functions covering the staple problems of a manipulator kinematics & dynamics course: forward / inverse kinematics for **RRR** and **RRP** arms, the analytical **Jacobian**, and **cubic** + **quintic** joint-space trajectories with auto-plotted position / velocity / acceleration.

Drop the repo on your MATLAB path and call the functions directly — no `main` script, no UI.

---

## ✨ What's inside

| File | Purpose |
|---|---|
| `fwdrrr.m` | Forward kinematics for an **RRR** arm (`none` / `left` / `right` shoulder offset) |
| `fwdrrp.m` | Forward kinematics for an **RRP** arm |
| `invrrr.m` | Inverse kinematics for **RRR** — returns both elbow-up / elbow-down and reverse-base solutions, in `deg` or `rad` |
| `invrrp.m` | Inverse kinematics for **RRP** |
| `jcb.m` | Symbolic **Jacobian** (linear + angular blocks) built from the per-joint transforms `t_all` produced by `fkine` |
| `cubic.m` | Cubic-polynomial joint trajectory; returns coefficients, symbolic `q(t)`, `v(t)`, `a(t)`, and plots all three |
| `quantic.m` | Quintic (5th-order) trajectory — same outputs as `cubic.m` but matches initial / final acceleration too |

All forward / inverse functions handle a `d_offset` shoulder displacement and a `side` flag (`'none'`, `'left'`, `'right'`) so you can model arms mounted off the base axis.

---

## 🚀 Setup

```text
1. Clone the repo
2. Open MATLAB
3. Home → Set Path → Add Folder…
4. Pick the repo root, click Save
5. Done — the functions are now callable from anywhere
```

> 📦 The forward / inverse / Jacobian functions use **Peter Corke's Robotics Toolbox** (`Link`, `SerialLink`, `fkine`). Install it before running them.

---

## 🧪 Example — RRR forward kinematics

```matlab
% RRR arm with link lengths d1, a2, a3 and no shoulder offset
T = fwdrrr(pi/4, pi/6, -pi/3, 0.3, 0.25, 0.2, 0, 'none');
disp(T)
```

## 🧪 Example — cubic trajectory

```matlab
% Move from q=0 to q=pi/2 over 2 s, starting and ending at rest
[A, qSym, vSym, aSym] = cubic(0, pi/2, 0, 0, 0, 2);
```

The function pops a 3-row figure with position / velocity / acceleration vs. time and returns the coefficient vector plus symbolic expressions in `T`.

## 🧪 Example — Jacobian of a 4-DoF arm

```matlab
syms th1 d2 d4 d1 d3 thd real

L2(1) = Link([th1 d1 0 0 , 0]);
L2(2) = Link([0   d2 d3 0, 1]);
L2(3) = Link([thd 0  0 -pi/2, 0]);
L2(4) = Link([0   d4 0 0, 1]);
robot = SerialLink(L2);

[~, t_all] = fkine(robot, [th1 d2 thd d4]);
[jv, jw, J] = jcb(4, t_all, robot);
```

---

## 🗂 Project structure

```text
kinematics-matlab/
├── fwdrrr.m       # RRR forward kinematics
├── fwdrrp.m       # RRP forward kinematics
├── invrrr.m       # RRR inverse kinematics (multiple solutions, deg/rad)
├── invrrp.m       # RRP inverse kinematics
├── jcb.m          # symbolic Jacobian builder
├── cubic.m        # cubic-polynomial trajectory + plot
└── quantic.m      # quintic-polynomial trajectory + plot
```

---

## 🆘 Notes

- These are **course-style reference functions** — single-file, no tests, no packaging. Treat them as a starting point you can copy / adapt.
- `invrrr` returns up to four solutions (elbow up/down × base normal/flipped). Pick whichever is reachable for your setup.
- `cubic` / `quantic` both build the time vector with `1:tf*100` — keep `tf > 0` and reasonably small or you'll allocate a long array.

---

<div align="center">

**kinematics-matlab** · [GitHub](https://github.com/Luck-ai/kinematics-matlab) · [Issues](https://github.com/Luck-ai/kinematics-matlab/issues)

</div>
