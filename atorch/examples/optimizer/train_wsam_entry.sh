#!/bin/bash
export CUDA_VISIBLE_DEVICES=0

DATASET=cifar10
MODEL=resnet18
BATCH_SIZE=128
EPOCHS=200
SCHEDULER=cosine
BASE_OPTIMIZER=sgd
LR=0.1
WEIGHT_DECAY=5e-4

python main.py --use-gpu \
    --dataset $DATASET \
    --model $MODEL \
    --batch-size $BATCH_SIZE \
    --epochs $EPOCHS \
    --scheduler $SCHEDULER \
    --base_optimizer $BASE_OPTIMIZER \
    --lr $LR \
    --weight-decay $WEIGHT_DECAY \
    --optimizer wsam \
    --mode decouple \
    --rho 0.2 \
    --gamma 0.9 \
    2>&1 | tee log_wsam.txt 