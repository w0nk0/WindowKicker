; This was a pain not knowing much about how AHK handles variables
; Left all the experimentation code in, sorry. Who know I might need 
; it at some point..

#SingleInstance force

>^1::
SysGet, Mon, Monitor, 1
SysGet, count, MonitorCount
if %count%>0 
{
  basex := MonLeft + 200
  basey := MonTop + 200
}
;if %MonLeft% < 0 
; return

WinGet windows, List
idx:=0
Loop %windows%
{
	id := windows%A_Index%
	idx := idx + 20
	;x := 20 + %A_Index% * 10
	;y := 20 + %A_Index% * 10
	;x:= basex + idx
	;y:= basey + idx
	;x:=  basex + idx
	;y:=  basey + idx
	WinGetTitle, title, ahk_id %id%
	IfWinExist, %title%
	{
	 ;WinMove, %title%, , 20,20
         ;MsgBox ,"%title% : %x% , %y%" 
	 WinMove, idx, idx
	 WinActivate
	 ;r .= windows%A_Index% . " - Title: ". title . "`n"
	}
}
return


>^2::
SysGet, Mon, Monitor, 1
SysGet, count, MonitorCount
if  count <2
{
  ;MsgBox, "Only 1 Monitor in the system. Exiting."
  ;return
} 

if  count >0 
{
  basex:=MonRight + 200
  basey:= 200
  ;MsgBox, "L: %MonLeft% R: %MonRight% T: %MonTop%"
  ;MsgBox, "bx - %basex% // by - %basey%"  
}

WinGet windows, List
idx:=0
Loop %windows%
{
	id := windows%A_Index%
	idx := idx+20
	;x := 20 + %A_Index% * 10
	;y := 20 + %A_Index% * 10
	x:=  basex + idx
	;x:= %A_ScreenWidth% + %idx%
	y:=  idx
	WinGetTitle, title, ahk_id %id%
	IfWinExist, %title%
	{
	 ;WinMove, %title%, , 20,20
	 WinMove, A_ScreenWidth, idx 
	 WinActivate
	 ;r .= windows%A_Index% . " - Title: ". title . "`n"
	 ;MsgBox ,"%title%: %x%, %y% - %A_ScreenWidth%" 
	}
}
return

