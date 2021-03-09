#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
inputs:
  link: string
  fname: string
  binary: string

outputs:
  binary:
    type: File
    outputSource: compile/bin

steps:
  download:
    run: download.cwl
    in:
      link: link
      fname: fname
    out: [downloaded_file]

  compile:
    run: compile.cwl
    in:
      c_file: download/downloaded_file
      binary: binary
    out: [bin]
