#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: /home/flecsi/flecsale/build/apps/hydro/3d/hydro_3d
hints:
  DockerRequirement:
    dockerPull: laristra/flecsale:ubuntu_mpi_master
inputs:
  # Good mesh file from container: /home/flecsi/flecsale/build/apps/hydro/3d/shock_box_3d_rank000001.000200.exo
  mesh:
    # type: File
    # Note: If I set this to be a File then it tries to get the file from my
    # current environment. I want it to grab it from the container file system
    # itself.
    type: string
    inputBinding:
      prefix: -m
outputs:
  flecsale_output:
    type: stdout
stdout: flecsale-out.txt
