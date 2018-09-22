import { withPluginApi } from "discourse/lib/plugin-api";

function initializeAudioPlayer(api) {
  
  // see app/assets/javascripts/discourse/lib/plugin-api
  // for the functions available via the api object
    api.decorateWidget('hamburger-menu:before', () => {
        return '<h1>FOOBAR</h1>';
    })
}

export default {
  name: "audio-player",

  initialize() {
    withPluginApi("0.8.24", initializeAudioPlayer);
  }
};
