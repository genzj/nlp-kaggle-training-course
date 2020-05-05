pushd %~dp0
set script_dir=%CD%
cd "%script_dir%"

python -c "import tensorflow as tf; print(tf.test.is_gpu_available())"
ping -n 3 127.0.0.1 >NUL

cd bert

set PRETRAINED=../uncased_L-8_H-512_A-8
python run_classifier.py ^
	--bert_config_file=%PRETRAINED%/bert_config.json ^
	--data_dir=../../input ^
	--output_dir=../output_8_512 ^
	--do_train --do_eval --do_predict --do_lower_case ^
	--init_checkpooint=%PRETRAINED%/bert_model.ckpt ^
	--learning_rate=3e-5 ^
	--max_seq_length=128 ^
	--optimizer=adamw ^
	--save_checkpoints_steps=100 ^
	--task_name=spooky ^
	--train_batch_size=50 ^
	--vocab_file=%PRETRAINED%/vocab.txt
