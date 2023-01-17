import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';

export interface _SERVICE { 'multiply' : ActorMethod<[bigint, bigint], bigint> }
