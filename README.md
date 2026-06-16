# Homelab

A self-hosted homelab running on a my personal machine (Ryzen 5 5600X / RX 6700 XT), 
managed entirely with Docker Compose. It covers media, AI, photo and file sync, security, 
notifications, and a few others — all running locally and accessible remotely via Tailscale.


## Services

The stack is built around a few core pillars:
Media — Jellyfin handles video streaming with hardware-accelerated transcoding via the RX 6700 XT. 
The arr stack (Radarr, Sonarr, Lidarr, Bazarr) automates media management, with Prowlarr as the indexer aggregator and qBittorrent as the download client. 

The subtitles for portuguese-brazilian is very lacking for more niche tv shows and movies, so a solution
i found was to use AI-powered subtitle translation via Ollama, and although not perfect, it's good
enough for a few occasions. Lingarr is the tool that manages the translations.

Music — Navidrome serves as a self-hosted music server with Last.fm scrobbling and lyrics support via plugin. 
Slskd provides access to the Soulseek network for music discovery.

AI — Ollama runs local LLMs with GPU acceleration - i use mostly just for subtitle translation considering it's very heavy, but it does work like a normal chatbot as well. 

Search engine - SearXNG is a self-hosted search backend that integrates results from multiple search engines.

Infrastructure — Caddy acts as a reverse proxy. Ntfy handles push notifications. Uptime Kuma monitors service health. 

Password manager - Vaultwarden is a self-hosted Bitwarden-compatible password manager.

Files & Sync — Immich for photo management, Syncthing for file sync across devices, Filebrowser for remote file access, Kavita for ebooks.

## Why

It started with me being fed-up with subscription services, then it became more about freedom.. 
About not wanting to depend on companies that don't share your values, about owning your own data, 
the freedom to share resources with people. There's also some stubbornness in it. 
The kind of "I'll do it myself because i can" that comes from being tired of walled gardens 
and planned obsolescence.

The same thinking led to the URBS GTFS project. 
Looking for a Google Maps replacement with decent transit info for Curitiba, 
i found that URBS wasn't on the Mobility Database at all. So I built the feed myself. 
Ideally it would be GTFS Realtime, but URBS doesn't expose a public API — 
that's reserved for a handful of companies, Google included. But something is still better than nothing.
