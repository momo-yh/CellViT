#!/bin/bash

# Run preprocessing script
python preprocessing/patch_extraction/main_extraction.py --config ./img/processing.yaml

# Download the model weights first, and run in docker
python ./cell_segmentation/inference/cell_detection.py \
  --model ./pretrain/CellViT-SAM-H-x40.pth \
  --gpu 0 \
  --geojson \
  --batch_size 1 \
  process_wsi \
  --wsi_path img/he_aligned.ome.tif/he.ome-registered.ome.tif \
  --patched_slide_path img/cellvit_output/he.ome-registered.ome