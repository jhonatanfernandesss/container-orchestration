#!/bin/bash

function_print_banner() {
  printf "\n\n.........\n\n\n\n====||$1||======\n\n";
}

function_docker-php-ext-install() {
  for ext in "$@"; do
      function_print_banner "INSTALL php extension: $ext"
      docker-php-ext-install $ext >> /tmp/docker-php-ext-install.log;
  done
}

function_docker-php-ext-configure() {
  for ext in "$@"; do
      function_print_banner "CONFIGURE php extension: $ext"
      docker-php-ext-configure $ext >> /tmp/docker-php-ext-install.log;
  done
}

function_end_build() {
  function_print_banner "Clear docker php source";
  rm -rf /tmp/*
  docker-php-source delete;
}