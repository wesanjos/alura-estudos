import Box from "@src/components/Box/Box";
import Icon from "@src/components/Icon/Icon";
import Image from "@src/components/Image/Image";
import Link from "@src/components/Link/Link";
import Text from "@src/components/Text/Text";
import React from "react";

interface FeedProps {
  children: React.ReactNode;
}

export default function Feed({ children }) {
  return (
    <Box>
      <Image
        styleSheet={{
          width: "128px",
          height: "128px",
          borderRadius: "100%",
        }}
        src="https://github.com/wesanjos.png"
        alt="Wesley Anjos"
      />

      <Link href="https://youtube.com">
        <Icon name="youtube" size="md" />
      </Link>

      <Icon name="twitter" size="md" />
      <Icon name="instagram" size="md" />
      <Icon name="github" size="md" />

      <Text tag="h3">Feed Base</Text>

      {children}
    </Box>
  );
}

Feed.Header = () => {
  return (
    <Box>
      <Text tag="h3">Feed Header</Text>
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
