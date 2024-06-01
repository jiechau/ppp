FROM python:3.9.6

ENV TZ="Asia/Taipei"
RUN date

RUN echo ${ARCH} > /app/os-release

WORKDIR /app
#COPY ./requirements.txt /app/requirements.txt
#RUN pip install --upgrade pip
#RUN pip install -r requirements.txt
ARG ARCH
COPY oracle_tools_${ARCH}/ /app/oracle_tools/
#COPY oracle_tools_amd64/ /app/oracle_tools/
#COPY oracle_tools_arm64/ /app/oracle_tools/

ENV ORACLE_HOME=/app/oracle_tools/instantclient
ENV TNS_ADMIN=/app/oracle_tools/instantclient
ENV LD_LIBRARY_PATH=/app/oracle_tools/instantclient:$LD_LIBRARY_PATH

CMD ["/bin/bash"]
