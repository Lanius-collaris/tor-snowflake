SNOWFLAKE_DIR=$(pwd)
cd ..
wget -O - https://codeload.github.com/pion/sctp/tar.gz/37fef17855bc720b31c09e8c8643aa67122aff7e | tar -xz
cd sctp-37fef17855bc720b31c09e8c8643aa67122aff7e/
patch -p 1 < $SNOWFLAKE_DIR/snowflake-sctp.patch
cd $SNOWFLAKE_DIR
go mod tidy
