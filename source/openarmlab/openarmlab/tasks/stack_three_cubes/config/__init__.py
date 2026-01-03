import gymnasium as gym

from . import agents

##
# Register Gym environments.
##

gym.register(
    id="Isaac-StackThreeCubes-OpenArm-Uni-v0",
    entry_point="isaaclab.envs:ManagerBasedRLEnv",
    disable_env_checker=True,
    kwargs={
        "env_cfg_entry_point": f"{__name__}.stack_three_cubes_uni_env_cfg:OpenArmStackThreeCubesEnvCfg",
        "rl_games_cfg_entry_point": f"{agents.__name__}:rl_games_ppo_uni_cfg.yaml",
    },
)

gym.register(
    id="Isaac-StackThreeCubes-OpenArm-Uni-Play-v0",
    entry_point="isaaclab.envs:ManagerBasedRLEnv",
    disable_env_checker=True,
    kwargs={
        "env_cfg_entry_point": f"{__name__}.stack_three_cubes_uni_env_cfg:OpenArmStackThreeCubesEnvCfg_PLAY",
        "rl_games_cfg_entry_point": f"{agents.__name__}:rl_games_ppo_uni_cfg.yaml",
    },
)

gym.register(
    id="Isaac-StackThreeCubes-OpenArm-Bi-v0",
    entry_point="isaaclab.envs:ManagerBasedRLEnv",
    disable_env_checker=True,
    kwargs={
        "env_cfg_entry_point": f"{__name__}.stack_three_cubes_bi_env_cfg:OpenArmStackThreeCubesEnvCfg",
        "rl_games_cfg_entry_point": f"{agents.__name__}:rl_games_ppo_bi_cfg.yaml",
    },
)

gym.register(
    id="Isaac-StackThreeCubes-OpenArm-Bi-Play-v0",
    entry_point="isaaclab.envs:ManagerBasedRLEnv",
    disable_env_checker=True,
    kwargs={
        "env_cfg_entry_point": f"{__name__}.stack_three_cubes_bi_env_cfg:OpenArmStackThreeCubesEnvCfg_PLAY",
        "rl_games_cfg_entry_point": f"{agents.__name__}:rl_games_ppo_bi_cfg.yaml",
    },
)