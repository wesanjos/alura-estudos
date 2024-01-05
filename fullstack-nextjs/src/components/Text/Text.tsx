import React from "react";
import theme, { ThemeTypographyVariants } from "@src/theme/theme";
import { StyleSheet } from "@src/theme/StyleSheet";
import { BaseComponent } from "@src/theme/BaseComponent";
import { useTheme } from "@src/theme/ThemeProvider";

interface TextProps {
  variant?: ThemeTypographyVariants;
  styleSheet?: StyleSheet;
  tag: "p" | "li" | "h1" | string;
  children: React.ReactNode;
  ref: any;
}

const Text = React.forwardRef(
  ({ tag, styleSheet, variant, ...props }: TextProps, ref) => {
    const theme = useTheme();
    const textVariant = theme.typography.variants[variant];

    return (
      <BaseComponent
        as={tag}
        {...props}
        styleSheet={{
          fontFamily: theme.typography.fontFamily,
          ...textVariant,
          ...styleSheet,
        }}
        ref={ref}
      />
    );
  }
);

Text.defaultProps = {
  tag: "p",
  variant: "body2",
};

export default Text;
