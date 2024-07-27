IDEAL
MODEL small
jumps
STACK 100h
p186
DATASEG
;-------------------------
;Player One & Player Two locations
x_playerOne dw 30
x_playerTwo dw 280
y_playerOne dw 80
y_playerTwo dw 80
temp_x dw 0
temp_y dw 0
;Color and length of drawings
color dw 4
lengthOfDrawings dw 9
;Score var
singlesScorePlayerOne db '0$'
dozensScorePlayerOne db '0$'
singlesScorePlayerTwo db '0$'
dozensScorePlayerTwo db '0$'
playerOneWin db 0
playerTwoWin db 0
;Ball var
pic_off dw 0
x_ball dw 150
y_ball dw 50
h_ball dw 9
w_ball dw 9
bx_saver dw 0
ballSpeed dw 03AFFh
drawTime db 0
newSpeedTime db 0
tempTimerTime db 0
currentTimeRight db 0
currentTimeLeft db '2'
timeToCalAgain db 0
y_direction_ball dw 'd'
x_direction_ball dw 'r'
temp_var dw 0
ballSkin db 0 ;1 - Default, 2 - Cool Emoji, 3 - Pokéball, 4 - Kirby, 5 - Hue ball, 6 - Bowling
ball db 00h, 00h, 08h, 08h, 08h, 08h, 08h, 00h, 00h
     db 00h, 08h, 08h, 07h, 07h, 07h, 08h, 08h, 00h
	 db 08h, 08h, 07h, 07h, 07h, 07h, 07h, 08h, 08h
	 db 08h, 07h, 07h, 07h, 07h, 07h, 07h, 07h, 08h
	 db 08h, 07h, 07h, 07h, 07h, 07h, 07h, 07h, 08h
	 db 08h, 07h, 07h, 07h, 07h, 07h, 07h, 07h, 08h
	 db 08h, 08h, 07h, 07h, 07h, 07h, 07h, 08h, 08h
	 db 00h, 08h, 08h, 07h, 07h, 07h, 08h, 08h, 00h
	 db 00h, 00h, 08h, 08h, 08h, 08h, 08h, 00h, 00h
	
bowlingBall db 00h, 00h, 12h, 12h, 12h, 12h, 12h, 00h, 00h
			db 00h, 12h, 11h, 11h, 11h, 11h, 11h, 12h, 00h
			db 12h, 11h, 11h, 11h, 16h, 11h, 16h, 11h, 12h
			db 12h, 11h, 11h, 11h, 11h, 11h, 11h, 11h, 12h
			db 12h, 11h, 11h, 11h, 11h, 16h, 11h, 11h, 12h
			db 12h, 11h, 11h, 11h, 11h, 11h, 11h, 11h, 12h
			db 12h, 11h, 11h, 11h, 11h, 11h, 11h, 11h, 12h
			db 00h, 12h, 11h, 11h, 11h, 11h, 11h, 12h, 00h
			db 00h, 00h, 12h, 12h, 12h, 12h, 12h, 00h, 00h
	 
hueBall db 00h, 00h, 08h, 08h, 08h, 08h, 08h, 00h, 00h
		db 00h, 08h, 0Ah, 0Eh, 0Eh, 0Eh, 2Bh, 08h, 00h
		db 08h, 02h, 0Ah, 0Ah, 0Eh, 2Bh, 2Bh, 2Ah, 08h
		db 08h, 35h, 02h, 08h, 08h, 08h, 2Ah, 0Ch, 08h
		db 08h, 35h, 35h, 08h, 00h, 08h, 0Ch, 0Ch, 08h
		db 08h, 35h, 36h, 08h, 08h, 08h, 28h, 0Ch, 08h
		db 08h, 36h, 22h, 22h, 24h, 0Dh, 0Dh, 28h, 08h
		db 00h, 08h, 22h, 24h, 24h, 24h, 0Dh, 08h, 00h
		db 00h, 00h, 08h, 08h, 08h, 08h, 08h, 00h, 00h

emojiBall db 00h, 00h, 12h, 12h, 12h, 12h, 12h, 00h, 00h
		  db 00h, 12h, 2Ch, 2Ch, 2Ch, 2Ch, 2Bh, 12h, 00h
		  db 12h, 2Ch, 2Ch, 2Ch, 2Ch, 2Ch, 2Ch, 2Bh, 12h
		  db 12h, 00h, 0Fh, 00h, 00h, 0Fh, 00h, 00h, 12h
		  db 12h, 2Ch, 00h, 00h, 2Ch, 00h, 00h, 2Bh, 12h
		  db 12h, 2Ch, 2Ch, 2Ch, 2Ch, 2Ch, 2Ch, 2Bh, 12h
		  db 12h, 2Ch, 2Ch, 00h, 00h, 00h, 2Ch, 2Bh, 12h
		  db 00h, 12h, 2Bh, 2Bh, 2Bh, 2Bh, 2Bh, 12h, 00h
		  db 00h, 00h, 12h, 12h, 12h, 12h, 12h, 00h, 00h
		  
