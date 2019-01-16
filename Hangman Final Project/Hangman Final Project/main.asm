INCLUDE Irvine32.inc 
INCLUDE macros.inc
BUFFER_SIZE = 5000
.data 
		; File Data type
		RankLength dword ?
		WriteToFile_1 DWORD ? 
		ReadFromFile_1 DWORD ?
		buffer BYTE BUFFER_SIZE DUP(?)
		filename     BYTE "Ranks.txt",0 
		fileHandle   HANDLE ?
		stringLength DWORD ? 
		bytesWritten DWORD ? 
		str1 BYTE "Cannot create file",0dh,0ah,0 
		str2 BYTE "Bytes written to file [output.txt]:",0 
		str3 BYTE "Enter up to 500 characters and press"   
			 BYTE "[Enter]: ",0dh,0ah,0
		; ---------------------------------- 
		numberLenght dword ? 
		 number byte 20 dup (?)
		 numberStore byte 20 dup(?)
		 Trial dword ?
		 TrialString dword 10 Dup(?)
		 NumberOfCharUser dword ?
		 IsRepeated dword ?
		 mcount dword ?
		 user_name dword 20 dup(?),0
		 trials dword ? 
		 startTime dword ?
		 Selected_Words byte 20 dup(?)
		 Main_string byte 50 dup(?)
		 random_value dword ?
		 Guess_Letter byte ?
		 Old_Guess byte 30 Dup(?),0
		 Reapted_Message BYTE  "Reapeted Letter",0
		 counter Dword ?
		 Win byte "you win",0
		 Lose byte "you lose",0
		 Flag_Finish byte 0
		 HANGMAN_LIVES_05 BYTE          "                 ",
								0DH,0AH,  "+------+       ",
								0DH,0AH,  "|              ", 
								0DH,0AH,  "|              ", 
								0DH,0AH,  "|              ",
								0DH,0AH,  "|              ", 
								0DH,0AH,  "|              ",
								0DH,0AH,  "|              ", 
								0DH,0AH,  "|              ",
								0DH,0AH,  "+------------+ ", 
								0DH,0AH,  "|            | ", 
								0DH,0AH,  "+------------+ ",0

		   HANGMAN_EASY_LIVES_04 BYTE          "                 ",
								0DH,0AH,  "+------+       ",
								0DH,0AH,  "|      |       ", 
								0DH,0AH,  "|              ", 
								0DH,0AH,  "|              ", 
								0DH,0AH,  "|              ",
								0DH,0AH,  "|              ",
								0DH,0AH,  "|              ", 
								0DH,0AH,  "|              ",
								0DH,0AH,  "+------------+ ", 
								0DH,0AH,  "|            | ", 
								0DH,0AH,  "+------------+ ",0
			 HANGMAN_EASY_LIVES_03 BYTE  "                 ",
								0DH,0AH,  "+------+       ",
								0DH,0AH,  "|      |       ", 
								0DH,0AH,  "|      O       ", 
								0DH,0AH,  "|              ", 
								0DH,0AH,  "|              ", 
								0DH,0AH,  "|              ",
								0DH,0AH,  "|              ",
								0DH,0AH,  "|              ",
								0DH,0AH,  "+------------+ ", 
								0DH,0AH,  "|            | ",
								0DH,0AH,  "+------------+ ",0		
		 HANGMAN_EASY_LIVES_02 BYTE          "                 ",
								0DH,0AH,  "+------+       ",
								0DH,0AH,  "|      |       ", 
								0DH,0AH,  "|      O       ", 
								0DH,0AH,  "|     /|\       ", 
								0DH,0AH,  "|               ", 
								0DH,0AH,  "|              ",
								0DH,0AH,  "|              ",
								0DH,0AH,  "|              ",
								0DH,0AH,  "+------------+ ", 
								0DH,0AH,  "|            | ", 
								0DH,0AH,  "+------------+ ",0	
		   HANGMAN_EASY_LIVES_01 BYTE          "                 ",
								0DH,0AH,  "+------+       ",
								0DH,0AH,  "|      |       ", 
								0DH,0AH,  "|      O       ", 
								0DH,0AH,  "|     /|\       ", 
								0DH,0AH,  "|      |        ", 
								0DH,0AH,  "|      |        ",
								0DH,0AH,  "|              ",
								0DH,0AH,  "|              ",
								0DH,0AH,  "+------------+ ", 
								0DH,0AH,  "|            | ", 
								0DH,0AH,  "+------------+ ",0		
		   HANGMAN_LIVES_00 BYTE          "                 ",
								0DH,0AH,  "+------+       ",
								0DH,0AH,  "|      |       ", 
								0DH,0AH,  "|      O       ", 
								0DH,0AH,  "|     /|\       ", 
								0DH,0AH,  "|      |        ", 
								0DH,0AH,  "|      |        ",
								0DH,0AH,  "|     / \        ",
								0DH,0AH,  "|              ",
								0DH,0AH,  "+------------+ ", 
								0DH,0AH,  "|            | ", 
								0DH,0AH,  "+------------+ ",0	
		 HANGMAN_HARD_LIVES_01 BYTE          "                 ",
								0DH,0AH,  "+------+       ",
								0DH,0AH,  "|      |       ", 
								0DH,0AH,  "|      O       ", 
								0DH,0AH,  "|     /|\       ", 
								0DH,0AH,  "|              ", 
								0DH,0AH,  "|              ",
								0DH,0AH,  "|               ",
								0DH,0AH,  "|              ",
								0DH,0AH,  "+------------+ ", 
								0DH,0AH,  "|            | ", 
								0DH,0AH,  "+------------+ ",0	
		HANGMAN_WIN BYTE          "                 ",
								0DH,0AH,  "+------+       ",
								0DH,0AH,  "|      |       ", 
								0DH,0AH,  "|              ",
								0DH,0AH,  "|    \ O /     ", 
								0DH,0AH,  "|     \|/       ", 
								0DH,0AH,  "|      |        ", 
								0DH,0AH,  "|      |        ",
								0DH,0AH,  "|     / \        ",
								0DH,0AH,  "+------------+ ", 
								0DH,0AH,  "|  YOU WIN   | ", 
								0DH,0AH,  "+------------+ ",0	


		HANGMAN_LOSE BYTE          "                 ",
								0DH,0AH,  "+------+       ",
								0DH,0AH,  "|      |       ", 
								0DH,0AH,  "|      O     ", 
								0DH,0AH,  "|     /|\       ", 
								0DH,0AH,  "|    / | \       ", 
								0DH,0AH,  "|      |        ",
								0DH,0AH,  "|     / \        ",
								0DH,0AH,  "|              ",
								0DH,0AH,  "+------------+ ", 
								0DH,0AH,  "|  YOU LOSE  | ", 
								0DH,0AH,  "+------------+ ",0	
		statusGameLive DWORD ?	
		len_selected DWORD ? 
		check_exist dword ?
		choice_mood byte 09H,09H,09H,09H,09H,'1-Easy        2-Hard',0



		Cridits_Message BYTE    09H,09H,09H,09H,09H,"| Team Leader          |",
					  0DH,0AH,09H,09H,09H,09H,09H,  "|  - Doaa Khaled       |",
					 0DH,0AH,09H,09H,09H,09H,09H,   "|    1-Mustafa Khaled  |",
					 0DH,0AH,09H,09H,09H,09H,09H,   "|    2-Mohammed Nasser |",
					 0DH,0AH,09H,09H,09H,09H,09H,   "|    3-Enas Gamal      |",
					 0DH,0AH,09H,09H,09H,09H,09H,   "|    4-Khaled Mustafa  |",0

		aa BYTE "| Team Leader          |"
						BYTE "|   - Doaa Khaled      |"
						BYTE "| Team Members         |"      
						BYTE "|	   1-Mustafa Khaled  |"
						BYTE "|	   2-Mohammed Nasser |"
						BYTE "|	   3-Enas Gamal      |"
						BYTE "|	   4-Khaled Mustafa  |",0
   			         

		error_message byte 'INVAILD CHOICE >>>>>PLEASE ENTER YOUR CHOICE AGAIN '
		username dword ?
		username_msg byte 'enter your name'
		words_list  BYTE "breaking bad", 0
					BYTE "the good doctor", 0
					BYTE "prison break", 0
					BYTE "peakey blinders", 0
					BYTE "la case de pabel", 0
					BYTE "black mirror", 0
					BYTE "rick and morty", 0
					BYTE "house", 0
					BYTE "the punisher", 0
					BYTE "the daredvil", 0
					BYTE "stranger things", 0
					BYTE "better call saul", 0
					BYTE "the big bang theroy", 0
					BYTE "Sherlock Holmes", 0
					BYTE "death note", 0
					BYTE 0					; End of list
		len equ $ - words_list
 .code
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;Convert time and number of trials  ;
 ;to string and store it in file     ;
 ;Divided by 10 and convert digit to ; 
 ;string  Subtract from '0' and store; 
 ; it in number array and loop in    ;
 ; numberStore from end to start     ;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 Convert_To_Store PROC uses eax esi 

 mov edi , offset buffer
 add edi ,RankLength
 mov ecx , 10
		mov eax , trials
		mov esi , offset number 
		L1:
			mov edx , 0
			mov ebx , 10
			div ebx
			mov [esi] , edx
			mov ecx , eax
			add ecx , 1
			inc numberLenght
			add esi , type number
		loop L1


		mov eax , 0
		mov esi , offset number
		mov edx , offset numberStore
		add esi , numberLenght
		dec esi
		mov ecx , numberLenght
		L2:
			mov eax , 0
			mov ah , [esi]
			mov [edx] , ah
			sub esi , type number
			add edx , type numberStore
		loop L2
		
		inc RankLength
		mov eax , numberLenght
		add RankLength , eax
		mov al ,' '
		mov [edi] , al
		add edi , type buffer

		mov esi , offset numberStore
		mov ecx , numberLenght
		putnumber:
			mov eax , 0
			mov ah , [esi]
			add ah , '0'
			mov [edi] , ah
			add edi , type buffer
			add esi , type buffer
		loop putnumber

