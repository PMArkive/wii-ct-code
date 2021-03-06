.section .data
.globl _bad1Data
_bad1Data:

#Write Header
.int 0xBad1Da7a                 #tag
.int _bad1DataEnd - _bad1Data   #length
.int 0                          #version
#section count
.int 2 + ENABLE_CTS * 2 + ENABLE_SOM
.int 0                          #padding
.int 0                          #padding
.int 0                          #padding
.int 0                          #padding

#Write contents
.if ENABLE_CTS == 1
    .int _cup1Start-_bad1Data
    .ascii "CUP1"
    .int _crs1Start-_bad1Data
    .ascii "CRS1"
.endif

.int _mod1Start-_bad1Data
.ascii "MOD1"
.int _mod2Start-_bad1Data
.ascii "MOD2"

.if ENABLE_SOM == 1
    .int _ovr1Start-_bad1Data
    .ascii "OVR1"
.endif

.if ENABLE_CTS == 1
    .p2align 4
    _cup1Start:
    .incbin "cup1.bin"

    .p2align 4
    _crs1Start:
    .incbin "crs1.bin"
.endif

.p2align 4
_mod1Start:
.incbin "mod1.bin"

.p2align 4
_mod2Start:
.incbin "mod2.bin"

.if ENABLE_SOM == 1
    .p2align 4
    _ovr1Start:
    .incbin "ovr1.bin"
.endif

_bad1DataEnd:
