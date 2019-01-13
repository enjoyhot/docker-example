# 构建当前Docker镜像

# 构建一个基于 Python 2.7.15 的镜像
FROM python:2.7.15

# 把当前目录添加到镜像中的 /code 路径下
ADD . /code

# 把工作路径设置成 /code
WORKDIR /code

# 安装项目的 Python 依赖
RUN pip install -r requirements.txt

# 设置容器的默认命令为 python app.py
CMD ["python", "app.py"]
