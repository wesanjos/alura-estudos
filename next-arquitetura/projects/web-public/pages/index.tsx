import { Text } from "@alura-estudo/design-system/components/Text";
import { sum } from "@alura-estudo/utils/math/sum";

export default function HomeScreen() {
  return (
    <main>
      <Text tag="h1">Home Screen</Text>
      <Text tag="p">
        Importação de módulo local: @alura/utils/math {sum(2, 2)}
      </Text>
    </main>
  );
}
