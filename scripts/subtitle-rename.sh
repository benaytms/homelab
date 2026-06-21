#!/bin/bash

# because of Jellyfin usage of the ISO 639-1 standard for languages
# when there's a "pt-BR" in a file name, it thinks it's for Breton (br) instead of portuguese-brazilian
# so i have to rename all pt-BR subtitles to show portuguese and not breton.

# Rename pt-BR to pt
# first the main storage
fdfind '.*\.(pt-BR|pt-br).*\.srt' <my-main-storage> -X rename -v 's/.(pt-BR|pt-br)/\.pt/' {}

# then the second and third ones
fdfind '.*\.(pt-BR|pt-br).*\.srt' <my-second-storage> -X rename -v 's/\.(pt-BR|pt-br)/\.pt/' {}
fdfind '.*\.(pt-BR|pt-br).*\.srt' <my-third-storage> -X rename -v 's/\.(pt-BR|pt-br)/\.pt/' {}

# then the notebook lastly
fdfind '.*\.(pt-BR|pt-br).*\.srt' <notebook-nfs-storage>  -X rename -v 's/\.(pt-BR|pt-br)/\.pt/' {}
