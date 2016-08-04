class Bob {
  hey(message) {
    let question = (m) => m.slice(-1) === '?' && !yell(m);
    let yell = (m) => m.toUpperCase() === m && /[A-Z]/.test(m);
    let silence = (m) => m.trim() === '';

    switch (true) {
      case question(message):
        return 'Sure.';
      case yell(message):
        return 'Whoa, chill out!';
      case silence(message):
        return 'Fine. Be that way!';
      default:
        return 'Whatever.';
    }
  }
}

export default Bob;