pokeball 	db 00h, 00h, 08h, 08h, 08h, 08h, 08h, 00h, 00h
			db 00h, 08h, 28h, 28h, 28h, 28h, 28h, 08h, 00h
			db 08h, 28h, 28h, 04h, 04h, 04h, 28h, 04h, 08h
			db 08h, 04h, 04h, 08h, 08h, 08h, 04h, 04h, 08h
			db 08h, 08h, 08h, 08h, 0Fh, 08h, 08h, 08h, 08h
			db 08h, 0Fh, 0Fh, 08h, 08h, 08h, 0Fh, 1Dh, 08h
			db 08h, 1Dh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 1Dh, 08h
			db 00h, 08h, 1Dh, 1Dh, 1Dh, 1Dh, 1Dh, 08h, 00h
			db 00h, 00h, 08h, 08h, 08h, 08h, 08h, 00h, 00h
			
kirbyBall 	 db 00h, 00h, 3Dh, 3Dh, 3Dh, 3Dh, 3Dh, 00h, 00h
			 db 00h, 3Dh, 56h, 56h, 56h, 56h, 56h, 3Dh, 00h
			 db 3Dh, 56h, 56h, 37h, 56h, 37h, 56h, 56h, 3Dh
			 db 3Dh, 56h, 56h, 68h, 56h, 68h, 56h, 56h, 3Dh
			 db 3Dh, 56h, 3Eh, 56h, 56h, 56h, 3Eh, 56h, 3Dh
			 db 3Dh, 56h, 56h, 56h, 56h, 56h, 56h, 56h, 3Dh
			 db 00h, 3Dh, 56h, 56h, 56h, 56h, 56h, 3Dh, 00h
			 db 00h, 00h, 3Dh, 3Dh, 3Dh, 3Dh, 3Dh, 00h, 00h
			 db 00h, 28h, 28h, 28h, 00h, 28h, 28h, 28h, 00h
;Opening Screen Var
   openScrn db 'OpenScrn.bmp', 0
   blnkScrn db 'blnkScrn.bmp', 0
   HTPScrn db 'HTPScrn.bmp', 0
   P1WinScrn db 'P1WnScrn.bmp', 0
   P2WinScrn db 'P2WnScrn.bmp', 0
   skinScrn db 'skinScrn.bmp', 0
   filehandle dw ?
   Header db 54 dup (0)
   Palette db 256*4 dup(0)
   ScrLine db 320 dup (0)
   ErrorMsg db 'Error',13,10,'$'
;Sound
	note dw 0A98h
;----------------------
CODESEG
;Players & border procs
;Player 1
proc draw_line_playerOne
	pusha
    mov si, [lengthOfDrawings]
    xor bh, bh
    mov ax, [x_playerOne]
	mov [temp_x], ax
	mov cx, ax
    mov dx, [temp_y]
    mov ax, [color]
    mov ah, 0ch
drawPix1:
    int 10h
    inc cx
    dec si
    jnz drawPix1
    popa
    ret
endp draw_line_playerOne
proc draw_playerOne
	pusha
	mov cx, 30d
	mov ax, [y_playerOne]
	mov [temp_y], ax
rect:
	call draw_line_playerOne
	inc [temp_y]
	loop rect
	popa
	ret
endp draw_playerOne
proc draw_blank_playerOne
	pusha
	mov [color], 0
	mov cx, 30d
	mov ax, [y_playerOne]
	mov [temp_y], ax
rectan:
	call draw_line_playerOne
	inc [temp_y]
	loop rectan
	mov [color], 4
	popa
	ret
endp draw_blank_playerOne
;Player 2
proc draw_line_playerTwo
	pusha
    mov si, [lengthOfDrawings]
    xor bh, bh
    mov ax, [x_playerTwo]
	mov [temp_x], ax
	mov cx, ax
    mov dx, [temp_y]
    mov ax, [color]
    mov ah, 0ch
drawPix2:
    int 10h
    inc cx
    dec si
    jnz drawPix2
    popa
    ret
endp draw_line_playerTwo
proc draw_playerTwo
	pusha
	mov cx, 30d
	mov ax, [y_playerTwo]
	mov [temp_y], ax
	mov [color], 3
rectl:
	call draw_line_playerTwo
	inc [temp_y]
	loop rectl
	mov [color], 4
	popa
	ret
endp draw_playerTwo
proc draw_blank_playerTwo
	pusha
	mov cx, 30d
	mov ax, [y_playerTwo]
	mov [temp_y], ax
	mov [color], 0
rectang:
	call draw_line_playerTwo
	inc [temp_y]
	loop rectang
	mov [color], 4
	popa
	ret
