#!/bin/bash
VERSION=1.2.0
FILE="hbase-${VERSION}-bin.tar.gz"

wget --quiet http://archive.eu.apache.org/dist/hbase/${VERSION}/${FILE}
tar -xzf "${FILE}" -C /opt/
ln -s /opt/hbase-${VERSION} /opt/hbase
rm "${FILE}"
