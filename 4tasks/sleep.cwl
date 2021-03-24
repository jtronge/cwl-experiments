# -*- mode: YAML; -*-

class: Workflow
cwlVersion: v1.0

inputs:
  task1_in: File

outputs:
  task4_out:
    type: File
    outputSource: task4/outfile

steps:
  task1:
    run:
      class: CommandLineTool
      baseCommand: ["sleep", "4"]
      hints: {}
      inputs:
        infile:
          type: File
      outputs:
        outfile:
          type: stdout
    in:
      infile: task1_in
    out: [outfile]

  # TODO: Replace these commands with more complicated ones
  task2:
    run:
      class: CommandLineTool
      baseCommand: ["sleep", "10"]
      hints: {}
      inputs:
        infile:
          type: File
      outputs:
        outfile:
          type: stdout
    in:
      infile: task1/outfile
    out: [outfile]

  task3:
    run:
      class: CommandLineTool
      baseCommand: ["sleep", "20"]
      hints: {}
      inputs:
        infile:
          type: File
      outputs:
        outfile:
          type: stdout
    in:
      infile: task1/outfile
    out: [outfile]

  task4:
    run:
      class: CommandLineTool
      baseCommand: ["sleep", "30"]
      hints: {}
      inputs:
        infile1:
          type: File
      outputs:
        outfile:
          type: stdout
    in:
      infile1: task2/outfile
      infile2: task3/outfile
    out: [outfile]
