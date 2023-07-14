import React from "react";
import theme from "@src/theme/theme";
import { StyleSheet } from "@src/theme/StyleSheet";
import { BaseComponent } from "@src/theme/BaseComponent";

interface TextProps {
  variant?: "display1";
  styleSheet?: StyleSheet;
  tag: "p" | "li" | "h1" | string;
  children: React.ReactNode;
}

export default function Text({ styleSheet, variant, ...props }: TextProps) {
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
