function startSong (song)
    print('Song started')
end

function update(elapsed)
    if curStep >= 576 and curStep < 680 then
        local currentBeat = (songPos / 1000)*(bpm/60)
        for i=0,7 do
        setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
        end

        showOnlyStrums = true;

        camHudAngle = camHudAngle + 0.05
    else
        for i=0,7 do
        setActorX(_G['defaultStrum'..i..'X'],i)
        setActorY(_G['defaultStrum'..i..'Y'],i)
        end

        camHudAngle = 0
    end

    local currentBeat = (songPos / 1000)*(bpm/60)
	for i=0,3 do
		setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.25) * math.pi), i)
	end
end

function beatHit (beat)
	for i=0,7 do
		setActorAngle(getActorAngle(i) + 15, i)
	end
end

function stepHit (step)
    if curStep >= 576 and curStep < 680 then
            showOnlyStrums = true
            strumLine1Visible = false
    else
            showOnlyStrums = false
            strumLine1Visible = true
    end
    if curStep == 689 and curStep < 710 then
        showOnlyStrums = true
        strumLine1Visible = false
        strumLine2Visible = false
    else
        showOnlyStrums = false
        strumLine1Visible = true
        strumLine2Visible = true
    end
end

function keyPressed (key)    

end

function setDefault(id)
	_G['defaultStrum'..id..'X'] = getActorX(id)
end

print('Modchart lod')