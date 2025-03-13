#!/bin/bash

# Provjera je li zadano ime projekta
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <ProjectName>"
    exit 1
fi

PROJECT_NAME=$1

# Kreiranje direktorija projekta
mkdir -p $PROJECT_NAME/{src,include,lib,bin,build}

# Kreiranje osnovne CMakeLists.txt datoteke
cat > $PROJECT_NAME/CMakeLists.txt <<EOL
cmake_minimum_required(VERSION 3.10)
project($PROJECT_NAME)
set(CMAKE_CXX_STANDARD 17)

add_executable(\${PROJECT_NAME} src/main.cpp)
include_directories(include)
EOL

# Kreiranje osnovne main.cpp datoteke
cat > $PROJECT_NAME/src/main.cpp <<EOL
#include <iostream>

int main() {
    std::cout << "Hello, CMake!" << std::endl;
    return 0;
}
EOL

# Kreiranje .gitignore datoteke
cat > $PROJECT_NAME/.gitignore <<EOL
/build/
CMakeCache.txt
CMakeFiles/
*.o
*.exe
*.out
EOL

echo "CMake C++ projekt '$PROJECT_NAME' je uspješno kreiran."
