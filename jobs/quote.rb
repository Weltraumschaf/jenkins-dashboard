quotes = [
  "You can do anything, but not everything.\n—David Allen", 
  "Perfection is achieved, not when there is nothing more to add, but when there is nothing left to take away.\n—Antoine de Saint-Exupéry",
  "The richest man is not he who has the most, but he who needs the least.\n—Unknown Author",
  "You miss 100 percent of the shots you never take.\n—Wayne Gretzky",
  "Courage is not the absence of fear, but rather the judgement that something else is more important than fear.\n—Ambrose Redmoon",
  "You must be the change you wish to see in the world.\n—Gandhi",
  "When hungry, eat your rice; when tired, close your eyes. Fools may laugh at me, but wise men will know what I mean.\n—Lin-Chi",
  "The third-rate mind is only happy when it is thinking with the majority. The second-rate mind is only happy when it is thinking with the minority. The first-rate mind is only happy when it is thinking.\n—A. A. Milne",
  "To the man who only has a hammer, everything he encounters begins to look like a nail.\n—Abraham Maslow",
  "We are what we repeatedly do; excellence, then, is not an act but a habit.\n—Aristotle"
] 

send_event('quote', { text: quotes.sample })

SCHEDULER.every '10s' do
  send_event('quote', { text: quotes.sample })
end