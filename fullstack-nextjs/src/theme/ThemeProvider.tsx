import React from "react";
import theme, { Theme } from "./theme";
import { ThemeProvider as StyledThemeProvider, useTheme as useThemesStyled } from "styled-components";

interface ThemeProviderProps {
  children: React.ReactNode;
}

export function useTheme(): Theme {
  return useThemesStyled() as unknown as any;
}

export default function ThemeProvider({ children }: ThemeProviderProps) {
  return <StyledThemeProvider theme={theme}>{children}</StyledThemeProvider>;
}
