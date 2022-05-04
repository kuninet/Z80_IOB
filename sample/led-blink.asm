;
; LEDブリンクプログラム for KZ80-IOB
;
    CPU Z80

PPI_A   EQU 0C0h
PPI_B   EQU 0C1h
PPI_C   EQU 0C2h
PPI_CTL   EQU 0C3h

    org 9000h

START:
    call ppi_init
    call ppi_blink
    ret

;--------------------
; 8255初期化
;--------------------
ppi_init:
    LD  A,080h      ; PPI ALL output
    OUT (PPI_CTL),A
    ret

;---------------------
; LED点滅
;---------------------
ppi_blink:
    LD  C,all_loop_cnt
.all_loop
    LD  HL,DATA
    LD  B,data_cnt
.loop
    call LED_BLINK
;
    call WAIT
    DJNZ    .loop
;
    LD  B,data_cnt
.loop2
    call LED_BACK_BLINK
;
    call WAIT
    DJNZ    .loop2
;
    DEC C
    JR NZ,.all_loop
;
    ret

LED_BLINK:
    LD  A,(HL)
    OUT (PPI_C),A
    INC HL
;
    LD  A,(HL)
    OUT (PPI_B),A
    INC HL
;
    LD  A,(HL)
    OUT (PPI_A),A
    INC HL
;
    RET
;
LED_BACK_BLINK:
    DEC HL
    LD  A,(HL)
    OUT (PPI_A),A
;
    DEC HL
    LD  A,(HL)
    OUT (PPI_B),A
;
    DEC HL
    LD  A,(HL)
    OUT (PPI_C),A
;
    RET

;--------------------
; WAIT
;--------------------
WAIT:
    PUSH BC
    LD C,100
.loop2
    LD B,100
.loop1
    DEC B
    NOP
    JR NZ,.loop1
;
    DEC C
    JR NZ,.loop2
;
    POP BC
    RET

; DATA
DATA:
    DB  00000000b,00000000b,00000001b
    DB  00000000b,00000000b,00000010b
    DB  00000000b,00000000b,00000100b
    DB  00000000b,00000000b,00001000b
    DB  00000000b,00000000b,00010000b
    DB  00000000b,00000000b,00100000b
    DB  00000000b,00000000b,01000000b
    DB  00000000b,00000000b,10000000b
    DB  00000000b,00000001b,00000000b
    DB  00000000b,00000010b,00000000b
    DB  00000000b,00000100b,00000000b
    DB  00000000b,00001000b,00000000b
    DB  00000000b,00010000b,00000000b
    DB  00000000b,00100000b,00000000b
    DB  00000000b,01000000b,00000000b
    DB  00000000b,10000000b,00000000b
    DB  00000001b,00000000b,00000000b
    DB  00000010b,00000000b,00000000b
    DB  00000100b,00000000b,00000000b
    DB  00001000b,00000000b,00000000b
    DB  00010000b,00000000b,00000000b
    DB  00100000b,00000000b,00000000b
    DB  01000000b,00000000b,00000000b
    DB  10000000b,00000000b,00000000b

;
DATA_END    EQU $
data_cnt    EQU (DATA_END-DATA)/3
all_loop_cnt    EQU 10
:
    END