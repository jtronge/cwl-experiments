#!/usr/bin/env cwl-runner

cwlVersion: v1.1
class: CommandLineTool
baseCommand:
  - ch-run
  - -w
  - --cd
  - /tmp
  - --no-home
  #- laristra.flecsale.ubuntu_mpi_master
  #- --
  #- /home/flecsi/flecsale/build/apps/hydro/3d/hydro_3d
  #- -m
  #- /home/flecsi/flecsale/build/apps/hydro/3d/shock_box_3d_rank000001.000200.exo
$namespaces:
  cwltool: "http://commonwl.org/cwltool#"
requirements:
  # See mpi.yml for options
  cwltool:MPIRequirement:
    processes: $(inputs.nproc)
inputs:
  nproc:
    type: int
  container_dir:
    type: Directory
    inputBinding:
      prefix: --
      position: 1
  # The binary `/home/flecsi/flecsale/build/apps/hydro/3d/hydro_3d`
  binary:
    type: string
    inputBinding:
      position: 2
  mesh:
    type: string
    inputBinding:
      position: 3
      prefix: -m
outputs: []
