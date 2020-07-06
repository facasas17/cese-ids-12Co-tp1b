SRC_DIR = ./src
INC_DIR = ./inc
OBJ_DIR = ./build/obj
BIN_DIR = ./build
DOC_DIR = ./build/doc

SRC_FILES = $(wildcard $(SRC_DIR)/*.c)
OBJ_FILES = $(patsubst $(SRC_DIR)%.c,$(OBJ_DIR)%.o,$(SRC_FILES))

all: build_folders $(OBJ_FILES)
	@echo Building aplication
	@gcc $(OBJ_FILES) -o $(BIN_DIR)/app.out

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@echo Compiling source file $(notdir $(basename $<))
	@gcc -c $< -I$(INC_DIR) -o $@

doxygen: doxyfile build_folders
	@echo Building Doxygen Documentation
	@doxygen doxyfile

###############################################################################
# Creation of output folders
build_folders: $(BIN_DIR) $(LIB_DIR) $(OBJ_DIR) $(DOC_DIR) $(DPN_DIR) $(RST_DIR) $(DOC_DIR)

$(OUT_DIR):
	@echo Creating output root folder
	@mkdir $(OUT_DIR)

$(BIN_DIR): $(OUT_DIR)
	@echo Creating output binaries folder
	@mkdir $(BIN_DIR)

$(OBJ_DIR): $(OUT_DIR)
	@echo Creating output objects folder
	@mkdir $(OBJ_DIR)

$(DOC_DIR):
	@echo Creating documentacion folder
	@mkdir $(DOC_DIR)