ret
 Convert_To_Store endp

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;Function write buffer variable in file  ;
 ;based on RankLength variable            ;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 Write PROC uses eax ebx edx 

	 ; Create a new text file. 
	mov edx,OFFSET filename 
	call CreateOutputFile
	mov fileHandle,eax ; Check for errors. 
	cmp eax, INVALID_HANDLE_VALUE ; error found? 
	jne file_ok ; no: skip 
	mov edx,OFFSET str1 ; display error 
	call WriteString 
	jmp quit 
	file_ok: 
	mov eax,fileHandle 
	mov edx,OFFSET buffer 
	mov ecx, RankLength
	call WriteToFile 
 quit:
	ret
 Write endp

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;Function read from file and return ;
 ;string in buffer variable and store;
 ;the length of file in RankLength   ;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 Read PROC uses eax edx ebx

 
	mov edx,OFFSET filename 
	call OpenInputFile 
	mov fileHandle,eax 


	cmp eax,INVALID_HANDLE_VALUE ; error opening file?
	jne file_ok ; no: skip
	mWrite <"Cannot open file",0dh,0ah>
	jmp quit 

	file_ok: ; Read the file into a buffer. 
	mov edx,OFFSET buffer 
	mov ecx,BUFFER_SIZE 
	call ReadFromFile 
	jnc check_buffer_size ; error reading? 
	mWrite "Error reading file. " ; yes: show error message 
	call WriteWindowsMsg
	jmp close_file 

	check_buffer_size:
	cmp eax,BUFFER_SIZE ; buffer large enough? 
	jb buf_size_ok ; yes 
	mWrite <"Error: Buffer too small for the file",0dh,0ah> 
	jmp quit ; and quit 
	buf_size_ok: 
	mov buffer[eax],0 ; insert null terminator 
	mov RankLength , eax  ; store character count 
	close_file: 
	mov eax,fileHandle
	 
	call CloseFile 
	 quit:
	 ret
 Read endp
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ; search for a word in words list      ;
 ; and pick one depending on its index  ;
 ; which select by random number        ;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 find_word PROC					
    mov edi, offset words_list          
    mov ecx, len         
	again : 
    mov al,0 
    sub edx, 1					;edx contain the random number so every time i search for 0 decrement the edx  till edx=-1 so the word is founded
    jc done                     ; string found [because (0-1) result will be negitive so carry flag is equall 1]
    repne scasb                 ;skip the word after the 0 and jump to again 
    jmp again                   ; reapeat    
  done:
	ret
