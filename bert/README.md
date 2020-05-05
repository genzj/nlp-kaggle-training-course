1. 安装Tensorflow 1.x。
2. 从Bert仓库 https://github.com/google-research/bert 下载一个预训练模型。一般GPU推荐从`uncased_L-8_H-512_A-8`开始尝试，太大模型可能出现`Out of Memory (OOM)`问题。
3. 解压模型后，修改`start.cmd`内的`PRETRAINED`指向模型路径。
4. 运行`start.cmd`脚本。