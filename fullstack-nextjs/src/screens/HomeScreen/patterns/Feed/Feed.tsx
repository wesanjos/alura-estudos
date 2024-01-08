import Box from "@src/components/Box/Box";
import Button from "@src/components/Button/Button";
import Icon from "@src/components/Icon/Icon";
import Image from "@src/components/Image/Image";
import Link from "@src/components/Link/Link";
import Text from "@src/components/Text/Text";
import { useTheme } from "@src/theme/ThemeProvider";
import React from "react";

interface FeedProps {
  children: React.ReactNode;
}

export default function Feed({ children }) {
  const theme = useTheme();

  return (
    <Box
      styleSheet={{
        width: "100%",
        backgroundColor: theme.colors.neutral.x000,
        marginTop: "-228px",
        maxWidth: "683px",
        borderRadius: "8px",
        paddingVertical: "40px",
        paddingHorizontal: "32px",
      }}
    >
      {children}
    </Box>
  );
}

Feed.Header = () => {
  const theme = useTheme();

  return (
    <Box
      styleSheet={{
        borderBottom: `1px solid ${theme.colors.neutral.x200}`,
        marginBottom: "24px",
      }}
    >
      <Box
        styleSheet={{
          flexDirection: "row",
          justifyContent: "space-between",
          gap: "16px",
          marginBottom: "16px",
        }}
      >
        <Button.Base href="https://github.com/wesanjos">
          <Image
            styleSheet={{
              width: { xs: "100px", md: "128px" },
              height: { xs: "100px", md: "128px" },
              borderRadius: "100%",
            }}
            src="https://github.com/wesanjos.png"
            alt="Wesley Anjos"
          />
          <Text tag="h1" variant="heading4">
            Wesley Anjos
          </Text>
        </Button.Base>

        <Box
          styleSheet={{
            justifyContent: "flex-start",
            gap: "16px",
          }}
        >
          <Button fullWidth colorVariant="primary" size="xl">
            Newsletter
          </Button>
          <Button fullWidth colorVariant="neutral" size="xl">
            Buy my a coffee
          </Button>
        </Box>
      </Box>

      <Link href="https://youtube.com">
        <Icon name="youtube" size="md" />
      </Link>

      <Icon name="twitter" size="md" />
      <Icon name="instagram" size="md" />
      <Icon name="github" size="md" />
    </Box>
  );
};

Feed.Posts = () => {
  return (
    <Box>
      <Text tag="h2">Feed Posts</Text>
    </Box>
  );
};