find_word ENDP                   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      PRINT win image       ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Print_Win proc uses eax edx edi esi ebx ecx
 
 mov Flag_Finish , 1  ;check if game is finish or not 

	 mov ecx,5         
	 L:
		call ClrScr                    
		mov eax ,cyan
		call SetTextColor
		mov edx,offset HANGMAN_WIN   ;print winning hangman 
		call writestring
		call crlf 
		call ClrScr
		mov eax,500                    
		call Delay
		call ClrScr
		mov eax,cyan
		call SetTextColor
		mov edx,offset HANGMAN_WIN    ;print winning hangman 
		call writestring
		call crlf 
		mov eax, 500                      
		call Delay
	 loop L
	 mov eax,white
	call SetTextColor
	 ret
 Print_Win  endp
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      PRINT LOSE image       ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 Print_Lose proc uses eax edx edi esi ebx ecx

	mov Flag_Finish , 1   ;check if game is finish or not 
	mov ecx,3
	L:
		call ClrScr                    
		mov eax ,white
		call SetTextColor
		mov edx,offset HANGMAN_LOSE     ;print losing hangman 
		call writestring
		call crlf 
		call ClrScr
		mov eax,300                   
		call Delay
		call ClrScr
		mov eax,Red
		call SetTextColor
		mov edx,offset HANGMAN_LOSE          ;print losing hangman 
		call writestring
		call crlf 
		mov eax, 500                      
		call Delay
	loop L
	mov eax,white
	call SetTextColor
	ret
 Print_Lose  endp
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;print hangman image depanding on ;
 ;     the  statusGameLive         ;
 ;         on easy mood            ;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 print_hangman_EASY_live PROC  uses eax edx edi esi ebx ecx
	
	call ClrScr
	mov eax,blue
	call SetTextColor
	call crlf
	call crlf
	mWrite<'lives left: '>    ;display the left lives 
	mov eax,statusGameLive
	call writedec
	call crlf
	call crlf
	mov eax,white
	call SetTextColor
	mov eax, statusGameLive     ;cheak the  statuslive to draw the correct image
	cmp eax, 5
	je live_5
	cmp eax, 4
	je live_4
	cmp eax, 3
	je live_3
	cmp eax, 2
	je live_2
	cmp eax, 1
	je live_1
	cmp eax, 0
	je live_0

	live_5:	 
     
		 mov edx,offset HANGMAN_LIVES_05
		call WriteString   
		call crlf
		ret
	live_4:	 
    
		 mov edx,offset HANGMAN_EASY_LIVES_04
		call WriteString   
		call crlf
		ret
	live_3:	 
    
		 mov edx,offset HANGMAN_EASY_LIVES_03
		call WriteString   
		call crlf
		ret
	live_2:	 

		 mov edx,offset HANGMAN_EASY_LIVES_02
		call WriteString   
		call crlf
		ret		
	live_1:	 

		 mov edx,offset HANGMAN_EASY_LIVES_01
		call WriteString   
		call crlf
		ret	
	live_0:	 

		 mov edx,offset HANGMAN_LIVES_00
		call WriteString   
		call crlf
		call Print_Lose
		ret	
