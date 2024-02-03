
CC = gcc
CFLAGS = -Wall -Wextra -Ofast
LIBSDIR =
LIBS = -lm

EXE = cgmlst-dists
EXE_Q = cgmlst-dists-query
PREFIX = /usr/local
TESTDIR = test

.PHONY: all check clean
.DEFAULT: all

all: $(EXE) $(EXE_Q)

$(EXE): main.c
	$(CC) $(CFLAGS) -o $(EXE) $< $(LIBSDIR) $(LIBS)
    
$(EXE_Q): main_query.c
	$(CC) $(CFLAGS) -o $(EXE_Q) $< $(LIBSDIR) $(LIBS)

install: $(EXE) $(EXE_Q)
	install -v -t $(PREFIX)/bin $(EXE) $(EXE_Q)

clean:
	$(RM) *~ *.o $(EXE) $(EXE_Q)

check: $(EXE) $(EXE_Q)
	./$(EXE) -v
	./$(EXE) -q $(TESTDIR)/chewie.tab
	./$(EXE) -c $(TESTDIR)/boring.tab
	./$(EXE) -m 1 $(TESTDIR)/100.tab > /dev/null
	./$(EXE_Q) -c $(TESTDIR)/boring.tab $(TESTDIR)/query.tab
	
	
	
