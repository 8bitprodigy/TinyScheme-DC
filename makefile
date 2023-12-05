TARGET = tinyscheme.elf
OBJS = scheme.o romdisk.o
KOS_ROMDISK_DIR = romdisk

KOS_CFLAGS += -std=c99 -pedantic -Wall

all: rm-elf $(TARGET)

include $(KOS_BASE)/Makefile.rules

clean: rm-elf
	-rm -f $(OBJS)

rm-elf:
	-rm -f $(TARGET)

$(TARGET): $(OBJS)
	kos-cc -o $(TARGET) $(OBJS) -lm

run: $(TARGET)
	$(KOS_LOADER) $(TARGET)

dist: $(TARGET)
	-rm -f $(OBJS)
	$(KOS_STRIP) $(TARGET)

scheme.o: scheme.c scheme.h scm_priv.h scm_opdf.h
	kos-cc $(KOS_CFLAGS) -c scheme.c

