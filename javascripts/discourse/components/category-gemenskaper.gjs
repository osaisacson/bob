import Component from "@glimmer/component";
import { service } from "@ember/service";
import { tracked } from "@glimmer/tracking";
import { on } from "@ember/modifier";

export default class CategoryGemenskaper extends Component {
  @service router;
  @tracked shouldDisplay = false;

  constructor() {
    super(...arguments);
    this.router.on("routeDidChange", this.handleRouteChange);
    this.handleRouteChange();
  }

  willDestroy() {
    super.willDestroy(...arguments);
    this.router.off("routeDidChange", this.handleRouteChange);
  }

  handleRouteChange = () => {
    const targetUrls = [
      "/c/gemenskaper/5",
      "/tags/c/gemenskaper/5/p%C3%A5-g%C3%A5ng",
      "/tags/c/gemenskaper/5/%C3%B6ppet-f%C3%B6r-nya-medlemmar",
      "/tags/c/gemenskaper/5/realiserat",
    ];
    this.shouldDisplay = targetUrls.includes(this.router.currentURL);
  };

  setActiveFilter = (element) => {
    const currentPath = window.location.href;
    const links = element.querySelectorAll("a");
    links.forEach((link) => {
      if (link.href === currentPath) {
        link.classList.add("active-filter");
      } else {
        link.classList.remove("active-filter");
      }
    });
  };

  <template>
    {{#if this.shouldDisplay}}
      <ul
        class="custom-gemenskap-wrapper discourse-tags"
        {{on "insert" this.setActiveFilter}}
      >
        <a href="/c/gemenskaper/5" id="alla" class="custom-filter-btn">
          <span>Alla</span>
        </a>
        <a
          href="/tags/c/gemenskaper/5/på-gång"
          id="pa-gang"
          class="custom-filter-btn"
        >
          <span>På gång</span>
        </a>
        <a
          href="/tags/c/gemenskaper/5/realiserat"
          id="realiserade"
          class="custom-filter-btn"
        >
          <span>Realiserade</span>
        </a>
        <a
          href="/tags/c/gemenskaper/5/öppet-för-nya-medlemmar"
          id="oppet-for-nya-medlemmar"
          class="custom-filter-btn"
        >
          <span>Öppet för nya medlemmar</span>
        </a>
      </ul>
    {{/if}}
  </template>
}