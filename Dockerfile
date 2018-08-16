FROM ubuntu
RUN apt-get update
RUN apt-get install -y apache2 jekyll curl > /dev/null
RUN mkdir ~/jekyll && jekyll new ~/jekyll --force
COPY ./ /root/
RUN cd ~/ && bash generate-markdown.sh
CMD cd ~/jekyll/ && jekyll serve -H 0.0.0.0 -P 4000 