print_hangman_EASY_live ENDP  
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;print hangman image depanding on ;
 ;     the  statusGameLive         ;
 ;         on HARD mood            ;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 print_hangman_HARD_live PROC  uses eax edx edi esi ebx ecx
	call ClrScr
	mov eax,blue
	call SetTextColor
	call crlf
	call crlf
	mWrite<'lives left:  '>         ;display the left lives
	mov eax,statusGameLive
	call writedec
	call crlf
	call crlf
	mov eax,white
	call SetTextColor
	mov eax, statusGameLive	      ;cheak the  statuslive to draw the correct image
	cmp eax, 2
	je live_2
	cmp eax, 1
	je live_1
	cmp eax, 0
	je live_0

	live_2:	 
		mov edx,offset HANGMAN_LIVES_05
		call WriteString   
		call crlf
		ret	
	live_1:	 

		mov edx,offset HANGMAN_HARD_LIVES_01
		call WriteString   
		call crlf
		ret	
	live_0:	 

		mov edx,offset HANGMAN_LIVES_00
		call WriteString   
		call crlf
		call Print_Lose
		ret	
print_hangman_HARD_live ENDP  
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;Convert selected word To Small   ;
 ; use edx and al                  ;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 Convert_selected_word proc uses edx eax ecx
	 mov edx, offset Selected_Words
	 call StrLength
	 mov ecx , eax
	 l:  
		 mov al,[edx]
		 or al,100000b
		 mov [edx],al
		add edx,type Selected_Words
	 loop l 
		 ret 
 Convert_selected_word endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;we repalce each letter      ;
