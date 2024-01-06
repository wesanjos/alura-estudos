import React, { useRef } from "react";
import styled from "styled-components";
import { useRipple } from "react-use-ripple";

import { ThemeTypographyVariants } from "@src/theme/theme";
import Text from "../Text/Text";
import { StyleSheet } from "@src/theme/StyleSheet";
import { useRouter } from "next/router";

const StyledButton = styled(Text)<any>``;

export interface ButtonBaseProps {
  href?: string;
  children: React.ReactNode;
  textVariant?: ThemeTypographyVariants;
  styleSheet?: StyleSheet;
  onClick?: (event: React.MouseEvent<HTMLButtonElement>) => void;
}

export default function ButtonBase({
  href,
  children,
  textVariant,
  styleSheet,
  ...props
}: ButtonBaseProps) {
  const ref = useRef();
  const router = useRouter();
  const isLink = Boolean(ref);

  const Tag = isLink ? "a" : "button";

  useRipple(ref, {
    animationLength: 600,
    rippleColor: "rgba(255, 255, 255, 0.7)",
  });

  return (
    <StyledButton
      ref={ref}
      href={href}
      tag={Tag}
      {...props}
      styleSheet={{
        border: "0",
        backgroundColor: "transparent",
        color: "inherit",
        outline: "0",
        cursor: "pointer",
        textDecoration: "none",
        ...styleSheet,
      }}
      onClick={(event) => {
        isLink && event.preventDefault();

        if (!href) return false;

        isLink && router.push(href);

        !isLink && props.onClick && props.onClick(event);
      }}
    >
      {children}
    </StyledButton>
  );
}
