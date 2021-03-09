#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: [cc]
inputs:
  c_file:
    type: File
    inputBinding:
      position: 1
  binary:
    type: string
    inputBinding:
      prefix: -o
outputs:
  bin:
    type: File
    outputBinding:
      glob: $(inputs.binary)
