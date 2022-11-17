import { useRecoilValue } from "recoil"
import { listaParticipantesState } from "../atom"

export const useListaDeParticipantes = () => {
  //Chamando retorno do recoil value para pegar valor da lista
  return useRecoilValue(listaParticipantesState)
}