endp draw_blank_playerTwo
;Ball procs
proc draw_line_ball
    pusha
    mov si, [lengthOfDrawings]
    xor bh, bh
    mov cx, [x_ball]
    mov dx, [temp_y]
    mov ax, [color]
    mov ah, 0ch
drawpr:
    int 10h
    inc cx
    dec si
    jnz drawpr
    popa
    ret
endp draw_line_ball
proc draw_ball
	pusha
	mov cx, [x_ball]
	mov dx,[y_ball]
	mov ax, 0ch
	int 10H ; AL = COLOR
	cmp al, 4
	je endDrawBall
	cmp al, 9
	je endDrawBall
	; DI  
	mov di,[pic_off]
	mov dx, [y_ball]
print_line:
	mov cx, [x_ball] ; 
	mov si, [w_ball] ; 
print_columns: 
	; AL 
	mov al, [di] ;
	inc di  ; 
	
	cmp al, 00h
	je dontDraw 
	; פסיקה ציור פיקסל 
	;  cx = x coordinate , dx = y coordinate, al- color
	mov bh,0
	mov ah,0ch 
	int 10h 
	
dontDraw:
	inc cx ;
	dec si ;
	cmp si, 0
	jne print_columns
	
	inc dx ;
	dec [h_ball] ;
	cmp [h_ball], 0
	jne print_line
endDrawBall:
	popa
	ret
endp draw_ball
proc draw_blank_ball
	pusha
	mov cx, 9
	mov ax, [y_ball]
	mov [temp_y], ax
	mov [color], 0
rectanl:
	call draw_line_ball
	inc [temp_y]
	loop rectanl
	mov [color], 4
	popa
	ret
endp draw_blank_ball
proc ballDelay
	pusha
	mov cx, 00h ;Higher part of the number
	mov dx, [ballSpeed] ;Lower part of the number
	mov al, 0
	mov ah, 86h
	int 15h
	popa
	ret
endp ballDelay
proc checkBallPlayersCollision
	pusha
startCheckingP1:
	;Checks the right side of player 1 for collision
	mov bh, 0h
	mov ah,0Dh
	cmp [x_direction_ball], 'r'
	je checkRight
checkLeft:
	mov bx, [x_ball]
	sub bx, 2
	mov [temp_var], bx
	jmp complete
checkRight:
	mov [temp_var], 10
	mov bx, [x_ball]
	add [temp_var], bx
complete:
	mov cx, [temp_var]	
	mov dx,[y_ball]
	cmp [x_direction_ball], 'r'
	je cmpPlayerTwo
	jmp cmpPlayerOne
cmpPlayerOne:
	mov bx, [y_playerOne]
	cmp [y_ball], bx
	jbe addToDX
	jmp completeAction
cmpPlayerTwo:
	mov bx, [y_playerTwo]
	cmp [y_ball], bx
	jbe addToDX
	jmp completeAction
addToDX:
	add dx, 8
completeAction:
	int 10H ; AL = COLOR
	cmp al, 0Bh
	je endCheckP
	cmp al, 0Ch
	je endCheckP
	cmp al, 0Fh
	je endCheckP
	cmp al, 0
	jne changeBallDire
	jmp endCheckP
changeBallDire:
	call openSpeaker
	mov [note], 0A98h
	call playSound
	call soundDelay
	call stopSound
	call changeDirection
endCheckP:
	popa
	ret
endp checkBallPlayersCollision
proc checkBallBorderCollision
	pusha
	cmp [y_ball], 190 
	ja ballHitBorder
	cmp [y_ball], 10 
	jb ballHitBorder
	jmp endCheckBorder
ballHitBorder:
	call changeBallDirByBorder
endCheckBorder:
	popa
	ret
endp checkBallBorderCollision
proc changeDirection
	pusha
checkXCoords:
	cmp [x_direction_ball], 'r'
	je ballIsMovingRight
	jmp ballIsMovingLeft
ballIsMovingRight:
	mov [x_direction_ball], 'l'
	jmp endChange
ballIsMovingLeft:
	mov [x_direction_ball], 'r'
	jmp endChange
endChange:
	popa
	ret
endp changeDirection
proc changeBallDirByBorder
	pusha
checkYcoords:
	cmp [y_direction_ball], 'd'
	je ballIsMovingDown
	jmp ballIsMovingUp
ballIsMovingDown:
	mov [y_direction_ball], 'u'
	jmp endChangeB
ballIsMovingUp:
	mov [y_direction_ball], 'd'
endChangeB:
	popa
	ret
endp changeBallDirByBorder
proc changeBallPosByDir
	pusha
	cmp [x_direction_ball], 'r'
	je rightXDir
leftXDir:
	sub [x_ball], 2h
	cmp [y_direction_ball], 'd'
	je downYDir
	jmp upYDir
rightXDir:
	add [x_ball], 2h
	cmp [y_direction_ball], 'd'
	je downYDir
	jmp upYDir
