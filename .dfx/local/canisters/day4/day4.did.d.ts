import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';

export interface _SERVICE {
  'add_username' : ActorMethod<[string], undefined>,
  'get_usernames' : ActorMethod<[], Array<[Principal, string]>>,
  'is_anynomous' : ActorMethod<[], boolean>,
}
