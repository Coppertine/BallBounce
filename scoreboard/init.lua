local scoreboard = {
    score = 0
}

function scoreboard:addScore(score)
    self.score = score
end
return scoreboard