# Homelab

A self-hosted homelab running on my personal machine (Ryzen 5 5600X / RX 6700 XT), 
managed entirely with Docker Compose. It covers media, AI, photo and file sync, security, 
notifications, and a few other things — all running locally and accessible remotely via Tailscale.


## Services

The stack is built around a few core pillars:

- **Media** —> [Jellyfin](https://jellyfin.org/) handles video streaming with GPU transcoding. 
The arr stack ([Radarr](https://wiki.servarr.com/radarr), [Sonarr](https://wiki.servarr.com/en/sonarr), [Lidarr](https://wiki.servarr.com/en/lidarr), [Bazarr](https://github.com/morpheus65535/bazarr)) automates media management.<br>
The Portuguese Brazilian subtitles tend to be very thin for more niche shows and movies, so a solution i found was to use AI-powered translation via [Ollama](https://hub.docker.com/r/ollama/ollama),
running on a local instance. Although it's not perfect, it's good enough for a few occasions. [Lingarr](https://github.com/lingarr-translate/lingarr) is the tool that manages those translations.
I also use [Invidious](https://github.com/iv-org/invidious) as an open-source front-end for YouTube.

- **Music** —> [Navidrome](https://github.com/navidrome/navidrome) serves as a music server with lastfm scrobbling and lyrics support via this [plugin](https://github.com/J0R6IT0/navidrome-lyrics-plugin). 
Slskd provides access to the [Soulseek](https://www.slsknet.org/news/) network for music discovery.

- **AI** —> Ollama, like i mentioned earlier, runs a local LLM instance and even though i just use for subtitle translation,
considering it can be very heavy, it does work like a normal chatbot as well. 

- **Search engine** —> [SearXNG](https://github.com/searxng/searxng) is the one i use. It's a self-hosted metasearch engine, i.e., it integrates results from multiple search engines.

- **Security** -> [Caddy](https://github.com/caddyserver/caddy) acts as a reverse proxy. [Tailscale](https://tailscale.com/) is used as a mesh VPN to allow exclusive access to each service.
[Pi-Hole](https://pi-hole.net/) is a network-level ad and tracker blocker.

- **Infrastructure** —> [Ntfy](https://github.com/binwiederhier/ntfy) handles push notifications. [Uptime Kuma](https://github.com/louislam/uptime-kuma) monitors service health. [Portainer](https://github.com/portainer/portainer) serves as a container management interface. [Watchtower](https://github.com/nicholas-fedor/watchtower) as a schedule-based container auto-updater. [Dozzle](https://dozzle.dev/) was also added as a log aggregator - making it easier to manage the multiple container's logs.

- **Password manager** —> [Vaultwarden](https://github.com/dani-garcia/vaultwarden) is a self-hosted Bitwarden-compatible password manager. Which is great because
it allows me to use the Bitwarden extension on my browser without having to rely on external servers to store my passwords.

- **Files & Sync** —> [Immich](https://github.com/immich-app/immich) for photo management. [Syncthing](https://syncthing.net/) for file sync across devices. [Filebrowser](https://github.com/filebrowser/filebrowser) for remote file access. [Paperless-ngx](https://github.com/paperless-ngx/paperless-ngx) as a document management and aggregator application. [LazyLibrarian](https://github.com/linuxserver/docker-lazylibrarian) allows you to follow authors and grab metadata for e-books.
[Calibre-Web](https://github.com/linuxserver/docker-calibre-web) serves as a books management and display service.

- **Note-taking** -> [Joplin](https://github.com/linuxserver/docker-joplin) is a note-taking application organized by notebooks - it's very simple and straightforward.
[Affine](https://github.com/toeverything/docker) is an alternative to Joplin with a little more flair for when i'm feeling fancy.

- **Minecraft** —> Minecraft server powered by [Fabric](https://fabricmc.net/) for me and my friends, 
running via the [itzg/minecraft-server](https://github.com/itzg/docker-minecraft-server) image. 
Unlike the rest of the stack which stays behind Tailscale — 
Minecraft's raw TCP protocol doesn't play well with the HTTP reverse proxy setup the other services use, so instead i use an exposed port forwarding with DNS SRV record 
(for a nice domain name instead of the IP and port number).

## Why

It started with me being fed-up with subscription services, then it became more about freedom.. 
About not wanting to depend on companies that don't share your values, about owning your own data, 
the freedom to share resources with people. There's also some stubbornness to it. 
The kind of "I'll do it this way because i can" that comes from being tired of lack of ownership and planned obsolescence
that comes with modern tech.

The same thinking led to the URBS GTFS project. 
Looking for a Google Maps replacement with decent transit info for Curitiba, 
i found that URBS wasn't on the Mobility Database at all - which is the global standard for open transit data. 
So I built the feed myself. Ideally it would be a GTFS Realtime, but URBS doesn't expose a public API — 
that's reserved for a handful of companies, Google included. But anything is still better than nothing.
