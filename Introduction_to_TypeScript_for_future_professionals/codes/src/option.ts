{
  type Option<T> = {
    tag: 'some',
    value: T,
  } | {
    tag: 'none',
  };

  const isSome = <T>(option: Option<T>): option is { tag: 'some', value: T } => {
    return option.tag === 'some';
  }

  const showOptionalValue = <T>(option: Option<T>): void => {
    if (isSome(option)) {
      console.log(`value is: ${option.value}`);
    } else {
      console.log('value is none');
    }
  };

  const mapOption = <T, U>(option: Option<T>, fn: (value: T) => U): Option<U> => {
    if (isSome(option)) {
      return {
        tag: 'some',
        value: fn(option.value),
      };
    }

    return {
      tag: 'none',
    };
  }

  const option1: Option<number> = {
    tag: 'some',
    value: 42,
  };
  const option2: Option<number> = {
    tag: 'none',
  };
  showOptionalValue(option1);
  showOptionalValue(option2);
}
