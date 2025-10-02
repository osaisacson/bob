import Component from "@glimmer/component";
import { service } from "@ember/service";
import { tracked } from "@glimmer/tracking";
import WhosOnline from "discourse/plugins/discourse-whos-online/discourse/components/whos-online";
import SearchMenu from "discourse/components/search-menu";

export default class CustomHomepage extends Component {
  @service router;
  @service siteSettings;
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
    const topMenuRoutes = this.siteSettings.top_menu
      .split("|")
      .map((route) => "/" + route);
    const homeRoute = topMenuRoutes[0];
    const currentUrl = this.router.currentURL;

    if (currentUrl === "/" || currentUrl === homeRoute) {
      document.documentElement.classList.add("custom-homepage");
      document.body.classList.remove(
        "tags-page",
        "tag-guider",
        "tag-banner"
      );
      this.shouldDisplay = true;
    } else {
      document.documentElement.classList.remove("custom-homepage");
      this.shouldDisplay = false;
    }
  };

  <template>
    {{#if this.shouldDisplay}}
      <div class="custom-homepage-wrapper mask-polygon">
        <div class="custom-welcome-banner">
          <h1 class="welcome-header-text">
            <span style="font-weight:200">Välkommen till Sveriges <br /></span>idéburna byggrörelse
          </h1>
          <p>Här kan du se färdiga och planerade projekt, hitta kunskap och få kontakt med andra som bygger och bor ihop över hela landet.</p>
        </div>
      </div>
     
      <WhosOnline />
      <SearchMenu />

      <div>
        <a href="/new-topic" class="btn btn-primary custom-add-new-btn" target="_blank" rel="noopener">
          + Lägg till nytt
        </a>
      </div>

      <div class="column-wrapper">

      <div class="links-column">

      <div class="special-links-wrapper">
        <div class="special-links-card-wrapper">
          <div class="special-links-card-map">
            <a href="https://bygg.boihop.co/c/gemenskaper/5/l/map?order=created"></a>
            <img src="https://bygg.boihop.co/uploads/default/original/1X/2148473e07bc3f9a6eb681a2d0b6eed0d048fd14.jpg" alt="" />
          </div>
          
          <div class="special-links-card">
            <a href="https://bygg.boihop.co/tag/%C3%B6ppet-f%C3%B6r-nya-medlemmar"></a>
            <img src="https://bygg.boihop.co/uploads/default/original/1X/f505404a0eaf8718bf52665c35112c9d703e3390.jpg" alt="" />
            <div class="card-details">
              <div class="topic-title" aria-hidden="true">Projekt som söker boende</div>
              <div class="topic-excerpt">
                Är du intresserad av att gå med i en bygg- eller bogemenskap? Här ser du projekt som söker medlemmar.
              </div>
            </div>
          </div>
          
          <div class="special-links-card">
            <a href="https://bygg.boihop.co/tag/hitta-mark"></a>
            <img src="https://bygg.boihop.co/uploads/default/original/1X/9cc08cd842d930ff3a5ad9d47c4c22e1f2947182.jpg" alt="" />
            <div class="card-details">
              <div class="topic-title" aria-hidden="true">Tillgänglig mark</div>
              <div class="topic-excerpt">
                Letar ni mark? Här hittar ni tips om vad som är tillgängligt.
              </div>
            </div>
          </div>
          
          <div class="special-links-card">
            <a href="https://bygg.boihop.co/u?order=likes_received&period=all"></a>
            <img src="https://bygg.boihop.co/uploads/default/original/1X/d8260602ec099bfd4d1653372d972a5d74b4f371.jpg" alt="" />
            <div class="card-details">
              <div class="topic-title" aria-hidden="true">Hitta varandra</div>
              <div class="topic-excerpt">
                Letar du efter någon? Här ser du alla som har registrerat sig på plattformen. 
              </div>
            </div>
          </div>

          <div class="special-links-card">
            <a href="https://bygg.boihop.co/invites/Bj4f1mYUD6"></a>
            <img src="https://bygg.boihop.co/uploads/default/original/1X/da43934e53e8aa0bd39485fdb10a81ba5545b0f9.jpeg" alt="" />
            <div class="card-details">
              <div class="topic-title" aria-hidden="true">Gå med i rörelsen</div>
              <div class="topic-excerpt">
                Har du ingen profil ännu? Registrera dig här så kan du börja lägga upp poster och interagera med andra. 
              </div>
            </div>
          </div>
          
          <div class="special-links-card">
            <a href="https://bygg.boihop.co/docs?category=7"></a>
            <img src="https://bygg.boihop.co/uploads/default/original/1X/18f5f69183db77f77c2a67acd6898fe41d18e2b5.jpg" alt="" />
            <div class="card-details">
              <div class="topic-title" aria-hidden="true">Upptäck biblioteket</div>
              <div class="topic-excerpt">
                Filtrera på det du specifikt söker.
              </div>
            </div>
          </div>

          </div>

<div class="feed-column">
</div>


      </div>


        </div>
      </div>

    {{/if}}
  </template>
}