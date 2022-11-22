import React from "react";
import { realizarSorteio } from "./realizarSorteio";

describe("dado um sorteio de um amigo secretro", () => {
  test("cada participante não sorteie o próprio nome", () => {
    const participantes = [
      "Ana",
      "Catarina",
      "Juliana",
      "João",
      "Naty",
      "Vinicius",
    ];

    const sorteio = realizarSorteio(participantes);

    participantes.forEach((participante) => {
      const amigoSecreto = sorteio.get(participante);

      expect(amigoSecreto).not.toEqual(participante);
    });
  });
});
