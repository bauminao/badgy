SRCFILE     = badgy.ino
BINARY      = badgy.bin

BUILDDIR    = './build'
BOARDCONFIG = 'esp8266:esp8266:nodemcuv2:CpuFrequency=80,VTable=flash,FlashSize=4M1M,LwIPVariant=v2mss536,Debug=Disabled '


.PHONY: all clean build install

all: build install cleanbuild

clean: 
	rm -rf ${BUILDDIR}
	rm -rf ${BINARY}

build: clean 
	arduino --verify \
		-v \
		--pref build.path=${BUILDDIR} \
		--board ${BOARDCONFIG} \
		${SRCFILE}

install:
	rm -rf ${BINARY}
	cp ${BUILDDIR}/*.bin ${BINARY}

cleanbuild:
	rm -rf ${BUILDDIR}
