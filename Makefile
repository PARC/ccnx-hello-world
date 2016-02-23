EXECUTABLES = helloWorld_Consumer helloWorld_ConsumerForever helloWorld_Producer

all: ${EXECUTABLES}

# The user should set CCNX_HOME and LIBEVENT_HOME to point to the right
# locations
# CCNX_HOME, location where the ccnx software is installed
CCNX_HOME ?= /usr/local/ccnx

# LIBEVENT_HOME, location where Libevent is installed (if custom installed,
# like on MAC)
LIBEVENT_HOME ?= /usr

INCLUDE_DIR_FLAGS=-I. -I${CCNX_HOME}/include
LINK_DIR_FLAGS=-L${CCNX_HOME}/lib
CCNX_LIB_FLAGS=-lccnx_api_portal -lccnx_api_notify -lccnx_transport_rta -lccnx_api_control -lccnx_common
PARC_LIB_FLAGS=-lparc -llongbow -llongbow-ansiterm
DEP_LIB_FLAGS=-lcrypto -lm -L${LIBEVENT_HOME}/lib -levent

CFLAGS=${INCLUDE_DIR_FLAGS} ${LINK_DIR_FLAGS} ${CCNX_LIB_FLAGS} ${PARC_LIB_FLAGS} ${DEP_LIB_FLAGS} 

CC=gcc -O2 -std=c99

helloWorld_Consumer: helloWorld_Consumer.c config.h
	${CC} helloWorld_Consumer.c ${CFLAGS} -o helloWorld_Consumer 

helloWorld_ConsumerForever: helloWorld_ConsumerForever.c config.h
	${CC} helloWorld_ConsumerForever.c ${CFLAGS} -o helloWorld_ConsumerForever 

helloWorld_Producer: helloWorld_Producer.c config.h
	${CC} helloWorld_Producer.c ${CFLAGS} -o helloWorld_Producer 

clean:
	rm -rf ${EXECUTABLES}

install:
	@echo "HelloWorld doesn't have an install mode"

check:
	@echo "This module has no tests"
