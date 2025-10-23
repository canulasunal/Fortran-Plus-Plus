import platform
import shutil
import os

osx = platform.system()

if osx == "Windows":
    os.system("windres build.rc -O coff -o build.res")
    shutil.move("build.res", "compiler")
    os.chdir("compiler")
    os.system('nim c -d:release --passL:"build.res" fpp.nim')
    os.remove("build.res")
    shutil.move("fpp.exe", "..")
    os.chdir("..")
    os.mkdir("bin")
    shutil.move("fpp.exe", "bin")