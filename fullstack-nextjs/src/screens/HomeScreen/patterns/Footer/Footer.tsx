import Box from "@src/components/Box/Box";
import Text from "@src/components/Text/Text";
import { useTheme } from "@src/theme/ThemeProvider";

export default function Footer() {
  const theme = useTheme();

  return (
    <Box
      styleSheet={{
        height: "100px",
        backgroundColor: theme.colors.neutral.x900,
        color: theme.colors.neutral.x000,
        width: "100%",
        alignItems: "center",
        justifyContent: "center",
        paddingHorizontal: "10px",
        paddingVertical: "10px",
        textAlign: "center",
      }}
    >
      <Text variant="body2" tag="p">
        Feito por Wesley Anjos
      </Text>
    </Box>
  );
}