;by _ and 1 space for letter ;
;and 2 spaces for words      ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Character_Dash proc uses EAX EBX EDX  
 mov edx, offset Selected_Words
 call StrLength
 mov ecx , eax
 mov al ,'_'
   mov ah , ' '
   L1:
		cmp [edx] , ah
		je Space 
		mov [ebx] , al
		add ebx , type Main_string 
		mov [ebx] , ah
		jmp next
		space:                     
			mov [ebx] , ah
		next:
			add ebx , type Main_string
			add edx , type Main_string		
		loop L1
		
		ret
 Character_Dash ENDP

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;Search for input letter         ; 
 ;if Exist print Reapeted Meassge ;
 ;if not insert it at the last    ;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SearchAndinsert proc uses edx ecx  edi esi eax 
		mov IsRepeated , 0
		inc trials
		mov ecx,trials
		mov edi, offset Old_Guess
		or al,100000b
		cld 
	check:
		mov bl , [edi]
		cmp al , bl
		je outofloop
		inc edi
		loop check
	outofloop:
		cmp ecx , 0
		je insert
		mov IsRepeated , 1
		MOV eax ,red
		call SetTextColor
		mov edx, offset Reapted_Message
		call writestring
		call crlf
		MOV eax ,white
		call SetTextColor
		dec trials
		jmp outOfFunction
	insert:
		mov edi , offset Old_Guess
		dec trials
		add edi , trials
		mov [edi],al
	outtt:
		add trials , 1
	outOfFunction:

		ret
 SearchAndinsert endp
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;Update index of input Character ;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
Update_Word proc uses EAX EBX ESI EDI ECX EDX
        
		
		mov ah , ' '
		mov check_exist,0
	update:
		cmp ah , [esi]
		je Space
		cmp al , [esi]
		jne not_space

		mov [ebx] , al
		inc check_exist	
		jmp not_space
	
		Space:
			add ebx , type Main_string
			add esi , type Main_string
		jmp outloop
		
		not_Space:
			add ebx , type Main_string
			add ebx , type Main_string
			add esi , type Main_string
		
		outloop:
		
	loop update
		cmp check_exist,0
		jne next
		dec statusGameLive
		next:
	ret
Update_Word endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; iterate on the words to check if  ;
; all characters entered or not     ;
; and print winner or loser message ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 Winner_or_Loser proc uses edx eax ecx
	 mov len_selected ,lengthof Selected_Words
	 mov edi, offset Main_string
	 mov ecx,lengthof  Selected_Words
	 mov al,'_'
	 mov ah,' '
	 mov counter,0
	 L:
		cmp [edi],al
		je outt1
		cmp[edi],ah
		je space
		add edi,2
		add counter,1
		jmp countinue_loop
		 space:
			add edi,1
			add counter,1
			countinue_loop:
	 loop L
	 outt1:
		 mov eax,0
		 mov eax,len_selected
		 cmp counter,eax
		 je win_game
		 jmp continue
	 win_game:
		 call Print_Win
		 continue:
	 ret

 Winner_or_Loser endp

 ;_____________________________________________________