downYDir:
	inc [y_ball]
	jmp endChangeCoords
upYDir:
	dec [y_ball]
endChangeCoords:
	popa
	ret
endp changeBallPosByDir
;Ball Y spawn position randomizer
proc randomBallSpawnY
	pusha
getRandomNumber:
	mov bx, [bx_saver]
	mov ax, 40h
	mov es, ax
	mov ax, [es:6Ch]
	xor ax, [bx]
	add [bx_saver], ax
	and ax, 11111111b
	cmp ax, 180d
	ja getRandomNumber
	cmp ax, 10d
	jb getRandomNumber
	mov ah, 0
	mov [y_ball], ax
	popa
	ret
endp randomBallSpawnY
;Ball's speed timer
proc calculateNewSpeedTime
	pusha
	mov ah, 2ch
	int 21h
	mov [newSpeedTime], dh
	cmp [newSpeedTime], 50
	jae correctCalc
	add [newSpeedTime], 10
	jmp endCalculate
correctCalc:
	add [newSpeedTime], 10
	sub [newSpeedTime], 60
endCalculate:
	popa
	ret
endp calculateNewSpeedTime
proc checkIfTimeToReduceSpeed
	pusha 
	mov ah, 2ch
	int 21h
	cmp dh, [newSpeedTime]
	jne endCheckTime
	call openSpeaker
	mov [note], 0398h
	call playSound
	call soundDelay
	call stopSound
	mov [timeToCalAgain], 1
	mov [tempTimerTime], 0
	sub [ballSpeed], 600h
	cmp [ballSpeed], 01AFFh
	jbe ballSpeedMaximized
	jmp endCheckTime
ballSpeedMaximized:
	mov [ballSpeed], 01AFFh
endCheckTime:
	popa
	ret
endp checkIfTimeToReduceSpeed
proc printTimer
	pusha
	mov ah, 2ch
	int 21h
	mov cl, dh
	cmp [newSpeedTime], cl
	ja limitSpeedIsBigger
currentSpeedIsBigger:
	mov [tempTimerTime], cl
	mov al, [newSpeedTime]
	sub [tempTimerTime], al
	jmp checkTempTime
limitSpeedIsBigger:
	mov al, [newSpeedTime]
	mov [tempTimerTime], al
	sub [tempTimerTime], cl
checkTempTime:
	cmp [tempTimerTime], 10
	jb correctTime
incorrectTime:
	mov [tempTimerTime], 0
correctTime:
	add [tempTimerTime], '0'
	mov  dl, 18   ;Column
	mov  dh, 3   ;Row
	mov  bh, 0    ;Display page
	mov  ah, 02h  ;Sets Cursor Position
	int  10h
	mov  al, [tempTimerTime]
	mov  bl, 0Fh  ;Color / Red
	mov  bh, 0    ;Page number
	mov  ah, 0Eh 
	int  10h
	popa
	ret
endp printTimer
;Score checking and win checking
proc checkIfScored
	pusha
	cmp [x_ball], 310d
	ja playerOneScored
	cmp [x_ball], 10
	jb playerTwoScored
	jmp endcheckIfScored
playerOneScored:
	call openSpeaker
	mov [note], 0D98h
	call playSound
	call soundDelay
	call stopSound
	cmp [singlesScorePlayerOne], '9'
	je checkOrAddToDozensP1
	inc [singlesScorePlayerOne]
	jmp resetBallP1
checkOrAddToDozensP1:
	cmp [dozensScorePlayerOne], '9'
	je P1Win
	jmp P1DidntWin
P1Win:
	mov [playerOneWin], 1h
	jmp endcheckIfScored
P1DidntWin:
	inc [dozensScorePlayerOne]
	mov [singlesScorePlayerOne], '0'
	jmp resetBallP1
resetBallP1:
	call draw_blank_ball
	mov [x_ball], 150
	call randomBallSpawnY
	mov [x_direction_ball], 'l'
	mov [y_direction_ball], 'd'
	jmp endcheckIfScored
playerTwoScored:
	call openSpeaker
	mov [note], 0D98h
	call playSound
	call soundDelay
	call stopSound
	cmp [singlesScorePlayerTwo], '9'
	je checkOrAddToDozensP2
	inc [singlesScorePlayerTwo]
	jmp resetBallP2
checkOrAddToDozensP2:
	cmp [dozensScorePlayerTwo], '9'
	je P2Win
	jmp P2DidntWin
P2Win:
	mov [playerTwoWin], 1h
	jmp endcheckIfScored
P2DidntWin:
	inc [dozensScorePlayerTwo]
	mov [singlesScorePlayerTwo], '0'
	jmp resetBallP2
resetBallP2:
	call draw_blank_ball
	mov [x_ball], 150
	call randomBallSpawnY
	mov [x_direction_ball], 'r'
	mov [y_direction_ball], 'd'
