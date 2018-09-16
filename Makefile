SRCFILE     = badgy.ino
BINARY      = badgy.bin

BUILDDIR    = './build'
BOARDCONFIG = 'esp8266:esp8266:nodemcuv2:CpuFrequency=80,VTable=flash,FlashSize=4M1M,LwIPVariant=v2mss536,Debug=Disabled '


.PHONY: all

all: clean build install cleanbuild

clean: cleanbuild
	rm -rf ${BINARY}

build:
	arduino --verify \
		--pref build.path=${BUILDDIR} \
		--board ${BOARDCONFIG} \
		${SRCFILE}

install:
	cp ${BUILDDIR}/*.bin ${BINARY}

cleanbuild:
	rm -rf ${BUILDDIR}

