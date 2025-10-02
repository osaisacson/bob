import { apiInitializer } from "discourse/lib/api";
import CustomHomepage from "../components/custom-homepage";
import CategoryGemenskaper from "../components/category-gemenskaper";

export default apiInitializer((api) => {
  api.renderInOutlet("above-main-container", CustomHomepage);
  api.renderInOutlet("discovery-list-container-top", CategoryGemenskaper);
});