endcheckIfScored:
	popa
	ret
endp checkIfScored
;UI drawing
proc drawUI
	pusha
	;Prints player 1's score
	mov  dl, 12   ;Column
	mov  dh, 3   ;Row
	mov  bh, 0    ;Display page
	mov  ah, 02h  ;Sets Cursor Position
	int  10h
	mov  al, [singlesScorePlayerOne]
	mov  bl, 0Ch  ;Color / Red
	mov  bh, 0    ;Page number
	mov  ah, 0Eh 
	int  10h
	;Prints player 1's dozens score
	mov  dl, 11   ;Column
	mov  dh, 3   ;Row
	mov  bh, 0    ;Display page
	mov  ah, 02h  ;Sets Cursor Position
	int  10h
	mov  al, [dozensScorePlayerOne]
	mov  bl, 0Ch  ;Color / Red
	mov  bh, 0    ;Page number
	mov  ah, 0Eh 
	int  10h
	;;Prints player 2's score
	mov  dl, 27   ;Column
	mov  dh, 3   ;Row
	mov  bh, 0    ;Display page
	mov  ah, 02h  ;Sets Cursor Position
	int  10h
	mov  al, [singlesScorePlayerTwo]
	mov  bl, 0Bh  ;Color / Cyan
	mov  bh, 0    ;Page number
	mov  ah, 0Eh 
	int  10h
	;Prints player 2's dozens score
	mov  dl, 26   ;Column
	mov  dh, 3   ;Row
	mov  bh, 0    ;Display page
	mov  ah, 02h  ;Sets Cursor Position
	int  10h
	mov  al, [dozensScorePlayerTwo]
	mov  bl, 0Bh  ;Color / Cyan
	mov  bh, 0    ;Page number
	mov  ah, 0Eh 
	int  10h
	popa
	ret
endp drawUI
;BMP pictures procedures
proc OpenMenuFile
; Open file
   mov ah, 3Dh
   xor al, al
   mov dx, offset openScrn
   int 21h
   jc openerror
   mov [filehandle], ax
   ret
openerror:
   mov dx, offset ErrorMsg
   mov ah, 9h
   int 21h
   ret
endp OpenMenuFile
proc OpenBlankFile
; Open file
   mov ah, 3Dh
   xor al, al
   mov dx, offset blnkScrn
   int 21h
   jc openerror2
   mov [filehandle], ax
   ret
openerror2:
   mov dx, offset ErrorMsg
   mov ah, 9h
   int 21h
   ret
endp OpenBlankFile
proc OpenHTPFile
; Open file
   mov ah, 3Dh
   xor al, al
   mov dx, offset HTPScrn
   int 21h
   jc openerror3
   mov [filehandle], ax
   ret
openerror3:
   mov dx, offset ErrorMsg
   mov ah, 9h
   int 21h
   ret
endp OpenHTPFile
proc OpenSkinFile
; Open file
   mov ah, 3Dh
   xor al, al
   mov dx, offset skinScrn
   int 21h
   jc openerror6
   mov [filehandle], ax
   ret
openerror6:
   mov dx, offset ErrorMsg
   mov ah, 9h
   int 21h
   ret
endp OpenSkinFile
proc OpenP1ScrnFile
  ; Open file
   mov ah, 3Dh
   xor al, al
   mov dx, offset P1WinScrn
   int 21h
   jc openerror4
   mov [filehandle], ax
   ret
openerror4:
   mov dx, offset ErrorMsg
   mov ah, 9h
   int 21h
   ret
endp OpenP1ScrnFile
proc OpenP2ScrnFile
  ; Open file
   mov ah, 3Dh
   xor al, al
   mov dx, offset P2WinScrn
   int 21h
   jc openerror5
   mov [filehandle], ax
   ret
openerror5:
   mov dx, offset ErrorMsg
   mov ah, 9h
   int 21h
   ret
endp OpenP2ScrnFile
proc ReadHeader
	;Read BMP file header, 54 bytes
	mov ah,3fh
	mov bx, [filehandle]
	mov cx,54
	mov dx,offset Header
	int 21h
	ret
endp ReadHeader
proc ReadPalette
	; Read BMP file color palette, 256 colors * 4 bytes (400h)
	mov ah,3fh
	mov cx,400h
	mov dx,offset Palette
	int 21h
	ret
endp ReadPalette
proc CopyPal
	; Copy the colors palette to the video memory
	; The number of the first color should be sent to port 3C8h
	; The palette is sent to port 3C9h
	mov si,offset Palette
	mov cx,256
	mov dx,3C8h
	mov al,0
	; Copy starting color to port 3C8h
	out dx,al
	; Copy palette itself to port 3C9h
	inc dx
