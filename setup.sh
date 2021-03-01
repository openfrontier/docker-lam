#!/bin/bash
set -e

LAM_CONF_PATH=/var/lib/ldap-account-manager/config

if [ -z "$(ls -A ${LAM_CONF_PATH})" ]; then
  cp -r /var/lib/${LAM_PACKAGE}/config/. "${LAM_CONF_PATH}"
  cp "${LAM_CONF_PATH}/config.cfg.sample" "${LAM_CONF_PATH}/config.cfg"
  cp "${LAM_CONF_PATH}/addressbook.conf.sample" "${LAM_CONF_PATH}/lam.conf"
  chown -R www-data:www-data "${LAM_CONF_PATH}"
fi
