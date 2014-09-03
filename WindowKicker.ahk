; This was a pain not knowing much about how AHK handles variables
; Left all the experimentation code in, sorry. Who know I might need 
; it at some point..

#SingleInstance force

>^3::
SysGet, Mon, Monitor, 1
x := (MonRight - MonLeft) / 5
y := (MonBottom-MonTop) / 3
WinMove,A,,x,y
return

>^1::
WinGet,activeWin,ID,A
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
idx:=80
Loop %windows%
{
	id := windows%A_Index%
	idx := idx + 40
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
WinActivate, ahk_id %activeWin%
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
idx:=20
Loop %windows%
{
	id := windows%A_Index%
	idx := idx+40

	;x:= %A_ScreenWidth% + %idx%
	x:=  basex + idx
	y:=  idx

	WinGetTitle, title, ahk_id %id%
	IfWinExist, %title%
	{
	 ;WinMove, %title%, , 20,20
	 WinMove, A_ScreenWidth+idx, idx 
	 WinActivate
	 ;r .= windows%A_Index% . " - Title: ". title . "`n"
	 ;MsgBox ,"%title%: %x%, %y% - %A_ScreenWidth%" 
	}
}
return

