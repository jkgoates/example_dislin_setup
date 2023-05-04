# make for Fortran Streamlines

# Deactivate implicit rules
.SUFFIXES:

# Directories
SRC_DIR = src
COM_DIR = common
BIN_DIR = bin

# List common files (ordered based on dependency)
COMMON_FILES = dislin.f90
COMMON_PATHS = $(addprefix $(COM_DIR)/, $(COMMON_FILES))

# List source files (ordered based on dependency)
SRC_FILES = plot.f90 
SRC_PATHS = $(addprefix $(SRC_DIR)/, $(SRC_FILES))

# Main
MAIN_PATH = src/main.f90

# Compiler
COMPILER = gfortran

# Flags
DEBUG_FLAGS = -fbounds-check -fbacktrace -g
DISLIN_FLAGS = -luser32 -lgdi32 -lopengl32

# DISLIN Command 
DISLIN_PATH = .\lib\dislin\dismg.a

# Program name
PROGRAM = main.exe

# Default make
default:
	$(COMPILER) $(FLAGS) -o $(PROGRAM) $(COMMON_PATHS) $(SRC_PATHS) $(MAIN_PATH) $(DISLIN_PATH) $(DISLIN_FLAGS)

# Debug option
debug:
	$(COMPILER) $(FLAGS) $(DEBUG_FLAGS) -o $(PROGRAM) $(COMMON_PATHS) $(SRC_PATHS) $(MAIN_PATH) $(DISLIN_PATH) $(DISLIN_FLAGS)

# Debug with all warnings
wall:
	$(COMPILER) $(FLAGS) $(DEBUG_FLAGS) -Wall -o $(PROGRAM) $(COMMON_PATHS) $(SRC_PATHS) $(MAIN_PATH) $(DISLIN_PATH) $(DISLIN_FLAGS)

# Debug with all warnings
debug-serial:
	$(COMPILER) $(FLAGS) $(DEBUG_FLAGS) -o $(PROGRAM) $(COMMON_PATHS) $(SRC_PATHS) $(MAIN_PATH) $(DISLIN_PATH) $(DISLIN_FLAGS)

# Serial compilation (without OpenMP)
serial:
	$(COMPILER) $(FLAGS) -o $(PROGRAM) $(COMMON_PATHS) $(SRC_PATHS) $(MAIN_PATH) $(DISLIN_PATH) $(DISLIN_FLAGS)

# Cleanup
clean:
	rm -rf *.mod *.exe $(SRC_DIR)/*.mod $(COM_DIR)/*.mod