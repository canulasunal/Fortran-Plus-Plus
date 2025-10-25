import strutils
import os

import version
import parser
import compiler

proc main() =

    if paramCount() < 1:
        quit()

    var command = paramStr(1)

    if command == "--version" or command == "-V":
        echo "Fortran++ Compiler Version " & version.version()
        echo "Copyright (C) 2025 canulasunal"
        echo "------------------------------"

    else:
        if paramStr(1).endsWith(".fpp"):
            var document = readFile(command)
            document = parse(document)
            var toremove: seq[string] = @[]

            for item in document.split("\n"):
                if item.startsWith("use "):
                    toremove.add(item.replace("use ", "").strip()&".mod")

            writeFile(paramStr(1).replace(".fpp", ".f90"), compile(document))

            discard execShellCmd("gfortran " & paramStr(1).replace(".fpp", ".f90") & " -o " & paramStr(1).replace(".fpp", ""))
            removeFile(paramStr(1).replace(".fpp", ".f90"))

            for item in toremove:
                removeFile(item)
        else:
            echo "Fatal error: Invalid file extension."

main()