PalLoop:
	; Note: Colors in a BMP file are saved as BGR values rather than RGB.
	mov al,[si+2] ; Get red value.
	shr al,2 ; Max. is 255, but video palette maximal
	; value is 63. Therefore dividing by 4.
	out dx,al ; Send it.
	mov al,[si+1] ; Get green value.
	shr al,2
	out dx,al ; Send it.
	mov al,[si] ; Get blue value.
	shr al,2
	out dx,al ; Send it.
	add si,4 ; Point to next color.
	;(There is a null chr. after every color.)
	loop PalLoop
	ret
endp CopyPal
proc CopyBitmap
	;BMP graphics are saved upside-down.
	;Read the graphic line by line (200 lines in VGA format),
	;displaying the lines from bottom to top.
	mov ax, 0A000h
	mov es, ax
	mov cx,200
PrintBMPLoop:
	push cx
	; di = cx*320, point to the correct screen line
	mov di,cx
	shl cx,6
	shl di,8
	add di,cx
	; Read one line
	mov ah,3fh
	mov cx,320
	mov dx,offset ScrLine
	int 21h
	; Copy one line into video memory
	cld ; Clear direction flag, for movsb
	mov cx,320
	mov si,offset ScrLine
	rep movsb ; Copy line to the screen
	;rep movsb is same as the following code:
	;mov es:di, ds:si
	;inc si
	;inc di
	;dec cx
	;loop until cx=0
	pop cx
	loop PrintBMPLoop
	ret
endp CopyBitmap
proc CloseFile
mov ah,3Eh
mov bx, [filehandle]
int 21h
ret
endp CloseFile 
;Sound effects procedures
proc openSpeaker
	pusha
	; Opens the speaker
	in al, 61h
	or al, 00000011b
	out 61h, al
	popa
	ret
endp openSpeaker
proc playSound
	pusha
	; send control word to change frequency
	mov al, 0B6h
	out 43h, al
	; play frequency 131Hz
	mov ax, [note]
	out 42h, al ; Sending lower byte
	mov al, ah
	out 42h, al ; Sending upper byte
	popa
	ret
endp playSound
proc stopSound
	pusha
	; Closes the speaker
	in al, 61h
	and al, 11111100b
	out 61h, al
	popa
	ret
endp stopSound
proc soundDelay
	pusha
	mov cx, 00h ;Higher part of the number
	mov dx, 03FFFh ;Lower part of the number
	mov al, 0
	mov ah, 86h
	int 15h
	popa
	ret
endp soundDelay
start:
mov ax, @data
mov ds, ax
;---------------------------
	;Changing to graphic mode
	mov ax, 13h
	int 10h
	;Resets the cursor pointer
	xor ax, ax
	int 33h
	mov [pic_off], offset ball
;Draws the menu and resets values
drawMenu:
	;Hides cursor
	mov ax, 2h
	int 33h
	;Opens the menu screen
	call OpenMenuFile
	call ReadHeader
	call ReadPalette
	call CopyPal
	call CopyBitmap
	call CloseFile
	;Resets all game variables
	mov [playerOneWin], 0
	mov [playerTwoWin], 0
	mov [singlesScorePlayerOne], '0'
	mov [dozensScorePlayerOne], '0'
	mov [singlesScorePlayerTwo], '0'
	mov [dozensScorePlayerTwo], '0'
	mov [ballSpeed], 03AFFh
	mov [x_ball], 150
	mov [y_ball], 50
	mov [y_playerOne], 80
	mov [y_playerTwo], 80
;The main menu screen
MenuScreen:
	;Checks for input and position
	mov ah, 0Bh
	int 21h
	cmp al, 0 
	jnz menuShouldExitProgram
	jmp menuContinue
menuShouldExitProgram:
	;Checks if ESCAPE was pressed and if it was exits the program, else continues as normal
	mov ah, 0
	int 16h
	cmp al, 01Bh ; ASCII for ESCAPE
	je endGame
menuContinue:
	;Sets the cursor as visible
	mov ax, 1h
	int 33h
	;Checks for input and position
	mov ax, 3h
	int 33h
	cmp bx, 01h
	je checkColorMenu
	jmp MenuScreen
checkColorMenu:
	;Gets the color that the mouse clicked on
	shr cx, 1
	sub dx, 1
	mov bh, 0h
	mov ah, 0dh
	int 10h
	;Checks for the two correct colors and if one of them is right checks what button it should load, else jumps to the start menu
	cmp al, 0A4h
	je checkButtonToLoad
	cmp al, 52h
	je checkButtonToLoad
	jmp MenuScreen
checkButtonToLoad:
	;Checks the X value of the click and decides by that what button was pressed and what screen it should load
	cmp dx, 106
	jb moveToGame
	cmp dx, 142
	jb moveToHTPScreen
	cmp dx, 178
	jb moveToSkinScreen
	jmp MenuScreen
moveToGame:
	;Plays the button sound
	call openSpeaker
	mov [note], 0398h
	call playSound
	call soundDelay
	call stopSound
