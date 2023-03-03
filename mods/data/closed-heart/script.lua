function opponentNoteHit() -- health draining mechanic
	health = getProperty('health')
    	if getProperty('health') > 0.1 then
        setProperty('health', health- 0.03);
  end
end