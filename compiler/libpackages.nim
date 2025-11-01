import httpclient
import strutils
import os

const index = staticRead("data/packageindex.txt")

proc install*(namex: string) =
    for item in index.split("\n"):
        var entry = item.split("|")
        var name = entry[0]
        var link = entry[1]
        var filename = entry[2]

        if namex == name:
            var destination = getHomeDir()&".fpp/packages"

            if not existsDir(destination):
                createDir(destination)

            setCurrentDir(destination)
    
            let client = newhttpClient()
            let content = client.getContent(link)

            writeFile(filename, content)

            quit()
        
    echo "Error: Package " & namex & " not found."

proc load*(namex: string) =
    for item in index.split("\n"):
        var entry = item.split("|")
        var name = entry[0]
        var link = entry[1]
        var filename = entry[2]

        if namex == name:
            var destination = getHomeDir()&".fpp/packages/"&filename
            copyFile(destination, filename)
            quit()

    echo "Error: Package " & namex & " not found."