;Moves from the Menu Screen to the game itself
	;Hides cursor
	mov ax, 2h
	int 33h
	call OpenBlankFile
	call ReadHeader
	call ReadPalette
	call CopyPal
	call CopyBitmap
	call CloseFile
	mov ax, 19 ; Back to BIOS colors
	int 16
	call calculateNewSpeedTime
	jmp gameLoop
moveToSkinScreen:
	;Plays the button sound
	call openSpeaker
	mov [note], 0398h
	call playSound
	call soundDelay
	call stopSound
	;Moves from the Menu Screen to the how to play screen
	;Hides cursor
	mov ax, 2h
	int 33h
	;Draws the how to play screen
	call OpenSkinFile
	call ReadHeader
	call ReadPalette
	call CopyPal
	call CopyBitmap
	call CloseFile
SkinsScrn:
	;Sets the cursor as visible
	mov ax, 1h
	int 33h
	;Checks for input and position
	mov ah, 0Bh
	int 21h
	cmp al, 0 
	jnz skinScrnShouldExitProgram
	jmp skinScrnContinue
skinScrnShouldExitProgram:
	;Checks if ESCAPE was pressed and if it was exits the program, else continues as normal
	mov ah, 0
	int 16h
	cmp al, 01Bh ; ASCII for ESCAPE
	je drawMenu
skinScrnContinue:
	;Checks for input and position
	mov ax, 3h
	int 33h
	;If the mouse's left click was pressed moves to check if the right color was pressed
	cmp bx, 01h
	je checkColorsSkins
	jmp SkinsScrn
checkColorsSkins:
	;Checks for the exit color 
	shr cx, 1
	sub dx, 1
	mov bh, 0h
	mov ah, 0dh
	int 10h
	cmp al, 0
	je skinsScrn
	;Checks for the right colors, If the colors are right it will jump back to the start menu, else it will start in the HTP menu
	cmp al, 0A4h
	je checkIfBelowYSkins
	cmp al, 52h
	je checkIfBelowYSkins
	jmp continueCheckingSkins
checkIfBelowYSkins:
	cmp dx, 145
	ja moveBackToMenu
continueCheckingSkins:
	;Checks if the mouse was in the buttons range
	cmp dx, 145
	ja skinsScrn
	cmp dx, 60
	jb skinsScrn
	;Now check for coords to decide the skin
	cmp cx, 58
	jb offsetClassic
	cmp cx, 107
	jb offsetBowling
	cmp cx, 156
	jb offsetHue
	cmp cx, 205
	jb offsetEmoji
	cmp cx, 254
	jb offsetPokeBall
	cmp cx, 302
	jb offsetKirby
	jmp skinsScrn
offsetClassic:
	;Plays the button sound
	call openSpeaker
	mov [note], 0F98h
	call playSound
	call soundDelay
	call stopSound
	mov [pic_off], offset ball
	jmp endChangeSkin
offsetBowling:
	;Plays the button sound
	call openSpeaker
	mov [note], 0E98h
	call playSound
	call soundDelay
	call stopSound
	mov [pic_off], offset bowlingBall
	jmp endChangeSkin
offsetHue:
	;Plays the button sound
	call openSpeaker
	mov [note], 0D98h
	call playSound
	call soundDelay
	call stopSound
	mov [pic_off], offset hueBall
	jmp endChangeSkin
offsetEmoji:
	;Plays the button sound
	call openSpeaker
	mov [note], 0C98h
	call playSound
	call soundDelay
	call stopSound
	mov [pic_off], offset emojiBall
	jmp endChangeSkin
offsetPokeBall:
	;Plays the button sound
	call openSpeaker
	mov [note], 0B98h
	call playSound
	call soundDelay
	call stopSound
	mov [pic_off], offset pokeball
	jmp endChangeSkin
offsetKirby:
	;Plays the button sound
	call openSpeaker
	mov [note], 0A98h
	call playSound
	call soundDelay
	call stopSound
	mov [pic_off], offset kirbyBall
endChangeSkin:
	jmp SkinsScrn
moveToHTPScreen:
	;Plays the button sound
	call openSpeaker
	mov [note], 0398h
	call playSound
	call soundDelay
	call stopSound
	;Moves from the Menu Screen to the how to play screen
	;Hides cursor
	mov ax, 2h
	int 33h
	;Draws the how to play screen
	call OpenHTPFile
	call ReadHeader
	call ReadPalette
	call CopyPal
	call CopyBitmap
	call CloseFile
;How to play menu
HowToPlayScrn:
	;Sets the cursor as visible
	mov ax, 1h
	int 33h
	;Checks for input and position
	mov ah, 0Bh
	int 21h
	cmp al, 0 
	jnz HTPShouldExitProgram
	jmp HTPContinue
