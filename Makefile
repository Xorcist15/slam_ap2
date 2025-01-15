# Compiler and flags
CXX = g++
CXXFLAGS = -Wall -g `wx-config --cxxflags`  # Include wxWidgets compile flags
LDFLAGS = `wx-config --libs`  # Include wxWidgets link flags

# Directories
SRC_DIR = src
OBJ_DIR = build
BIN_DIR = bin

# Target executable
TARGET = $(BIN_DIR)/prog

# Source files and object files
SRC_FILES = $(wildcard $(SRC_DIR)/*.cpp)
OBJ_FILES = $(patsubst $(SRC_DIR)/%.cpp, $(OBJ_DIR)/%.o, $(SRC_FILES))

# Default target
all: $(TARGET)

# Link object files to create the executable
$(TARGET): $(OBJ_FILES) | $(BIN_DIR)
	$(CXX) $(OBJ_FILES) $(LDFLAGS) -o $@  # Link with wxWidgets libraries

# Compile source files into object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Create necessary directories if they don't exist
$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

# Clean build files
clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)

# Phony targets
.PHONY: all clean
