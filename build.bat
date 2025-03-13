@echo off

:: Check if project name is provided
if "%~1"=="" (
    echo Usage: %~nx0 ^<ProjectName^>
    exit /b 1
)

set "PROJECT_NAME=%~1"

:: Create project directories
mkdir "%PROJECT_NAME%\src" "%PROJECT_NAME%\include" "%PROJECT_NAME%\lib" "%PROJECT_NAME%\bin" "%PROJECT_NAME%\build"

:: Create CMakeLists.txt
echo cmake_minimum_required(VERSION 3.10) > "%PROJECT_NAME%\CMakeLists.txt"
echo project(%PROJECT_NAME%) >> "%PROJECT_NAME%\CMakeLists.txt"
echo set(CMAKE_CXX_STANDARD 17) >> "%PROJECT_NAME%\CMakeLists.txt"
echo. >> "%PROJECT_NAME%\CMakeLists.txt"
echo add_executable(${PROJECT_NAME} src/main.cpp) >> "%PROJECT_NAME%\CMakeLists.txt"
echo include_directories(include) >> "%PROJECT_NAME%\CMakeLists.txt"

:: Create main.cpp
echo #include ^<iostream^> > "%PROJECT_NAME%\src\main.cpp"
echo. >> "%PROJECT_NAME%\src\main.cpp"
echo int main() { >> "%PROJECT_NAME%\src\main.cpp"
echo     std::cout "<<" "Hello, CMake!" "<<" std::endl; >> "%PROJECT_NAME%\src\main.cpp"
echo     return 0; >> "%PROJECT_NAME%\src\main.cpp"
echo } >> "%PROJECT_NAME%\src\main.cpp"

:: Create .gitignore
echo /build/ > "%PROJECT_NAME%\.gitignore"
echo CMakeCache.txt >> "%PROJECT_NAME%\.gitignore"
echo CMakeFiles/ >> "%PROJECT_NAME%\.gitignore"
echo *.o >> "%PROJECT_NAME%\.gitignore"
echo *.exe >> "%PROJECT_NAME%\.gitignore"
echo *.out >> "%PROJECT_NAME%\.gitignore"

echo CMake C++ project "%PROJECT_NAME%" has been successfully created.
