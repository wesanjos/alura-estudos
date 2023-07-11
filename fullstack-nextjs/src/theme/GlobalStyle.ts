import { createGlobalStyle } from "styled-components";

const GlobalStyle = createGlobalStyle`
  html {
    min-height: 100%;
    display: flex;
    flex-direction: column
  }

  body {
    display: flex;
    flex: 1;
    flex-direction: column;
  }

  #__next {
    width: 100%;
    overflow: hidden;
    display: flex;
    flex: 1;
    flex-direction: column;
    flex-wrap: nowrap;
    justify-content: flex-start;
    align-content: flex-start;
    flex-shrink: 0
  }

  * {
    box-sizzing: border-box;
    margin: 0;
    padding: 0;
  }
`;

export default GlobalStyle;
