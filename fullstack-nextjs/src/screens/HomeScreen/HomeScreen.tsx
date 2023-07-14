import Box from "@src/components/Box/Box";
import Background from "./patterns/Background/Background";
import Menu from "./patterns/Menu/Menu";
import Text from "@src/components/Text/Text";
import Feed from "./patterns/Feed/Feed";
import Footer from "./patterns/Footer/Footer";

export default function HomeScreen() {
  return (
    <Box tag="main">
      <Background />
      <Menu />
      <Feed>
        <Feed.Header />
        <Text tag="h1" variant="display1">Últimas atualizações</Text>
        <Feed.Posts />
      </Feed>
      <Footer />
    </Box>
  );
}
