function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a blue note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Parry Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Cuphead/NOTE_parry'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has penalties
			end
		end
	end
	--debugPrint('Script started!')
end

function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'Parry Note' then
		--donothinglmfao
	end
end

canHitCup = false

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Parry Note' then
	end
end
