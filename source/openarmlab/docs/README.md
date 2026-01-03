# OpenArmLab

Isaac Lab extension for the OpenArm manipulator, providing base uni-/bimanual reaching tasks and a simple Gymnasium entrypoint for simulation and RL experimentation in Isaac Sim.

## Overview
- Adds OpenArm robot setup and scene configuration on top of NVIDIA Isaac Lab (Isaac Sim 2.x).
- Includes base task configs for single-arm and dual-arm reach controllers with reward, observation, and curriculum terms.
- Ships an example launcher that wires Isaac Lab tasks into Gymnasium for quick rollouts or integration tests.

## Requirements
- Isaac Lab `2.3.1` with Isaac Sim (matches the `isaaclab` pin in `pyproject.toml`).
- Python 3.11 (managed via uv) and a CUDA-capable GPU for Torch.
- uv installed (`curl -fsSL https://astral.sh/uv/install.sh | sh`).
- OpenArm assets from `isaaclab_assets` (pulled automatically through dependencies).

## Setup and usage
1) Install dependencies with uv (add `--extra dev` if you want dev tools):
   ```bash
   uv sync --extra dev
   ```
2) Launch the sample environment (choose an Isaac Lab task id that is registered in your setup):
   ```bash
   uv run python scripts/01_create_env.py --task <TASK_NAME> --num_envs 1 --headless
   ```
   Use `--robot_name` if your task registers the robot under a different name, and pass AppLauncher flags like `--headless` as needed.
   (If you prefer to activate the venv: `source .venv/bin/activate` after `uv sync`.)

## Project layout
- `source/openarmlab/config/extension.toml` — extension metadata (title, description, README pointer).
- `source/openarmlab/openarmlab/tasks/base_unimanual_task.py` — base scene/MDP config for single-arm reach.
- `source/openarmlab/openarmlab/tasks/base_bimanual_task.py` — base scene/MDP config for dual-arm reach.
- `scripts/01_create_env.py` — example Gymnasium launcher using Isaac Lab's AppLauncher and task registry.

## Development notes
- Extend the base task configs to register your own OpenArm tasks with custom observations/actions/rewards.
- Code style is configured in `pyproject.toml` (ruff section); install ruff (e.g., `uv tool install ruff`) and run `uv run ruff check .` after changes.
