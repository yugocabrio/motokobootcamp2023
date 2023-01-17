export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'multiply' : IDL.Func([IDL.Nat, IDL.Nat], [IDL.Nat], []),
  });
};
export const init = ({ IDL }) => { return []; };
