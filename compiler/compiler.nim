import strutils

import evalutils

const os_module = staticRead("../modules/os.f90")
const math_module = staticRead("../modules/math.f90")
const strutils_module = staticRead("../modules/strutils.f90")

proc compile*(content: string): string =
    var document = content.split("\n")

    var compiled: seq[string] = @[]
    var functions: seq[string] = @[]

    var stdlib_modules: seq[string] = @[]

    for item in document:
        if item == "use os":
            for x in os_module.split("\n"):
                compiled.add(x)

        elif item == "use strutils":
            for x in strutils_module.split("\n"):
                compiled.add(x)

        elif item == "use math":
            for x in math_module.split("\n"):
                compiled.add(x)

    compiled.add("program main")

    for item in document:
        if item.startsWith("use "):
            compiled.add(item)

    compiled.add("implicit none")

    for line in document:

        var item = line

        if item.startsWith("print *, "):
            item = item.replace("print *, ", "write(*, '(A)') ")

            try:
                var itemz = item.split("write(*, '(A)') ")[len(item.split("write(*, '(A)') "))-1].strip()
                var itemans = $(evaluate(itemz))

                if itemans.endsWith(".0"):
                    itemans = itemans.replace(".0", "")

                item = item.replace(itemz, itemans)
            except:
                discard 1
        
        ### End formatting

        if item.startsWith("#compiler#tag#infunction# "):
            functions.add(item.replace("#compiler#tag#infunction# ", ""))

        elif item.startsWith("use "):
            if item.replace("use ", "").strip() in stdlib_modules:
                discard 1
            else:
                compiled.add(item)
        
        else:
            try:
                var ritem = $(evaluate(item.split("=")[len(item.split("="))-1].strip()))
                
                if ritem.endsWith(".0"):
                    ritem = ritem.replace(".0", "")

                compiled.add(item.replace(item.split("=")[len(item.split("="))-1].strip(), ritem))

            except:
                compiled.add(item)
    
    compiled.add("contains")

    for item in functions:
        compiled.add(item)
        
    compiled.add("end program main")
    
    return compiled.join("\n")