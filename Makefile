# Compiler and flags
CXX = g++
CXXFLAGS = -Wall -g

# Directories
SRC_DIR = src
OBJ_DIR = build
BIN_DIR = bin

# Target executable
TARGET = $(BIN_DIR)/prog

# Source files
SRC = $(wildcard $(SRC_DIR)/*.cpp)
OBJ = $(SRC:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)

# Create build and bin directories if they don't exist
$(OBJ_DIR) $(BIN_DIR):
	mkdir -p $(OBJ_DIR) $(BIN_DIR)

# Build rule for the target
$(TARGET): $(OBJ) | $(BIN_DIR)
	$(CXX) $(OBJ) -o $(TARGET)

# Rule for compiling .cpp files to .o files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean rule to remove generated files and directories
clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)
