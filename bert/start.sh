#!/bin/bash
python -c "import tensorflow as tf; print(tf.test.is_gpu_available())"
sleep 2
PRETRAINED=../uncased_L-8_H-512_A-8
cd ~/proj/bert/bert
python run_classifier.py \
    --bert_config_file=$PRETRAINED/bert_config.json \
    --data_dir=../input \
    --do_train --do_eval --do_predict --do_lower_case \
    --init_checkpoint=$PRETRAINED/bert_model.ckpt \
    --learning_rate=3e-5 \
    --max_seq_length=128 \
    --optimizer=adamw \
    --output_dir=../output_8_512 \
    --save_checkpoints_steps=100 \
    --task_name=spooky \
    --train_batch_size=64 \
    --vocab_file=$PRETRAINED/vocab.txt