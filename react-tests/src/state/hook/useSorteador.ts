//Responsável por entregar uma forma de sorteio

import { useSetRecoilState } from "recoil";
import { resultadoDoAmigoSecreto } from "../atom";
import { realizarSorteio } from "../helpers/realizarSorteio";
import { useListaDeParticipantes } from "./useListaDeParticipantes";

export const useSorteador = () => {
  const participantes = useListaDeParticipantes();

  //Local de armazenamento do resultado
  const setResultado = useSetRecoilState(resultadoDoAmigoSecreto);

  return () => {
    const resultado = realizarSorteio(participantes);

    setResultado(resultado);
  };
};
