#!/binn/bash

cat > show-info.sh <<EOF

#!/bin/bash

cat -e <<HEREDOC
The current directory is: \$PWD
The default paths are: \$PATH
The current user is: \$USERNAME
HEREDOC
EOF
chmod +x show-info.sh
