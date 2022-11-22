import { fireEvent, render, screen } from "@testing-library/react";
import React from "react";
import { RecoilRoot } from "recoil";
import { useListaDeParticipantes } from "../state/hook/useListaDeParticipantes";
import Rodape from "./Rodape";

jest.mock("../state/hook/useListaDeParticipantes", () => {
  return {
    useListaDeParticipantes: jest.fn(),
  };
});

const mockNavegacao = jest.fn();
const mockSorteio = jest.fn();

jest.mock("react-router-dom", () => {
  return {
    useNavigate: () => mockNavegacao,
  };
});

jest.mock("../state/hook/useSorteador", () => {
  return {
    useSorteador: () => mockSorteio,
  };
});

describe("quando não existem participantes suficientes", () => {
  beforeEach(() => {
    (useListaDeParticipantes as jest.Mock).mockReturnValue([]);
  });

  test("a brincadeira não pode ser iniciada", () => {
    //renderizar componente

    render(
      <RecoilRoot>
        <Rodape />
      </RecoilRoot>
    );

    //Validando se o botão está desabilitado
    const botao = screen.getByRole("button");

    //Espera-se que esteja desabilitado
    expect(botao).toBeDisabled();
  });
});

describe("quando existe participantes", () => {
  beforeEach(() => {
    (useListaDeParticipantes as jest.Mock).mockReturnValue([
      "Ana",
      "Catarina",
      "José",
    ]);
  });

  test("a brincadeira pode ser inciada", () => {
    render(
      <RecoilRoot>
        <Rodape />
      </RecoilRoot>
    );

    const botao = screen.getByRole("button");

    //Espera-se que está habilitado
    expect(botao).not.toBeDisabled();
  });

  test("a brincadeira foi inciada", () => {
    render(
      <RecoilRoot>
        <Rodape />
      </RecoilRoot>
    );

    const botao = screen.getByRole("button");

    //Criando evento de click
    fireEvent.click(botao);

    //Espera-se que o mock tenha sido chamado 1 vez
    expect(mockNavegacao).toHaveBeenCalledTimes(1)
    //Verificando a URL que foi redirecionada
    expect(mockNavegacao).toHaveBeenCalledWith('/sorteio')
    expect(mockSorteio).toHaveBeenCalledTimes(1)
  });
});
