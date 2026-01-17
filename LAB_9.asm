INCLUDE Irvine32.inc
.data

restaurantStatus DWORD 1 ; 1 = Open, 0 = Closed
managerMenuOptions BYTE "1) View Reservation Status", 0
managerMenuOptions1 BYTE "2) Set Restaurant Status",0
managerMenuOptions2 BYTE "3) goback",0
norr BYTE "no reservations",0
managerWelcome BYTE "                                        *** WELCOME MANAGERS ***", 0
restaurantClosedMessage BYTE "Sorry, the restaurant is currently CLOSED.", 0
restaurantClosedMessage1 BYTE "Restaurant has been made CLOSE",0
restaurantOpenMessage BYTE "The restaurant is now OPEN!", 0
setRestaurantStatusMessage BYTE "Please enter 1 to open or 0 to close the restaurant: ", 0
reservationStatusMessage BYTE "Number of reserved tables: ", 0

CUSTOMER BYTE "2) Customer",0
MANAGER BYTE "1) Manager",0
promp BYTE "Enter your password",0
; Reservation Data;
reserveStatus DWORD 20 DUP(0)  
quantity dword 20 Dup(0)
currentOrders dword 20 dup(0)
Bill dword 20 dup(0)
reservedCount DWORD -1     
orderCount DWORD -1
Orderselect byte "Please select: ",0
Entertable byte "enter the table no for the bill: ",0
Noordertable byte "this table is not reserved or food is not ordered",0

; Main Menu
welcome byte "                                       *** WELCOME TO OUR RESTAURANT ***",0
mainMenu BYTE "Hey, how do you do?", 0
customerOption BYTE "1) Login", 0
exitOption BYTE "2) Exit", 0


; Customer Menu;

customerWelcome BYTE "                                        *** WELCOME CUSTOMERS ***", 0
reserveTableOption BYTE "1) Reserve Table", 0
cancelReservationOption BYTE "2) Cancel Reservation", 0
orderFoodOption BYTE "3) Order Food", 0
getBillOption BYTE "4) Get Bill", 0
customerBackOption BYTE "5) Go Back", 0
reservationSuccess BYTE "Table Reserved", 0
reservationCanceledMessage BYTE "Reservation Canceled", 0
foodOrderedMessage BYTE "Food Ordered", 0

;order food menu
ordermessage BYTE "Please Select",0
breakfast BYTE "1) Breakfast",0
lunch BYTE "2) Lunch",0
dinner BYTE "3) Dinner",0

;breakfast menu
eggsbenedict BYTE "0)Eggs Benedict   150",0
avocadotoast BYTE "1)Avocado Toast   200",0
breakfastburrito BYTE "2)Breakfast Burrito   250",0
frenchtoast BYTE "3)French Toast   300",0
greekyougurtparfait BYTE "4)Greek Yougurt Parfait   350",0

;lunch menu
grilledchickensandwhich BYTE "5)Grilled Chicken Sandwhich   400",0
casersalad BYTE "6)Caser Salad   450",0
tomatosoup BYTE "7)Tomato Soup   500",0
turkeyandavacadowrap BYTE "8)Turkey And Avacado Wrap   550",0
quichelorraine BYTE "9)Quiche Lorraine   600",0

;dinner menu
grilledsteak BYTE "10)Grilled Steak   650",0
pansearedsalmon BYTE "11)Panseared Salmon   700",0
vegetarianlasagna BYTE "12)Vegetarian Lasagna   750",0
chickenfajitas BYTE "13)Chicken Fajitas   800",0
bakedchickenparmesan BYTE "14)Baked Chicken Parmesan   850",0

eggsbenedict1 BYTE "-> Eggs Benedict   150",0
avocadotoast1 BYTE "-> Avocado Toast   200",0
breakfastburrito1 BYTE "-> Breakfast Burrito   250",0
frenchtoast1 BYTE "-> French Toast   300",0
greekyougurtparfait1 BYTE "-> Greek Yougurt Parfait   350",0
grilledchickensandwhich1 BYTE "-> Grilled Chicken Sandwhich   400",0
casersalad1 BYTE "-> Caser Salad   450",0
tomatosoup1 BYTE "-> Tomato Soup   500",0
turkeyandavacadowrap1 BYTE "-> Turkey And Avacado Wrap   550",0
quichelorraine1 BYTE "-> Quiche Lorraine   600",0
grilledsteak1 BYTE "1-> Grilled Steak   650",0
pansearedsalmon1 BYTE "1-> Panseared Salmon   700",0
vegetarianlasagna1 BYTE "-> Vegetarian Lasagna   750",0
chickenfajitas1 BYTE "-> Chicken Fajitas   800",0
bakedchickenparmesan1 BYTE "-> Baked Chicken Parmesan   850",0

