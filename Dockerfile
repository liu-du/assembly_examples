FROM gcc:latest

RUN apt-get update && apt-get install nasm

CMD [ "bash" ]