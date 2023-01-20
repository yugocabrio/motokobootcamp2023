export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'remove_even' : IDL.Func([IDL.Vec(IDL.Nat)], [IDL.Vec(IDL.Nat)], []),
    'second_maximum' : IDL.Func([IDL.Vec(IDL.Int)], [IDL.Int], []),
  });
};
export const init = ({ IDL }) => { return []; };
