# Homelab

A self-hosted homelab running on my personal machine (Ryzen 5 5600X / RX 6700 XT), 
managed entirely with Docker Compose. It covers media, AI, photo and file sync, security, 
notifications, and a few other things — all running locally and accessible remotely via Tailscale.


## Services

The stack is built around a few core pillars:

- **Media** —> [Jellyfin](https://jellyfin.org/) handles video streaming with transcoding using the GPU. 
The arr stack ([Radarr](https://wiki.servarr.com/radarr), [Sonarr](https://wiki.servarr.com/en/sonarr), [Lidarr](https://wiki.servarr.com/en/lidarr), [Bazarr](https://github.com/morpheus65535/bazarr)) automates media management, with [Prowlarr](https://github.com/Prowlarr/Prowlarr) as the indexer aggregator and qBittorrent as the download client.<br>
The subtitles for portuguese-brazilian is very lacking for more niche tv shows and movies, so a solution
i found was to use AI-powered subtitle translation via Ollama, and although not perfect, it's good
enough for a few occasions. [Lingarr](https://github.com/lingarr-translate/lingarr) is the tool that manages the translations.

- **Music** —> [Navidrome](https://github.com/navidrome/navidrome) serves as a self-hosted music server with Last.fm scrobbling and lyrics support via plugin. 
Slskd provides access to the [Soulseek](https://www.slsknet.org/news/) network for music discovery.

- **AI** —> [Ollama](https://setup-ollama.com/index) runs a local LLM with GPU acceleration - i use mostly just for subtitle translation considering it's very heavy, but it does work like a normal chatbot as well. 

- **Search engine** —> [SearXNG](https://github.com/searxng/searxng) is a self-hosted search backend that integrates results from multiple search engines.

- **Infrastructure** —> [Caddy](https://github.com/caddyserver/caddy) acts as a reverse proxy. [Ntfy](https://github.com/binwiederhier/ntfy) handles push notifications. [Uptime Kuma](https://github.com/louislam/uptime-kuma) monitors service health. [Tailscale](https://tailscale.com/) is used as a mesh vpn to allow only me getting access to each service.

- **Password manager** —> [Vaultwarden](https://github.com/dani-garcia/vaultwarden) is a self-hosted Bitwarden-compatible password manager.

- **Files & Sync** —> [Immich](https://github.com/immich-app/immich) for photo management,
[Syncthing](https://syncthing.net/) for file sync across devices, [Filebrowser](https://github.com/filebrowser/filebrowser) for remote file access, [Kavita](https://github.com/Kareadita/Kavita) for ebooks.

## Why

It started with me being fed-up with subscription services, then it became more about freedom.. 
About not wanting to depend on companies that don't share your values, about owning your own data, 
the freedom to share resources with people. There's also some stubbornness in it. 
The kind of "I'll do it myself because i can" that comes from being tired of lack of ownership and planned obsolescence.

The same thinking led to the URBS GTFS project. 
Looking for a Google Maps replacement with decent transit info for Curitiba, 
i found that URBS wasn't on the Mobility Database at all. So I built the feed myself. 
Ideally it would be GTFS Realtime, but URBS doesn't expose a public API — 
that's reserved for a handful of companies, Google included. But something is still better than nothing.
