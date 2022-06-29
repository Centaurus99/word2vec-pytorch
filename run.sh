#!/bin/bash

echo "train_batch_size learning_rate val_loss" > summary.txt

for train_batch_size in 32 64 128
do
    for learning_rate in 0.015 0.025 0.035
    do
        model_dir=run/cbow_WikiText2_"$train_batch_size"_"$learning_rate"
        python3 train.py --config config.yaml --model_name cbow --train_batch_size $train_batch_size --learning_rate $learning_rate --model_dir $model_dir
        cat $model_dir/result.txt >> summary.txt
    done
done