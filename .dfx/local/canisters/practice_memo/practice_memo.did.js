export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'always_return_a_nut' : IDL.Func([IDL.Opt(IDL.Nat)], [IDL.Nat], []),
    'blob2text' : IDL.Func([IDL.Vec(IDL.Nat8)], [IDL.Opt(IDL.Text)], []),
    'char2nat32' : IDL.Func([], [IDL.Nat32], []),
    'check_char' : IDL.Func([], [IDL.Bool], []),
    'check_char_variable' : IDL.Func([IDL.Nat32], [IDL.Bool], []),
    'find_name' : IDL.Func([IDL.Text], [IDL.Opt(IDL.Nat)], []),
    'handle_null_value' : IDL.Func([IDL.Opt(IDL.Nat)], [IDL.Text], []),
    'languages' : IDL.Func([], [], []),
    'motoko_print' : IDL.Func([], [], []),
    'one2ten' : IDL.Func([], [], []),
    'see_equal' : IDL.Func([IDL.Text, IDL.Text], [IDL.Bool], []),
    'see_size' : IDL.Func([IDL.Text], [IDL.Nat], []),
    'size_array' : IDL.Func([], [], []),
    'size_array_via_iter' : IDL.Func([], [], []),
    'test' : IDL.Func([], [IDL.Bool], []),
    'test2' : IDL.Func([], [IDL.Bool], []),
    'text2blob' : IDL.Func([IDL.Text], [IDL.Vec(IDL.Nat8)], []),
    'text2char' : IDL.Func([IDL.Text], [IDL.Vec(IDL.Nat32)], []),
    'watch_size' : IDL.Func([IDL.Text], [IDL.Nat], []),
  });
};
export const init = ({ IDL }) => { return []; };
