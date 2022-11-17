import { fireEvent, render, screen } from "@testing-library/react";
import { act } from "react-dom/test-utils";
import { RecoilRoot } from "recoil";
import Formulario from "./Formulario";

describe("comportamento do formulário.tsx", () => {
  test("quando o input está vazio, novos participantes não podem ser adicionados", () => {
    render(
      <RecoilRoot>
        <Formulario />
      </RecoilRoot>
    );

    //Encontrar no DOM o input
    const input = screen.getByPlaceholderText(
      "Insira os nomes dos participantes"
    );

    //Encontrar o botão de submit
    const button = screen.getByRole("button");

    //Garantir que o input esteja no documento
    expect(input).toBeInTheDocument();

    //Garantia que o botão esteja desabilitado
    expect(button).toBeDisabled();
  });

  test("adicionar um participante caso existe um nome preenchido", () => {
    render(
      <RecoilRoot>
        <Formulario />
      </RecoilRoot>
    );

    const input = screen.getByPlaceholderText(
      "Insira os nomes dos participantes"
    );
    const button = screen.getByRole("button");

    //Inserção de valor no input - Simulação
    fireEvent.change(input, {
      target: {
        value: "Wesley Anjos",
      },
    });

    //Evento de click no submit
    fireEvent.click(button);

    //Garantir que o input esteja com o foco ativo
    expect(input).toHaveFocus();

    //Garantir que o input não tenha um valor
    expect(input).toHaveValue("");
  });

  test("nomes duplicados não podem ser adicionados na lista", () => {
    render(
      <RecoilRoot>
        <Formulario />
      </RecoilRoot>
    );

    const input = screen.getByPlaceholderText(
      "Insira os nomes dos participantes"
    );
    const button = screen.getByRole("button");

    fireEvent.change(input, {
      target: {
        value: "Wesley Anjos",
      },
    });

    fireEvent.click(button);
    fireEvent.change(input, {
      target: {
        value: "Wesley Anjos",
      },
    });

    fireEvent.click(button);

    const mensagemDeErro = screen.getByRole("alert");

    expect(mensagemDeErro.textContent).toBe(
      "Nomes duplicados não são permitidos!"
    );
  });

  test("mensagem de erro sumir após os timers", () => {
    jest.useFakeTimers();

    render(
      <RecoilRoot>
        <Formulario />
      </RecoilRoot>
    );

    const input = screen.getByPlaceholderText(
      "Insira os nomes dos participantes"
    );
    const button = screen.getByRole("button");

    fireEvent.change(input, {
      target: {
        value: "Wesley Anjos",
      },
    });

    fireEvent.click(button);
    fireEvent.change(input, {
      target: {
        value: "Wesley Anjos",
      },
    });

    fireEvent.click(button);

    let mensagemDeErro = screen.queryByRole("alert");

    expect(mensagemDeErro).toBeInTheDocument();

    //Esperar N segundos para sumir a mensagem
    act(() => {
      jest.runAllTimers();
    });
    mensagemDeErro = screen.queryByRole("alert");
    expect(mensagemDeErro).toBeNull();
  });
});
