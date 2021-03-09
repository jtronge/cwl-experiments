#!/bin/sh

# This expects the Charliecloud container `laristra.flecsale.ubuntu_mpi_master`
# to be untared in the pwd.
cwltool --enable-ext --mpi-config-file mpi.yml \
	flecsale-charliecloud.cwl \
	--nproc 4 \
	--binary /home/flecsi/flecsale/build/apps/hydro/3d/hydro_3d \
	--mesh /home/flecsi/flecsale/build/apps/hydro/3d/shock_box_3d_rank000001.000200.exo \
	--container_dir laristra.flecsale.ubuntu_mpi_master/
