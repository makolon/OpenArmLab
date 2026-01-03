# OpenArmLab

Isaac Lab extension for the OpenArm manipulator, providing base uni-/bimanual reaching tasks and a Gymnasium entrypoint for simulation/RL experiments in Isaac Sim.

## Features
- OpenArm robot setup and scenes on top of NVIDIA Isaac Lab.
- Base uni- and bimanual reaching task configs (observations, rewards, curriculum).
- Sample launcher that wraps tasks as Gymnasium envs for quick rollouts.

## Prerequisites
- NVIDIA GPU drivers + CUDA (container base: CUDA 12.8).
- Isaac Sim with Isaac Lab assets (pulled via `isaaclab[isaacsim,all]==2.3.1`).
- Python 3.11, managed by [uv](https://github.com/astral-sh/uv) (`curl -fsSL https://astral.sh/uv/install.sh | sh`).
- Optional: Docker with `docker compose` (see below).

## Quickstart (local, uv)
```bash
uv sync --extra dev           # install deps and dev tools
uv run python scripts/01_create_env.py --task <TASK_NAME> --num_envs 1 --headless
# or activate venv: source .venv/bin/activate
```
Replace `<TASK_NAME>` with a registered Isaac Lab task id; add `--robot_name` if your task uses a different robot key.

## Using Docker
Build and launch the Compose services (needs NVIDIA runtime):
```bash
OPENARMLAB_PATH=/workspace/openarmlab WEB_PORT=6080 docker compose up -d --build
docker compose run --rm openarmlab bash   # enter the app container
cd /workspace/openarmlab
uv sync --extra dev
uv run python scripts/01_create_env.py --task <TASK_NAME> --num_envs 1 --headless
```
`desktop` service exposes a web VNC at `WEB_PORT` for GUI runs; add/remove `--headless` as needed.

## Development
- Lint: `uv run ruff check .` (config in `pyproject.toml`).
- Tests: add/execute with `uv run pytest` as needed.
- For dependency changes, edit `pyproject.toml` (uv resolves/locks via `uv sync`).
