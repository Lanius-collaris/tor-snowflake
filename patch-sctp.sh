SNOWFLAKE_DIR=$(pwd)
cd ..
wget -O - https://codeload.github.com/pion/sctp/tar.gz/6fcb82c121a894af4341243c7d502bc415547b26 | tar -xz
cd sctp-6fcb82c121a894af4341243c7d502bc415547b26/
patch -p 1 < $SNOWFLAKE_DIR/snowflake-sctp.patch
cd $SNOWFLAKE_DIR
go mod tidy
