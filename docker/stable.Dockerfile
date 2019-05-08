FROM ubuntu:18.04

RUN mkdir /app

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
        wget \
        unzip \
        curl \
        ca-certificates \
        default-jre \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN url=$(content=$(curl -L https://www.cs.waikato.ac.nz/ml/weka/downloading.html) &&  echo $content | \
 grep -Po 'Stable version.*?\(Linux, etc.\).*?href="\K.*?\.zip(?=")') && \
 wget $url && \
 unzip weka-*.zip && \
 rm -f weka-*.zip && \
 mv weka-* weka

CMD ["java","-jar","weka/weka.jar"]
