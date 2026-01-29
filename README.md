# docker_personaplex_base

Docker image for running [NVIDIA Personaplex](https://github.com/NVIDIA/personaplex) with the Moshi server.

## Quick Start

### Using Docker Hub

```bash
docker run --gpus all -p 8998:8998 -e HF_TOKEN=your_token yolan/personaplex:latest
```

### Using Docker Compose

1. Clone this repository:
   ```bash
   git clone https://github.com/yolanother/docker_personaplex_base.git
   cd docker_personaplex_base
   ```

2. Create a `.env` file with your HuggingFace token:
   ```bash
   cp .env.example .env
   # Edit .env and add your HF_TOKEN
   ```

3. Run with Docker Compose:
   ```bash
   docker compose up
   ```

### Building Locally

```bash
docker build -t personaplex .
docker run --gpus all -p 8998:8998 -e HF_TOKEN=your_token personaplex
```

## Configuration

| Environment Variable | Description | Required |
|---------------------|-------------|----------|
| `HF_TOKEN` | HuggingFace API token | Yes |

## Ports

| Port | Description |
|------|-------------|
| 8998 | Moshi server (SSL) |

## Base Image

Built on `runpod/pytorch:2.4.0-py3.11-cuda12.4.1-devel-ubuntu22.04`

## License

MIT License - see [LICENSE](LICENSE) for details.
