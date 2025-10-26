import platform
import shutil
import os

print("This project requires the following dependencies to compile:")
print("General dependencies")
print("--------------------")
print("gfortran, nim (version 2.x.x)")
print("Microsoft Windows Specific Dependencies")
print("---------------------------------------")
print("msys2, mingw64 (via msys2)")
print("")
input("Enter to continue ")

osx = platform.system()

if osx == "Windows":
    os.system("windres build.rc -O coff -o build.res")
    shutil.move("build.res", "compiler")
    os.chdir("compiler")
    os.system('nim c -d:release --passL:"build.res" fppc.nim')
    os.remove("build.res")
    shutil.move("fppc.exe", "..")
    os.chdir("..")
    os.mkdir("bin")
    shutil.move("fppc.exe", "bin")

if osx == "Linux" or osx == "Darwin":
    os.chdir("compiler")
    os.system("nim c fppc.nim")
    shutil.move("fppc", "..")
    os.chdir("..")
    os.mkdir("bin")
    shutil.move("fppc", "bin")

else:
    print("Your operating system is not supported in the compile script.")
    choice = input("Try unix installation? [Y/n] ")

    if choice.lower().strip() == "y":
        os.chdir("compiler")
        os.system("nim c fppc.nim")
        shutil.move("fppc", "..")
        os.chdir("..")
        os.mkdir("bin")
        shutil.move("fppc", "bin")
    else:
        exit()