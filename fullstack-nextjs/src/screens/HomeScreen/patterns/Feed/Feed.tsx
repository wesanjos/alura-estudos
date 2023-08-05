import Box from "@src/components/Box/Box";
import Icon from "@src/components/Icon/Icon";
import Text from "@src/components/Text/Text";
import React from "react";

interface FeedProps {
  children: React.ReactNode;
}

export default function Feed({ children }) {
  return (
    <Box>
      <Icon name="youtube" size="md" />
      <Icon name="twitter" size="md" />
      <Icon name="instagram" size="md" />
      <Icon name="github" size="md" />

      <Text>Feed Base</Text>

      {children}
    </Box>
  );
}

Feed.Header = () => {
  return (
    <Box>
      <Text>Feed Header</Text>
    </Box>
  );
};

Feed.Posts = () => {
  return (
    <Box>
      <Text>Feed Posts</Text>
    </Box>
  );
};
