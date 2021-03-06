#
# Makefile
#
# Compiles the 
# -dynamiclib
# -Wally

CC=g++
LDFLAGS= -fPIC -bundle
CFLAGS= -c -shared -I/System/Library/Frameworks/JavaVM.framework/Versions/Current/Headers -m64


SOURCES_DIR=src/main/c++
OBJECTS_DIR=target/c++
EXECUTABLE=target/classes/libxattrj.dylib

SOURCES=$(shell find '$(SOURCES_DIR)' -type f -name '*.cpp')
OBJECTS=$(SOURCES:$(SOURCES_DIR)/%.cpp=$(OBJECTS_DIR)/%.o)

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

$(OBJECTS): $(SOURCES)
	mkdir -p $(OBJECTS_DIR)
	$(CC) $(CFLAGS) $< -o $@
	
	

clean:
	rm -rf $(OBJECTS_DIR) $(EXECUTABLE)
