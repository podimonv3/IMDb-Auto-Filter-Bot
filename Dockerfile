FROM python:3.8-slim-buster

# കണ്ടെയ്നറിലെ ടൈം-സോൺ ഏഷ്യ/കൊൽക്കത്ത (IST) ആക്കി മാറ്റുന്നു 👈
RUN apt-get update && \
    apt-get install -y tzdata && \
    ln -snf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime && \
    echo "Asia/Kolkata" > /etc/timezone && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

CMD python3 bot.py
