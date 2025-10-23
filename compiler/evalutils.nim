import strutils

proc evaluate*(content: string): float =

    proc simple_eval(content: string): float =

        var operations: seq[string] = @["+", "-", "*", "/"]
        var document = content.strip().replace(" ", "")

        for item in operations:
            document = document.replace(item, " "&item&" ")

        var contentx = document.split()

        var base = parseFloat(contentx[0])

        for x in 1..len(contentx)-1:
            if contentx[x] == "+":
                base += parseFloat(contentx[x+1])

            elif contentx[x] == "-":
                base -= parseFloat(contentx[x+1])

            elif contentx[x] == "*":
                base = base * parseFloat(contentx[x+1])

            elif contentx[x] == "/":
                base = base / parseFloat(contentx[x+1])

        return base

    var document = content.strip().replace(" ", "")
    var operations: seq[string] = @["+", "-", "*", "/"]

    for item in operations:
        document = document.replace(item, " "&item&" ")

    var contentx = document.split("+")
    
    var basex = contentx[0].split("-")
    var basey = simple_eval(basex[0])

    for x in 1..len(basex)-1:
        basey -= simple_eval(basex[x])
    
    for x in 1..len(contentx)-1:
        var subbase = simple_eval(contentx[x].split("-")[0])

        for y in 1..len(contentx[x].split("-"))-1:
            subbase -= simple_eval(contentx[x].split("-")[y])
        
        basey += subbase
    
    return basey