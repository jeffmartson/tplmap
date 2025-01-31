FROM ruby:2.7.6

RUN gem install slim tilt cuba rack
RUN apt-get update && apt-get install --upgrade dnsutils python-pip -y
RUN pip install requests PyYAML

COPY  . /apps/
WORKDIR /apps/tests/

EXPOSE 15005

CMD cd env_ruby_tests && rackup --host 0.0.0.0 --port 15005
