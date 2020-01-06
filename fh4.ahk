#NoEnv
/*
Car List:
TEST - LEFT, 5, RIGHT, 8
*/

;Car Manufacturer
; Enter number of times right
MANNUMR = 0
; Enter number of times down
MANNUMD = 0

 
;Car Model
; Enter direction in braces {LEFT OR RIGHT}
MODELDIR = {RIGHT}
; Enter number of times
MODELNUM = 0

; max money
MONEY = 1
HOWMANY = 1
FOUNDCAR = 0


#MaxThreadsperHotkey 2
q::
Loop, 10000
{
	Loop
	{ ; be sure we returned to main menu
		PixelGetColor, PixColor, 603, 702
		if (PixColor = "0xFFFFFF")
		{
			Send {Enter}
			Sleep, 35 ; 35
			break
		}
	}
	
	; search options

	Loop
	{ ; waiting for search menu
		PixelGetColor, PixColor, 845, 492
		if (PixColor = "0x93B700")
		{
			break
		}
	}
	Loop, 6
	{
		Send {Y}
		Sleep, 30
		Send {Up}
		Sleep, 30 ; 35
	}
	
	Send {Enter}
	Sleep, 30
	
	Loop
	{ ; waiting for manfacturer menu
		PixelGetColor, PixColor, 411, 303
		if (PixColor = "0x93B700")
		{
			break
		}
	}
	
	Loop, %MANNUMR%
	{
		Send {Right}
		Sleep, 40 ; 40
	}
	Sleep, 30
	
	Loop, %MANNUMD%
	{
		Send {Down}
		Sleep, 40 ; 40
	}
	
	Send {Enter}
	Sleep, 30
	
	Loop
	{ ; waiting for search menu
		PixelGetColor, PixColor, 845, 492
		if (PixColor = "0x93B700")
		{
			break
		}
	}
	
	Send {Down}
	Sleep, 70

	Loop, %MODELNUM%
	{
		Send %MODELDIR%
		Sleep, 35 ; 40
	}
	Loop, 4
	{
		Send {Down}
		Sleep, 30 ; 35		
	}
	Loop, %MONEY%
	{
		Send {Right}
		Sleep, 30 ; 35
	}

	Send {Down}
	Sleep, 30
	Send {Enter}
	Sleep, 30	

	; cars list

	Sleep, 1100 ; 1100
	PixelGetColor, PixColor0, 152, 416
	if (PixColor0 = "0xFFFFFF")
	{
		FOUNDCAR = 1
	}
	else
	{
		Send {Esc}
		Sleep, 30
	}

	if(FOUNDCAR = 1)
	{
		Send {Y}
		Sleep, 70		
		Loop
		{
			PixelGetColor, PixColor, 1244, 755
			if (PixColor = "0xFFFFFF")
			{
				Send {Down}
				Sleep, 30
				Send {Enter}
				Sleep, 7	0	
				break
			}
		}

		Loop
		{
			PixelGetColor, PixColor, 1210, 861
			if (PixColor = "0xFFFFFF")
			{
				Send {Enter}
				break
			}
		}
		
		; check if bought
		Sleep 10000
		Send {Enter}
		Sleep, 5000
		Send {Esc}
		Sleep, 5000
		Send {Enter}
		Sleep, 5000
		Loop
		{
			PixelGetColor, PixColor, 179, 797
			if (PixColor = "0xFFFFFF")
			{
				FOUNDCAR = 0
				HOWMANY--
				Send {Esc}
				Sleep, 2000
				Send {Esc}
				Sleep, 2000
				break
			}
			if(HOWMANY = 0) 
			{
				return
			}
		}				
	}

Sleep, 1000 ; 1800
}