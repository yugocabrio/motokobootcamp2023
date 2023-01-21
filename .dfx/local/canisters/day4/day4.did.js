export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'add_username' : IDL.Func([IDL.Text], [], []),
    'get_usernames' : IDL.Func(
        [],
        [IDL.Vec(IDL.Tuple(IDL.Principal, IDL.Text))],
        ['query'],
      ),
    'is_anynomous' : IDL.Func([], [IDL.Bool], []),
  });
};
export const init = ({ IDL }) => { return []; };
