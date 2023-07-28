import React from "react";
import theme, { ThemeTypographyVariants } from "@src/theme/theme";
import { StyleSheet } from "@src/theme/StyleSheet";
import { BaseComponent } from "@src/theme/BaseComponent";
import { useTheme } from "@src/theme/ThemeProvider";

interface TextProps {
  variant?: ThemeTypographyVariants;
  styleSheet?: StyleSheet;
  tag: "p" | "li" | "h1";
  children: React.ReactNode;
}

export default function Text({ styleSheet, variant, ...props }: TextProps) {
  const theme = useTheme();
  const textVariant = theme.typography.variants[variant];

  return (
    <BaseComponent
      {...props}
      styleSheet={{
        fontFamily: theme.typography.fontFamily,
        ...textVariant,
        ...styleSheet,
      }}
    />
  );
}

Text.defaultProps = {
  tag: "p",
  variant: "body2",
};
