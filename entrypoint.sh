#!/bin/bash

service mysql restart
service apache2 restart
zenbu_agent_launcher.sh &

