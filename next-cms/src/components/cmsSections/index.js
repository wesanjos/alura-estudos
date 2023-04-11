import { Footer } from "../commons/Footer";
import { Menu } from "../commons/Menu";
import { PageFAQDisplayQuestionsSection } from "./PageFAQDisplayQuestionsSection";
import { PageHomeHeroSectionRecord } from "./PageHomeHeroSectionRecord";
import { SeoBlock } from "./SeoBlock";

export const cmsSections = {
  CommonSeoBlockRecord: SeoBlock,
  CommonMenuRecord: (props) => <Menu {...props} />,
  PagehomeHerosectionRecord: PageHomeHeroSectionRecord,
  CommonFooterRecord: (props) => <Footer {...props} />,
  PagefaqDisplayquestionSectionRecord: PageFAQDisplayQuestionsSection,
};