; Messages
pressAnyKeyMessage BYTE "Press any key to return to the menu...", 0
invalidInputMessage BYTE "Invalid input. Try again.", 0
reservationFull BYTE "All tables are reserved!", 0
giveorder BYTE "Please Give Order: ",0
orderquantity BYTE "Order Quanitity: ",0
ordercompleted BYTE "No Table Reserved",0
grandtotal BYTE "THE TOTAL FOR THE ORDER IS : ",0
billoftable BYTE "The Bill For The Table ",0
noreservations BYTE "No Table Is Reserved",0
order1 BYTE "ORDER :",0
quantity1 BYTE "QUANTITY :",0
noorder BYTE "NO Order Has Been Placed yet",0
thanks BYTE "                     *** THANKING YOU FOR VISITING OUR RESTAURANT.PLEASE COME AGAIN....BY ***",0
domain BYTE "                                   *** WHAT IS YOUR DOMAIN IN RESTAURANT ***",0

.code
main PROC
call MainMenufunc
exit
main ENDP


;main menu
MainMenufunc PROC
mov edx,OFFSET welcome
call ClearAndPrint
call crlf
mov edx, OFFSET mainMenu
call writestring
call crlf
call PrintMainMenuOptions
call ReadInt
cmp eax, 1
je LoginMenu
cmp eax, 2
je ExitProgram
call InvalidInput
call MainMenufunc

ret
MainMenufunc ENDP


;used in above proc
PrintMainMenuOptions PROC

mov edx, OFFSET customerOption
call WriteString
call Crlf
mov edx, OFFSET exitOption
call WriteString
call Crlf

ret
PrintMainMenuOptions ENDP


;login menu
LoginMenu PROC   
mov edx,offset domain
call clearAndprint
call crlf
mov edx, OFFSET Orderselect
call writestring 
call crlf
mov edx, OFFSET MANAGER
call WriteString
call crlf
mov edx, OFFSET CUSTOMER
call WriteString
call crlf
mov edx,offset managerMenuOptions2
call WriteString
call crlf
call ReadInt
cmp eax, 1
je ManagerMenu
cmp eax, 2
je CustomerMenu
cmp eax,3
je MainMenufunc
call InvalidInput
jmp LoginMenu

ret
LoginMenu ENDP


;manager menu
ManagerMenu PROC
mov edx,offset managerwelcome
call clearAndprint
mov edx,offset orderselect
call writestring
call crlf
mov edx, OFFSET managerMenuOptions
call writestring
call crlf
mov edx, OFFSET managerMenuOptions1
call writestring
call crlf
mov edx, OFFSET managerMenuOptions2
call writestring
call crlf
call ReadInt
cmp eax, 1
je ViewReservationStatus
cmp eax, 2
je SetRestaurantStatus
cmp eax, 3
je LoginMenu
call InvalidInput
jmp ManagerMenu

ret
ManagerMenu ENDP


;no of table reserved
ViewReservationStatus PROC

mov eax, reservedCount
cmp eax,0
jl print1
mov edx, OFFSET reservationStatusMessage
call clearAndprint
mov eax, reservedCount
inc eax
call WriteDec
jmp print2
print1:
mov edx,offset norr
call clearAndprint
print2:
mov eax,3000
call delay
jmp ManagerMenu

ret
ViewReservationStatus ENDP


;open/close restaurant
SetRestaurantStatus PROC

mov edx, OFFSET setRestaurantStatusMessage
call clearAndPrint
laa:
call ReadInt
cmp eax, 1
je OpenRestaurant
cmp eax, 0
je CloseRestaurant
call InvalidInput1
jmp laa

ret
SetRestaurantStatus ENDP


;used in above
OpenRestaurant PROC