main proc 
	  call Read            ; Read Rank File 

	  mov mcount ,1    ; make cursor on the play choice in the start of program
	  
 enter_choice_meune:
		xor eax , eax
		mov ecx , lengthof Old_Guess
		mov edi , offset Old_Guess
		cld
		rep stosb             ; clear array of old guesses
		mov trials , 0
		mov Flag_Finish ,0

		cmp mcount ,1      ;check  if cursor on the play choice to print the correct menue 
		je menue_1
		cmp mcount ,2      ;check  if cursor on the credits choice to print the correct menue 
		je menue_2
		cmp mcount ,3      ;check  if cursor on the scoer choice to print the correct menue 
		je menue_3
		cmp mcount ,4      ;check  if cursor on the exit choice to print the correct menue 
		je menue_4


	  menue_1:
				call Clrscr
				mov eax,red
				call SetTextColor
				call crlf
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|************************|'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|      PLAY              |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
				mov eax,white
				call SetTextColor
				mWrite<09H,09H,09H,09H,09H,'|************************|'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|      CREDIETS          |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|************************|'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|      SCORE             |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|************************|'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|      EXIT              |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|************************|'>
				call crlf
				call readchar   ;get input from user  up or down or enter
				cmp al,13       ;if user press enter
				je play          
				jmp out_menue1       ;if user press up or down 
 
	  menue_2:
				call Clrscr
	 
				call crlf
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|************************|'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|      PLAY              |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
				mov eax,red
				call SetTextColor
				mWrite<09H,09H,09H,09H,09H,'|************************|'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|      CREDIETS          |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
				mov eax,white
				call SetTextColor
				mWrite<09H,09H,09H,09H,09H,'|************************|'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|      SCORE             |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|************************|'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|      EXIT              |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|************************|'>
				call crlf
				call readchar   ;get input from user  up or down or enter
				cmp al,13       ;if user press enter
				je credits
				jmp out_menue1       ;if user press up or down 
   
	   menue_3:
				call Clrscr
	 
				call crlf
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|************************|'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|      PLAY              |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
	
				mWrite<09H,09H,09H,09H,09H,'|************************|'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|      CREDIETS          |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
				mov eax,red
				call SetTextColor
				mWrite<09H,09H,09H,09H,09H,'|************************|'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|      SCORE             |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
				mov eax,white
				call SetTextColor
				mWrite<09H,09H,09H,09H,09H,'|************************|'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|      EXIT              |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|************************|'>
				call crlf
				call readchar   ;get input from user  up or down or enter
				cmp al,13       ;if user press enter
				je high_score
				jmp out_menue1       ;if user press up or down 

    
	  menue_4:
				call Clrscr
	 
				call crlf
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|************************|'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|      PLAY              |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
	
				mWrite<09H,09H,09H,09H,09H,'|************************|'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|      CREDIETS          |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
	    
				mWrite<09H,09H,09H,09H,09H,'|************************|'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|      SCORE             |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
				mov eax,red
				call SetTextColor
				mWrite<09H,09H,09H,09H,09H,'|************************|'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|      EXIT              |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
				mWrite<09H,09H,09H,09H,09H,'|                        |'>
				call crlf
				mov eax,white
				call SetTextColor
				mWrite<09H,09H,09H,09H,09H,'|************************|'>
				call crlf
				call readchar   ;get input from user  up or down or enter
				cmp al,13       ;if user press enter
				je exit_game
				jmp out_menue1       ;if user press up or down 

	  out_menue1:   ;check if user press up or down  if press up decrement  mcount  and if 
	                 ;press down increase mcount
				mov al,ah
				cmp AH, 48h 
				je up
				cmp al,50h
				je down
				jmp enter_choice_meune
				up:
				cmp mcount,1
				je down1
				sub mcount,1
				jmp out_menue
				down1:
				mov mcount,4
				jmp out_menue
				down:
				cmp mcount,4
				je up1
				add mcount,1
				jmp out_menue
				up1:
				mov mcount , 1
				jmp out_menue 

	out_menue:

 

 jmp enter_choice_meune



 ;-------------------------------------------------------------------------
	 play:
		 chioce_mood:
				mWrite<"Enter your name please>>">    ; take name of user
				call crlf
				mov edx , offset user_name
				mov ecx , lengthof user_name
				call readstring 
				mov NumberOfCharUser , eax          ; Store input cahrachter in NumberOfCharUser
				call ClrScr
				call ClrScr
				mov edx,offset choice_mood         ;print the moods to make user pick one 
				call writestring
				call crlf 

				call readint
				cmp eax,1
				je play_easy       ; if user  enter easy mood 
				cmp eax,2
				je play_hard       ; if user enter hard mood 
				jmp invaild_mood

	  play_easy:

				call GetMseconds   ; Get the start time
				mov startTime , eax

  
				call ClrScr
				mov statusGameLive,5     ;set the lives =5
				mov eax , 15;
				call Randomize          ;make a randim number to pick a word 
				call RandomRange   
				mov random_value , eax    ; store Random Value 
				mov edx,random_value      ;Index
				call find_word           ;Returns EDI = pointer to string, we pick world                      
				INVOKE Str_copy,         ;Copy find world in variable selectedWords 
					ADDR [edi],
					ADDR Selected_Words
				mov ecx , lengthof Selected_Words
				mov edx , offset Selected_Words
				mov ebx , offset  Main_string
				call Convert_selected_word     ;convert each letter in selected word to lower case 
				call Character_Dash            ;convert selected word to dashes

	   Play_again:                    

				mov edx , offset Main_string
				call writestring
				call crlf
				call crlf
				mWrite<'enter a guess letter:'>
				call crlf
				call readchar          ; Read Guessed Letter
 
    
				mov edi , offset Old_Guess
				call SearchAndinsert        ;cheak if word in old guesses or not 
   
				cmp IsRepeated , 1          ; if letter is repeated make user enter a letter again 
				je play_again

				call writechar
				call crlf

				or al,100000b
				mov edi , offset Old_Guess        ; mov edi into beginning of array 
				mov ecx , lengthof Old_Guess      
 
  				mov esi , offset Selected_Words
				mov ebx , offset  Main_string
				mov ecx , lengthof Selected_Words
				call Update_Word                  ;update the letter in the dash word
				call crlf
				call print_hangman_EASY_live       ;check his live and print the correct hangman  
				mov eax ,yellow
				call SetTextColor
					mov esi,offset Old_Guess
				mov ecx,lengthof Old_Guess
				mWrite<'Old_Guess is:'>           ; display all old guesses on screen to user 
				l:
					mov al,byte ptr[esi]
					call writechar
					mov al,' '
					call writechar
					add esi,1
				loop l
				call crlf
				mov eax ,white
				call SetTextColor
				call crlf
		
				call Winner_or_Loser     ;check if he won or lose or still playing 

				CMP Flag_Finish , 1      ; check if game is end or not 
				je End_OF_Game
				jmp Play_again
		End_OF_Game:                          ; display the original word after finish 
		
				mov edi , offset buffer
				add edi ,RankLength
		
				mov eax , 0dh               ; add new line
				mov [edi] , eax
				add edi , type buffer
		
				mov eax , 0ah               ; add new line
				mov [edi] , eax 
				add edi , type buffer


				mov edx , offset user_name
				mov ecx ,NumberOfCharUser
				add RankLength , ecx
				add RankLength , 2
		
				put_name:             ;Add user name to buffer to add in file
					mov bl , [edx]
					mov [edi], bl
					add edi , type buffer
					add edx , type buffer
				loop put_name


				mWrite<"the Correct Answer : ">
				mov edx , offset Selected_Words
				call writestring
				call crlf


				mWrite<"Your Name :">
				mov edx , offset user_name
				call writestring
				call crlf



				mWrite <"You Tried : ">
				mov eax , trials
				call writedec
				call crlf
		

				call Convert_To_Store
		

				mWrite <"Your Time is : ">
		
				call GetMseconds 
				sub  eax,startTime
				mov edx , 0
				mov esi , 1000
				div esi                           ; convert ms to s
				call writedec
				call crlf
		
				mov numberLenght , 0
				mov trials , eax
				call Convert_To_Store

				inc RankLength
				mov al , 's'             ; Write s to seconds
				mov [edi] , al
				add edi , type buffer
	
				call Write                      ; Write to file
				mWrite <"Enter any key to return to Home">
				call crlf
				call readchar
		
		
				jmp enter_choice_meune
		
		play_hard:
				call ClrScr
				call GetMseconds   ; Get the start time
				mov startTime , eax

				mov statusGameLive,2
				mov eax, 10
				call Randomize
				call RandomRange
				mov random_value , eax    ; store Random Value 
				mov edx, random_value    ;Index
				call find_word           ;Returns EDI = pointer to string, we pick world                      
				INVOKE Str_copy,         ;Copy find world in variable selectedWords 
					ADDR [edi],
					ADDR Selected_Words
				mov ecx , lengthof Selected_Words
				mov edx , offset Selected_Words
				mov ebx , offset  Main_string
				call Convert_selected_word     ;convert each letter in selected word to lower case 
				call Character_Dash          ;convert selected word to dashes
				
				Play_again1:
   
				mov edx , offset Main_string
				call writestring
				call crlf
				call crlf
				mWrite<'enter a guess letter:'>
				call crlf
				call readchar          ; Read Guessed Letter
				mov edi , offset Old_Guess
				call SearchAndinsert
				call ClrScr
				cmp IsRepeated , 1
				je play_again1

				call writechar
				call crlf
				or al,100000b
				mov edi , offset Old_Guess        ; mov edi into beginning of array 
				mov ecx , lengthof Old_Guess      
 
				mov esi , offset Selected_Words
				mov ebx , offset  Main_string
				mov ecx , lengthof Selected_Words
				call Update_Word
				call crlf

				call print_hangman_HARD_live
				mov eax ,yellow
				call SetTextColor
				mov esi,offset Old_Guess
				mov ecx,lengthof Old_Guess
				mWrite<'Old_Guess is:'>           ; display all old guesses on screen to user 
				l1:
					mov al,byte ptr[esi]
					call writechar
					mov al,' '
					call writechar
					add esi,1
				loop l1
				call crlf
				mov eax ,white
				call SetTextColor
				call crlf
		
				call Winner_or_Loser     ;check if he won or lose or still playing 

				CMP Flag_Finish , 1     

				je End_OF_Game1
		
				jmp Play_again1
		End_OF_Game1:                       
				mov edi , offset buffer
				add edi ,RankLength
		
				mov eax , 0dh               ; add new line
				mov [edi] , eax
				add edi , type buffer
		
				mov eax , 0ah               ; add new line
				mov [edi] , eax 
				add edi , type buffer


				mov edx , offset user_name
				mov ecx ,NumberOfCharUser
				add RankLength , ecx
				add RankLength , 2
		
				put_user_name:             ;Add user name to buffer to add in file
					mov bl , [edx]
					mov [edi], bl
					add edi , type buffer
					add edx , type buffer
				loop put_user_name


				mWrite<"the Correct Answer : ">
				mov edx , offset Selected_Words
				call writestring
				call crlf


				mWrite<"Your Name :">            ; display user name
				mov edx , offset user_name
				call writestring
				call crlf



				mWrite <"You Tried : ">          ; display number of tries
				mov eax , trials
				call writedec
				call crlf
		


				call Convert_To_Store
				;------------------------------------------------

				mWrite <"Your Time is : ">
		
				call GetMseconds 
				sub  eax,startTime
				mov edx , 0
				mov esi , 1000
				div esi                           ; convert ms to s
				call writedec
				call crlf
		
		
				mov trials , eax
				mov numberLenght , 0
				call Convert_To_Store

				inc RankLength
				mov al , 's'
				mov [edi] , al
				add edi , type buffer
		
		
				call Write                      ; Write to file
				mWrite <"Enter any key to return to Home">
				call crlf
				call readchar
		
		
				jmp enter_choice_meune


		invaild_mood:
				mov eax,red
				call SetTextColor
				mWrite<'please enter a vaild mood number:'>
				call crlf
				mov eax,white
				call SetTextColor
				mov eax,1000
				call Delay
				jmp chioce_mood

		credits:
				call ClrScr 
				mov ecx,10
				center1:
					call crlf
				loop center1
		
				mov edx , offset Cridits_Message
				call writestring 
				call crlf

				mWrite <"Enter any key to return to Home">   
				call crlf
				call readchar
				jmp enter_choice_meune

		high_score:
				mWrite <"High Score in Game " >
				call crlf
				mov edx , offset buffer
				call writestring 
				call crlf 

				mWrite <"Enter any key to return to Home">   
				call crlf
				call readchar
				jmp enter_choice_meune

	exit_game:
	
 exit 
  main endp 
 END main