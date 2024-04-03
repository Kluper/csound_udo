opcode indexcount, k, kkk 
ktrig, kmax, kmode xin
kforward init 1
kindex init 0

if ktrig == 1 then
    if kmode == 0 then ; Read forward only
        kindex += 1
        if kindex == kmax then
            kindex = 0
        endif
    elseif kmode == 1 then ; Read backward only
        kindex -= 1
        if kindex < 0 then
            kindex = kmax-1
        endif
    elseif kmode == 2 then ; Backward then forward
        if kforward == 1 then ; Check if playing forward
            kindex += 1
            if kindex == kmax then
                kindex = kmax-2
                kforward = 0 ; Set direction to backward when reaching the end
            endif
        else ; If playing backward
            kindex -= 1
            if kindex < 0 then
                kindex = 1
                kforward = 1 ; Set direction to forward when reaching the beginning
            endif
        endif
    elseif kmode == 3 then ; Forward and backward
        if kforward == 1 then ; Check if playing forward
            kindex += 1
            if kindex == kmax then
                kindex = kmax-1
                kforward = 0 ; Set direction to backward when reaching the end
            endif
        else ; If playing backward
            kindex -= 1
            if kindex < 0 then
                kindex = 0
                kforward = 1 ; Set direction to forward when reaching the beginning
            endif
        endif
    endif
endif

xout kindex 