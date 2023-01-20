import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';

export interface _SERVICE {
  'always_return_a_nut' : ActorMethod<[[] | [bigint]], bigint>,
  'blob2text' : ActorMethod<[Uint8Array], [] | [string]>,
  'char2nat32' : ActorMethod<[], number>,
  'check_char' : ActorMethod<[], boolean>,
  'check_char_variable' : ActorMethod<[number], boolean>,
  'find_name' : ActorMethod<[string], [] | [bigint]>,
  'handle_null_value' : ActorMethod<[[] | [bigint]], string>,
  'languages' : ActorMethod<[], undefined>,
  'motoko_print' : ActorMethod<[], undefined>,
  'mystere' : ActorMethod<[Array<bigint>], [] | [bigint]>,
  'one2ten' : ActorMethod<[], undefined>,
  'riddle' : ActorMethod<[Array<bigint>], Array<bigint>>,
  'see_equal' : ActorMethod<[string, string], boolean>,
  'see_size' : ActorMethod<[string], bigint>,
  'size_array' : ActorMethod<[], undefined>,
  'size_array_via_iter' : ActorMethod<[], undefined>,
  'test' : ActorMethod<[], boolean>,
  'test2' : ActorMethod<[], boolean>,
  'text2blob' : ActorMethod<[string], Uint8Array>,
  'text2char' : ActorMethod<[string], Uint32Array>,
  'watch_size' : ActorMethod<[string], bigint>,
}