mov restaurantStatus, 1
mov edx, OFFSET restaurantOpenMessage
call displayMessagewithPause
jmp ManagerMenu

ret
OpenRestaurant ENDP


;used in above
CloseRestaurant PROC

mov restaurantStatus, 0
mov edx, OFFSET restaurantClosedMessage1
call displayMessagewithPause
jmp ManagerMenu

ret
CloseRestaurant ENDP


; Customer Menu
CustomerMenu PROC
mov eax, restaurantStatus
cmp eax, 0
je RestaurantClosed
mov edx, OFFSET customerWelcome
call ClearAndPrint
call PrintCustomerMenuOptions
call ReadInt
cmp eax, 1
je ReserveTable
cmp eax, 2
je CancelReservation
cmp eax, 3
je OrderFood
cmp eax, 4
je GetBill
cmp eax, 5
je loginMenu
call InvalidInput
call CustomerMenu

ret
CustomerMenu ENDP


;used in above
RestaurantClosed PROC

mov edx, OFFSET restaurantClosedMessage
call displayMessagewithpause
jmp LoginMenu

ret
RestaurantClosed ENDP


;used in above
PrintCustomerMenuOptions PROC

mov edx, OFFSET reserveTableOption
call WriteString
call Crlf
mov edx, OFFSET cancelReservationOption
call WriteString
call Crlf
mov edx, OFFSET orderFoodOption
call WriteString
call Crlf
mov edx, OFFSET getBillOption
call WriteString
call Crlf
mov edx, OFFSET customerBackOption
call WriteString
call Crlf

ret
PrintCustomerMenuOptions ENDP


;table reservation
ReserveTable PROC

mov eax, reservedCount
cmp eax, 20                
jge FullReserve
inc reservedCount
mov esi, reservedCount
mov reserveStatus[esi], 1   
mov edx, OFFSET reservationSuccess
call DisplayMessageWithPause
jmp l1
FullReserve:
mov edx, OFFSET reservationFull
call DisplayMessageWithPause
l1:
call CustomerMenu

ret
ReserveTable ENDP


;cancel reservation
CancelReservation PROC

cmp reservedcount,-1
jle l6
dec reservedcount
cmp ordercount,-1
je l4
decc:
dec ordercount
l4:
mov edx, OFFSET reservationCanceledMessage
call DisplayMessageWithPause
call CustomerMenu
jmp l5
l6:
mov edx,offset noreservations
call displayMessageWithPause
l5:
call customerMenu

ret
CancelReservation ENDP


;used in below proc;
printorderfoodmenuoptios PROC

mov edx,OFFSET ordermessage
call ClearAndPrint
mov edx,OFFSET breakfast
call writestring
call crlf
mov edx,OFFSET lunch
call writestring 
call crlf
mov edx,OFFSET dinner 
call writestring
call crlf

ret 
printorderfoodmenuoptios ENDP


;order;
OrderFood PROC

inc orderCount
mov eax,reservedCount
cmp ordercount,eax
jg owrong 

call printorderfoodmenuoptios

Invalid1:
Mov edx,offset orderselect
Call writestring
call ReadInt
Cmp eax,0
Jle inval
Cmp eax,4
Jge inval
cmp eax,1
je printbreakfastoptions
cmp eax,2
je printlunchoptions
cmp eax,3
je printdinneroptions
jmp oright

Inval:
Call invalidinput1
Call crlf
Jmp invalid1
owrong:
dec ordercount
mov edx,OFFSET ordercompleted
call displayMessageWithPause
call customerMenu
oright:

ret
OrderFood ENDP


;breakfast;
printbreakfastoptions PROC

mov edx,OFFSET ordermessage
call ClearAndPrint
mov edx,OFFSET eggsbenedict
call writestring
call crlf
mov edx,OFFSET avocadotoast
call writestring 
call crlf
mov edx,OFFSET breakfastburrito
call writestring
call crlf
mov edx,OFFSET frenchtoast
call writestring
call crlf
mov edx,OFFSET greekyougurtparfait
call writestring
call crlf

bl2:
mov edx,OFFSET giveorder
call writestring
call ReadInt
cmp eax,-1
jg bright

bwrong:
call InvalidInput1
jmp bl2
bright:
cmp eax,5
jl bbright
jge bwrong

