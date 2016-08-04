export default class Word {
  count(phrase) {
    return phrase.trim().toLowerCase().split(/\s+/).reduce((result, word) => {
      result[word] = (+result[word] || 0) + 1;
      return result;
    }, {});
  }
}
