import strutils

proc compile*(content: string): string =
    var document = content.split("\n")

    var compiled: seq[string] = @[]
    var functions: seq[string] = @[]

    compiled.add("program main")
    compiled.add("implicit none")

    for item in document:
        if item.startsWith("#compiler#tag#infunction# "):
            functions.add(item.replace("#compiler#tag#infunction# ", ""))
        else:
            compiled.add(item)
    
    compiled.add("contains")

    for item in functions:
        compiled.add(item)
        
    compiled.add("end program main")
    
    return compiled.join("\n")