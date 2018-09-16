rm -rf ./build

arduino                     \
  --verify                  \
  --pref build.path=./build \
  --board esp8266:esp8266:nodemcuv2:CpuFrequency=80,VTable=flash,FlashSize=4M1M,LwIPVariant=v2mss536,Debug=Disabled \
  badgy.ino 

cp build/*.bin . 
