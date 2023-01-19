import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';

export interface _SERVICE {
  'blob2text' : ActorMethod<[Uint8Array], [] | [string]>,
  'char2nat32' : ActorMethod<[], number>,
  'check_char' : ActorMethod<[], boolean>,
  'check_char_variable' : ActorMethod<[number], boolean>,
  'languages' : ActorMethod<[], undefined>,
  'motoko_print' : ActorMethod<[], undefined>,
  'one2ten' : ActorMethod<[], undefined>,
  'see_equal' : ActorMethod<[string, string], boolean>,
  'see_size' : ActorMethod<[string], bigint>,
  'size_array_via_iter' : ActorMethod<[], undefined>,
  'test' : ActorMethod<[], boolean>,
  'test2' : ActorMethod<[], boolean>,
  'text2blob' : ActorMethod<[string], Uint8Array>,
  'text2char' : ActorMethod<[string], Uint32Array>,
  'watch_size' : ActorMethod<[string], bigint>,
}
