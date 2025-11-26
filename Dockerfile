FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

COPY conda-linux-64.lock /home/jovyan/

RUN conda install --file conda-linux-64.lock

RUN mkdir -p /home/jovyan/.jupyter && \
    echo "c.ServerApp.token = ''" > /home/jovyan/.jupyter/jupyter_server_config.py && \
    echo "c.ServerApp.password = ''" >> /home/jovyan/.jupyter/jupyter_server_config.py

CMD ["jupyter", "server", "--ip=0.0.0.0", "--no-browser"]