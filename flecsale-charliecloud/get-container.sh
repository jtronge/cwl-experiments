#!/bin/sh
# Get the Charliecloud container for this workflow
ch-builder2tar laristra/flecsale:ubuntu_mpi_master .
mv 'laristra%flecsale:ubuntu_mpi_master.tar.gz' laristra.flecsale.ubuntu_mpi_master.tar.gz
