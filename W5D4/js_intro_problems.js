function madLib(verb, adjective, noun) {
  console.log('We shall ' + verb.toUpperCase() + ' the ' + adjective.toUpperCase() + ' ' + noun.toUpperCase());
}

function isSubstring(searchString, subString) {
  return searchString.includes(subString)
}

function fizzBuzz(array) {
  result = [];
  array.forEach(el => {if(el % 3 === 0 || el % 5 === 0){
    result.push(el);
  }
});

  return result;
}

function isPrime(n) {
  if (n < 2){
    return false;
  }
  for (i = 2; i < n; i++){
    if (n % i === 0){
      return false;
    }
  }
  return true;
}
