FROM ruby:2.3.0

RUN apt-get update -qq
RUN apt-get install locales
RUN echo 'ru_RU.UTF-8 UTF-8' >> /etc/locale.gen
RUN locale-gen ru_RU.UTF-8
RUN dpkg-reconfigure -fnoninteractive locales
ENV LC_ALL=ru_RU.utf8
ENV LANGUAGE=ru_RU.utf8
RUN update-locale LC_ALL="ru_RU.utf8" LANG="ru_RU.utf8" LANGUAGE="ru_RU"

RUN mkdir -p /apps/study
RUN mkdir -p /bundle_cache
ADD . /apps/study
WORKDIR /apps/study
RUN bundle install --jobs 4 --no-binstubs

CMD bash
