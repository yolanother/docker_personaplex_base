FROM runpod/pytorch:2.4.0-py3.11-cuda12.4.1-devel-ubuntu22.04

# Install system dependencies
RUN apt update && apt install -y \
    libopus-dev \
  && rm -rf /var/lib/apt/lists/*

# Clone personaplex repository
WORKDIR /app
RUN git clone https://github.com/NVIDIA/personaplex

# Install moshi
WORKDIR /app/personaplex
RUN pip install moshi/. --root-user-action=ignore

# Install PyTorch with CUDA support
RUN pip install torch torchvision torchaudio \
    --index-url https://download.pytorch.org/whl/cu130 \
    --root-user-action=ignore

# Expose the server port
EXPOSE 8998


# HF_TOKEN should be passed as environment variable at runtime
ENV HF_TOKEN=""

# Copy and set up entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN mkdir -p /etc/ssh/sshd_config.d
COPY sshd_config_personaplex.conf /etc/ssh/sshd_config.d/99-personaplex.conf
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
