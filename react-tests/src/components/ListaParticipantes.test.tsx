import React from "react";
import { render, screen } from "@testing-library/react";
import { RecoilRoot } from "recoil";
import ListaParticipantes from "./ListaParticipantes";
import { useListaDeParticipantes } from "../state/hook/useListaDeParticipantes";

//Informando ao jest o que realmente deve realizar mock
//Quando solicitar o useListaDeParticipantes
jest.mock('../state/hook/useListaDeParticipantes', () => {
  //Informando que o hook deve se comportar como uma função
  return {
    useListaDeParticipantes: jest.fn()
  }
})

describe("uma lista vazia de participantes", () => {
  //Antes do teste faça:
  beforeEach(() => {
    //Fazendo com que o hook tenha comportamento de mock
    //Espera-se que o retorno seja uma array vazio
    (useListaDeParticipantes as jest.Mock).mockReturnValue([]);
  });

  test("deve ser renderizada sem elementos", () => {
    //Renderizando um componente
    render(
      <RecoilRoot>
        <ListaParticipantes />
      </RecoilRoot>
    );

    //Acesso a todos os itens da lista
    const itens = screen.queryAllByRole("listitem");
    //Espera-se que a lista tenha 0 itens
    expect(itens).toHaveLength(0);
  });
});

describe("uma lista preenchida com participantes", () => {
  //lista falsa
  const participantes = ["Ana", "Catarina"];

  //Antes do teste faça:
  beforeEach(() => {
    //Espera-se que o retorno seja a lista de participantes
    (useListaDeParticipantes as jest.Mock).mockReturnValue(participantes);
  });
  
  test("deve renderizar com elementos", () => {

    //Renderizando um componente
    render(
      <RecoilRoot>
        <ListaParticipantes />
      </RecoilRoot>
    );

    //Acesso a todos os itens da lista
    const itens = screen.queryAllByRole("listitem");
    //Espera-se que a lista tenha a mesma quantidade de participantes
    expect(itens).toHaveLength(participantes.length);
  });
});
