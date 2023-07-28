import { AppProps } from "next/app";
import GlobalStyle from "@src/theme/GlobalStyle";
import { StyleSheetManager } from "styled-components";
import isPropValid from "@emotion/is-prop-valid";
import ThemeProviderWrapper from "@src/theme/ThemeProvider";

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
        <ThemeProviderWrapper>
          <GlobalStyle />
          <Component {...pageProps} />
        </ThemeProviderWrapper>
      </StyleSheetManager>
    </>
  );
}
