# -*- mode: YAML; -*-

class: Workflow
cwlVersion: v1.0

inputs:
  sequence_file: File

outputs: []

steps:
  makeblastdb:
    run:
      class: CommandLineTool
      baseCommand: ["makeblastdb", "-in", "reference.fasta", "-title", "reference", "-dbtype", "nucl", "-out", "databases/reference"]
      hints:
        DockerRequirement:
          dockerImageId: "/home/jaket/bee/img/blast.tar.gz"
      inputs:
        sequence_file:
          type: string
      outputs:
        db_dir:
          type: string
    in:
      sequence_file: sequence_file
    out: [db_dir]

  worker0:
    run:
      class: CommandLineTool
      baseCommand: ["blastn", "-db", "databases/reference", "-query", "sequences.fasta", "-evalue", "1e-3", "-word_size", "11", "-outfmt", "0", ">", "sequences.reference"]
      hints:
        DockerRequirement:
          dockerImageId: "/home/jaket/bee/img/blast.tar.gz"
      inputs:
        db_dir:
          type: string
      outputs:
        worker0_out:
          type: string
    in:
      db_dir: makeblastdb/db_dir
    out: [worker0_out]
