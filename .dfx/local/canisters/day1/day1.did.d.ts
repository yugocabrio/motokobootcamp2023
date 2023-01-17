import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';

export interface _SERVICE {
  'hours_to_minutes' : ActorMethod<[bigint], bigint>,
  'multiply' : ActorMethod<[bigint, bigint], bigint>,
  'volume' : ActorMethod<[bigint], bigint>,
}
