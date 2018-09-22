# name: AudioPlayer
# about: Run an audio player from a discourse category
# version: 0.1
# authors: marcw
# url: https://github.com/marcw/audio-player


register_asset "stylesheets/common/audio-player.scss"


enabled_site_setting :audio_player_enabled

PLUGIN_NAME ||= "AudioPlayer".freeze

after_initialize do
  
  # see lib/plugin/instance.rb for the methods available in this context
  

  module ::AudioPlayer
    class Engine < ::Rails::Engine
      engine_name PLUGIN_NAME
      isolate_namespace AudioPlayer
    end
  end

  

  
  require_dependency "application_controller"
  class AudioPlayer::ActionsController < ::ApplicationController
    requires_plugin PLUGIN_NAME

    before_action :ensure_logged_in

    def list
      render json: success_json
    end
  end

  AudioPlayer::Engine.routes.draw do
    get "/list" => "actions#list"
  end

  Discourse::Application.routes.append do
    mount ::AudioPlayer::Engine, at: "/audio-player"
  end
  
end
