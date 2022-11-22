import { useRecoilValue } from "recoil";
import { resultadoDoAmigoSecreto } from "../atom";

//Responsável por trazer resultado do sorteio
export const useResultadoDoSorteio = () => {
  return useRecoilValue(resultadoDoAmigoSecreto);
};
