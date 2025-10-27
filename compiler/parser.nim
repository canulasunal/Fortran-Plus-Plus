import strutils

proc parse*(content: string): string =
    var document = content.split("\n")
    var compiled: seq[string] = @[]
    var function = 0

    for item in document:
        var line = item.strip()

        if line.startsWith("function "):
            function = 1
        if line.startsWith("subroutine "):
            function = 1
        
        if function == 1:
            compiled.add("#compiler#tag#infunction# " & line)
        else:
            compiled.add(line)

        if line.startsWith("end function "):
            function = 0
        
        if line.startsWith("end subroutine "):
            function = 0

    return compiled.join("\n")