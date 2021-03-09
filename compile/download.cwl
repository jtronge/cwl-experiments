#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: [curl, -O, -L]
inputs:
  link:
    type: string
    inputBinding:
      position: 1
  fname:
    type: string
outputs:
  downloaded_file:
    type: File
    outputBinding:
      glob: $(inputs.fname)
