import { customRender } from "@alura-estudo/test-commons/react-testing-library";
import { HomeScreen } from "./HomeScreen";

const render = customRender((props) => {
  return <section>{props.children}</section>;
});

describe("<HomeScreen/>", () => {
  it("renders the page", () => {
    const { container } = render(<HomeScreen />);

    expect(container).toMatchInlineSnapshot(`
      .c0 {
        font-family: sans-serif;
      }

      <div>
        <section>
          <main>
            <h1
              class="c0"
            >
              Home Screen
            </h1>
            <p
              class="c0"
            >
              Importação de módulo local: @alura/utils/math 
              4
            </p>
          </main>
        </section>
      </div>
    `);
  });
});
