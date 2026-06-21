#!/bin/bash

# Rename pt-BR to pt
# first the main storage
fdfind '.*\.(pt-BR|pt-br).*\.srt' <my-main-storage> -X rename -v 's/.(pt-BR|pt-br)/\.pt/' {}

# then the second and third ones
fdfind '.*\.(pt-BR|pt-br).*\.srt' <my-second-storage> -X rename -v 's/\.(pt-BR|pt-br)/\.pt/' {}
fdfind '.*\.(pt-BR|pt-br).*\.srt' <my-third-storage> -X rename -v 's/\.(pt-BR|pt-br)/\.pt/' {}

# then the notebook lastly
fdfind '.*\.(pt-BR|pt-br).*\.srt' <notebook-nfs-storage>  -X rename -v 's/\.(pt-BR|pt-br)/\.pt/' {}
