import Box from "@src/components/Box";
import theme from "@src/theme/theme";

export default function HomeScreen() {
  return (
    <Box
      styleSheet={{
        fontFamily: theme.typography.fontFamily,
        backgroundColor: {
          xs: "red",
          md: "blue",
        },
      }}
      tag="main"
    >
      Hello World
    </Box>
  );
}