HTPShouldExitProgram:
	;Checks if ESCAPE was pressed and if it was exits the program, else continues as normal
	mov ah, 0
	int 16h
	cmp al, 01Bh ; ASCII for ESCAPE
	je drawMenu
HTPContinue:
	;Checks for input and position
	mov ax, 3h
	int 33h
	;If the mouse's left click was pressed moves to check if the right color was pressed
	cmp bx, 01h
	je checkColorHTP
	jmp HowToPlayScrn
checkColorHTP:
	shr cx, 1
	sub dx, 1
	mov bh, 0h
	mov ah, 0dh
	int 10h
	;Checks for the right colors, If the colors are right it will jump back to the start menu, else it will start in the HTP menu
	cmp al, 0A4h
	je moveBackToMenu
	cmp al, 52h
	je moveBackToMenu
	jmp HowToPlayScrn
moveBackToMenu:
	;Plays the button sound
	call openSpeaker
	mov [note], 0398h
	call playSound
	call soundDelay
	call stopSound
	jmp drawMenu
;The main game loop
gameLoop:
	mov [h_ball], 9
	mov [w_ball], 9
	call draw_blank_ball
	call changeBallPosByDir
	call draw_ball
	call draw_playerOne
	call draw_playerTwo
	call drawUI
	call printTimer
	;Checks for any input to update each player's position
	jmp checkForInput
continueGame:
	;Checks for ball collision with the border or players
	call checkBallBorderCollision
	call checkBallPlayersCollision
	;Checks if any one of the player scored and uses that info accordingly by updating the variables, UI and checks for a win condition
	call checkIfScored
	call drawUI
	cmp [playerOneWin], 1
	je PlayerOneWinScreen
	cmp [playerTwoWin], 1
	je PlayerTwoWinScreen
	call checkIfTimeToReduceSpeed
	cmp [timeToCalAgain], 1
	je calcAgain
	jmp finishLoop
calcAgain: 
	mov [timeToCalAgain], 0
	call calculateNewSpeedTime
finishLoop:
	call ballDelay
	jmp gameLoop
;Checks for input
checkForInput:
	;Checks for input and position, 0 if for no input 1 for else
	mov ah, 0Bh
	int 21h
	cmp al, 0 
	jnz getKeystroke
	jmp continueGame
getKeystroke:
	;Checks the button that was pressed
	mov ah, 0
	int 16h
	jmp checkWhatInput
;Players Movement
;Detects input and uses the right action accordingly
checkWhatInput:
	cmp al, 's' ;Lower S
	je moveDownPlayerOne
	cmp al, 'S' ;Capital S
	je moveDownPlayerOne
	cmp al, 'w' ;Lower W
	je moveUpPlayerOne
	cmp al, 'W' ;Capital W
	je moveUpPlayerOne
	cmp ah, 50h ;50 == Down Arrow
	je moveDownPlayerTwo
	cmp ah, 48h ;48h == Up Arrow
	je moveUpPlayerTwo
	cmp al, 01Bh ; ASCII for ESCAPE
	je drawMenu
	jmp continueGame
;Moves player one according to the input and restricts it to a certain Y border
moveDownPlayerOne:
	;Checks if the player hit the lower border and if it did doesn't move it, else moves it down
	cmp [y_playerOne], 155d
	ja checkForInput
	call draw_blank_playerOne
	add [y_playerOne], 8h
	call draw_playerOne
	call checkBallPlayersCollision
	jmp continueGame
moveUpPlayerOne:
	;Checks if the player hit the upper border and if it did doesn't move it, else moves it up
	cmp [y_playerOne], 15d
	jb checkForInput
	call draw_blank_playerOne
	sub [y_playerOne], 8h
	call draw_playerOne
	jmp continueGame
;Moves player two according to the input and restricts it to a certain Y border
moveDownPlayerTwo:
	;Checks if the player hit the lower border and if it did doesn't move it, else moves it down
	cmp [y_playerTwo], 155d
	ja checkForInput
	call draw_blank_playerTwo
	add [y_playerTwo], 8h
	call draw_playerTwo
	jmp continueGame
moveUpPlayerTwo:
	;Checks if the player hit the upper border and if it did doesn't move it, else moves it up
	cmp [y_playerTwo], 15d
	jb checkForInput
	call draw_blank_playerTwo
	sub [y_playerTwo], 8h
	call draw_playerTwo
	jmp continueGame
;Win screens and a return to the main menu
PlayerOneWinScreen:
	call OpenP1ScrnFile
	jmp drawWinScreen
PlayerTwoWinScreen:
	call OpenP2ScrnFile
drawWinScreen:
	call ReadHeader
	call ReadPalette
	call CopyPal
	call CopyBitmap
	call CloseFile
	mov ah, 0
	int 16h
	jmp drawMenu
endGame:
	;Returns to text mode
	mov ax, 2h
	int 10h
;---------------------------
exit:
mov ax, 4c00h
int 21h
END start