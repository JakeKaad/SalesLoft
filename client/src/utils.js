export const merge = (...obj) => Object.assign({}, ...obj)

const countLetters = (letterCount, string) => {
  const chars = [...string]
  chars.forEach((char) =>
    letterCount[char] ? (letterCount[char] += 1) : (letterCount[char] = 1)
  )
  return letterCount
}

export const letterCounter = (strings) => strings.reduce(countLetters, {})
