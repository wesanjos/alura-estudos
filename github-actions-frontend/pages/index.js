import NextLink from "next/link";

export default function HomeScreen() {
  return (
    <div>
      <h1>GitHub Actions - Home</h1>
      <NextLink href="/sobre">
        <a>Ir para sobre</a>
      </NextLink>
    </div>
  );
}
