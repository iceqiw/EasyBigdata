#!/bin/bash

beeline -u 'jdbc:hive2://localhost:10000' -n hive -f test.sql