bbright:
mov esi,ordercount
mov currentOrders[esi],eax
bWrongquantity:
mov edx,OFFSET orderquantity
call writestring
call ReadInt
cmp eax,0
jle bno
mov quantity[esi],eax
call crlf 
Jmp brightquantity 

bno:
call InvalidInput1
jmp bwrongquantity
brightquantity:
mov edx,OFFSET foodOrderedMessage
call displayMessageWithPause
Call calculatebill

ret 
printbreakfastoptions ENDP


;lunch;
printlunchoptions PROC

mov edx,OFFSET ordermessage
call ClearAndPrint
mov edx,OFFSET grilledchickensandwhich
call writestring
call crlf
mov edx,OFFSET casersalad
call writestring 
call crlf
mov edx,OFFSET tomatosoup
call writestring
call crlf
mov edx,OFFSET turkeyandavacadowrap
call writestring
call crlf
mov edx,OFFSET quichelorraine
call writestring
call crlf
ll2:
mov edx,OFFSET giveorder
call ReadInt
cmp eax,4
jg lright
lwrong:
call InvalidInput1
jmp ll2
lright:
cmp eax,10
jl llright
jge lwrong
llright:
mov esi, ordercount 
mov currentOrders[esi],eax
lWrongquantity:
mov edx,OFFSET orderquantity
call writestring
call ReadInt
cmp eax,0
jle lno
mov quantity[esi],eax
call crlf
Jmp lrightquantity 
lno:
call InvalidInput1
jmp lWrongquantity 
lrightquantity:
mov edx,OFFSET foodOrderedMessage
call displayMessageWithPause
Call calculatebill

ret
printlunchoptions ENDP

; dinner;
printdinneroptions PROC

mov edx,OFFSET ordermessage
call ClearAndPrint
mov edx,OFFSET grilledsteak
call writestring
call crlf
mov edx,OFFSET pansearedsalmon
call writestring 
call crlf
mov edx,OFFSET vegetarianlasagna
call writestring
call crlf
mov edx,OFFSET chickenfajitas
call writestring
call crlf
mov edx,OFFSET bakedchickenparmesan
call writestring
call crlf
dl2:
mov edx,OFFSET giveorder
call ReadInt
cmp eax,9
jg dright
dwrong:
call InvalidInput1
jmp dl2
dright:
cmp eax,15
jl ddright
jge dwrong
ddright:
mov esi, ordercount 
mov currentOrders[esi],eax
dwrongquantity:
mov edx,OFFSET orderquantity
call writestring
call ReadInt
cmp eax,0
jle dno
mov quantity[esi],eax
call crlf
Jmp drightquantity 

dno:
call InvalidInput1
jmp dwrongquantity 
drightquantity:
mov edx,OFFSET foodOrderedMessage
call displayMessageWithPause
Call calculatebill

ret
printdinneroptions ENDP


Calculatebill proc
Mov eax,currentorders[esi]
Mov ebx, quantity [esi]
cmp eax,0
je r0
cmp eax,1
je r1
cmp eax,2
je r2
cmp eax,3
je r3
cmp eax,4
je r4
cmp eax,5
je r5
cmp eax,6
je r6
cmp eax,7
je r7
cmp eax,8
je r8
cmp eax,9
je r9
cmp eax,10
je r10
cmp eax,11
je r11
cmp eax,12
je r12
cmp eax,13
je r13
cmp eax,14
je r14

r0:
mov eax,150
Mul ebx
Mov bill[esi],eax
Jmp finish
r1:
mov eax,200
Mul ebx
Mov bill[esi],eax
Jmp finish
r2:
mov eax,250
Mul ebx
Mov bill[esi],eax
Jmp finish
r3:
mov eax,300
Mul ebx
Mov bill[esi],eax
Jmp finish
r4:
mov eax,350
Mul ebx
Mov bill[esi],eax
Jmp finish
r5:
mov eax,400
Mul ebx
Mov bill[esi],eax
Jmp finish
r6:
mov eax,450
Mul ebx
Mov bill[esi],eax
Jmp finish
r7:
mov eax,500
Mul ebx
Mov bill[esi],eax
Jmp finish
r8:
mov eax,550
Mul ebx
Mov bill[esi],eax
Jmp finish
r9:
mov eax,600
Mul ebx
Mov bill[esi],eax
Jmp finish
r10:
mov eax,650
Mul ebx
Mov bill[esi],eax
Jmp finish
r11:
mov eax,700
Mul ebx
Mov bill[esi],eax
Jmp finish
r12:
mov eax,750
Mul ebx
Mov bill[esi],eax
Jmp finish
r13:
mov eax,800
Mul ebx
Mov bill[esi],eax
Jmp finish
r14:
mov eax,850
Mul ebx
Mov bill[esi],eax

