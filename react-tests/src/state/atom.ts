import { atom } from "recoil";

//Lista de string
export const listaParticipantesState = atom<string[]>({
  key: 'listaParticipantesState',
  default: []
})

export const erroState = atom<string>({
  key: 'erroState',
  default: ''
})