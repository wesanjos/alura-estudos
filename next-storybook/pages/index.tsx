import ThemeProvider from "../src/theme/ThemeProvider";
import Button from "../src/components/Button/Button";

export default function HomeScreen() {
  return (
    <ThemeProvider>
      <div>
        <h1>Hello World, Storybook</h1>

        <Button variant="accent">Text example</Button>
      </div>
    </ThemeProvider>
  );
}