Finish:
Call customerMenu
Calculatebill endp


;billing;
GetBill PROC

Mov esi, ordercount
cmp esi,-1
jle noorder2
Mov edx,offset entertable 
Call writestring 
Call readint
cmp eax,esi
Jnle noorder1

Mov edx,offset billoftable
Call clearandprint
Call writedec 
mov ecx,0
Mov ecx,eax

Mov eax, currentorders[ecx]
Mov ebx, quantity[ecx]
call crlf
Mov edx,offset order1
Call writestring 

cmp eax,0
je rr0
cmp eax,1
je rr1
cmp eax,2
je rr2
cmp eax,3
je rr3
cmp eax,4
je rr4
cmp eax,5
je rr5
cmp eax,6
je rr6
cmp eax,7
je rr7
cmp eax,8
je rr8
cmp eax,9
je rr9
cmp eax,10
je rr10
cmp eax,11
je rr11
cmp eax,12
je rr12
cmp eax,13
je rr13
cmp eax,14
je rr14

rr0:
mov edx,offset eggsbenedict1
call writestring
Jmp same
rr1:
mov edx,offset avocadotoast1
call writestring
Jmp same 
rr2:
mov edx,offset breakfastburrito1
call writestring
Jmp same
rr3:
mov edx,offset frenchtoast1
call writestring
Jmp same
rr4:
mov edx,offset greekyougurtparfait1
call writestring
Jmp same
rr5:
mov edx,offset grilledchickensandwhich1
call writestring
Jmp same
rr6:
mov edx,offset casersalad1
call writestring
Jmp same
rr7:
mov edx,offset tomatosoup1
call writestring
Jmp same
rr8:
mov edx,offset turkeyandavacadowrap1
call writestring
Jmp same
rr9:
mov edx,offset quichelorraine1
call writestring
Jmp same
rr10:
mov edx,offset grilledsteak1
call writestring
Jmp same
rr11:
mov edx,offset pansearedsalmon1
call writestring
Jmp same
rr12:
mov edx,offset vegetarianlasagna1
call writestring
Jmp same
rr13:
mov edx,offset chickenfajitas1
call writestring
Jmp same
rr14:
mov edx,offset bakedchickenparmesan1
call writestring

Same:
call crlf
Mov edx,offset quantity1
Call writestring 

Mov eax,ebx
Call writedec

Call crlf 
Mov edx,offset grandtotal
Call writestring 
Mov eax,bill[ecx]
Call writedec
call crlf
Jmp getend


noorder1:
Mov edx,offset Noordertable
Call displayMessageWithPause
jmp l7

noorder2:
mov edx,offset noorder
Call displayMessageWithPause
jmp l7

Getend:
mov edx, OFFSET pressAnyKeyMessage
call WriteString            
call Crlf
call WaitForKeyPress
l7:
call customermenu

ret
GetBill ENDP


; Utility Procedures

ClearAndPrint PROC
call Clrscr
call WriteString
call Crlf
ret
ClearAndPrint ENDP


DisplayMessageWithPause PROC
call Clrscr
call WriteString         
call Crlf
mov edx, OFFSET pressAnyKeyMessage
call WriteString          
call Crlf
call WaitForKeyPress         
ret
DisplayMessageWithPause ENDP



WaitForKeyPress PROC
call ReadChar 
ret
WaitForKeyPress ENDP



InvalidInput PROC
mov edx, OFFSET invalidInputMessage
call DisplayMessageWithPause
call Crlf
ret
InvalidInput ENDP



InvalidInput1 PROC
mov edx,OFFSET invalidinputmessage
call writestring
call crlf
ret
InvalidInput1 ENDP

ExitProgram PROC
mov edx,offset thanks
call clearAndPrint
exit
ExitProgram ENDP

END main

