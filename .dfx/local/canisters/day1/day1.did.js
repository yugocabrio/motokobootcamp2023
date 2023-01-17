export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'change_message' : IDL.Func([IDL.Text], [IDL.Text], []),
    'see_message' : IDL.Func([], [IDL.Text], ['query']),
  });
};
export const init = ({ IDL }) => { return []; };
