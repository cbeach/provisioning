
SBT_REPO="deb https://dl.bintray.com/sbt/debian /"
if ! grep -q "$SBT_REPO" /etc/apt/sources.list.d/sbt.list
then
    echo $SBT_REPO | sudo tee -a /etc/apt/sources.list.d/sbt.list
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
    apt-get -y update
    apt-get install -y --allow-unauthenticated sbt
fi
