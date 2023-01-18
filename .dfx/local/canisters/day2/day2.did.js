export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'average_array' : IDL.Func([IDL.Vec(IDL.Int)], [IDL.Int], []),
    'count_character' : IDL.Func([IDL.Text, IDL.Nat32], [IDL.Nat], []),
    'factorial' : IDL.Func([IDL.Nat], [IDL.Nat], []),
    'number_of_words' : IDL.Func([IDL.Text], [IDL.Nat], []),
  });
};
export const init = ({ IDL }) => { return []; };
