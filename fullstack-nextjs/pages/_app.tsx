import { AppProps } from "next/app";
import GlobalStyle from "@src/theme/GlobalStyle";
import { StyleSheetManager } from "styled-components";
import isPropValid from "@emotion/is-prop-valid";

export default function App({ Component, pageProps }: AppProps) {
  return (
    <>
      <StyleSheetManager
        enableVendorPrefixes
        shouldForwardProp={(propName, elementToBeRendered) => {
          return typeof elementToBeRendered === "string"
            ? isPropValid(propName)
            : true;
        }}
      >
        <GlobalStyle />
        <Component {...pageProps} />
      </StyleSheetManager>
    </>
  );
}
