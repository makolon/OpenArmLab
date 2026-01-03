# OpenArmLab

## 開発環境 (pixi)
- Pixi 本体をインストール: `curl -fsSL https://pixi.sh/install.sh | bash`（`~/.pixi/bin` が PATH に含まれている必要があります）
- 依存関係を解決: `pixi install`（開発用は `pixi install -f dev`）
- シェルに入る: `pixi shell`
- サンプルを動かす: `pixi run python scripts/01_create_env.py --help`

`pixi install` で `pixi.lock` が生成されるので、再現性のためにコミットしてください。既存の uv 環境を使っている場合は `.venv` や `.uv-cache` などを削除してから pixi 環境を作り直すとクリーンです。
