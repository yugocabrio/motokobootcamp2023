export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'hours_to_minutes' : IDL.Func([IDL.Nat], [IDL.Nat], []),
    'multiply' : IDL.Func([IDL.Nat, IDL.Nat], [IDL.Nat], []),
    'volume' : IDL.Func([IDL.Nat], [IDL.Nat], []),
  });
};
export const init = ({ IDL }) => { return []; };
