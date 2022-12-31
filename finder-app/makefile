TARGET = writer

SOURCES = writer.c

CFLAGS = -Wall -Wextra
LDFLAGS = -lm

all: $(TARGET)

$(TARGET): $(SOURCES)
ifdef CROSS_COMPILE
	$(CROSS_COMPILE)gcc $(CFLAGS) -o $(TARGET) $(SOURCES) $(LDFLAGS)
else
	gcc $(CFLAGS) -o $(TARGET) $(SOURCES) $(LDFLAGS)
endif

clean:
	rm -f $(TARGET)
	rm -f *.o
