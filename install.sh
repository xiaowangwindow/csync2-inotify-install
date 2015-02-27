#/bin/bash
cp *.tar.* /usr/local/src/
cd /usr/local/src/

tar zxvf libgpg-error-1.7.tar.gz
cd libgpg-error-1.7
sudo ./configure && make && make install
cd ..
tar zxvf libgcrypt-1.4.4.tar.gz
cd libgcrypt-1.4.4
sudo ./configure --with-gpg-error-prefix=/usr/local && make && make install
cd ..
tar zxvf libtasn1-2.1.tar.gz
cd libtasn1-2.1
sudo ./configure && make && make install
cd ..
tar zxvf sqlite-2.8.17.tar.gz
cd sqlite-2.8.17
sudo ./configure && make && make install
cd ..
tar zxvf librsync-0.9.7.tar.gz
cd librsync-0.9.7
sudo ./configure && make && make install
cd ..
tar jxvf gnutls-2.6.6.tar.bz2
cd gnutls-2.6.6
sudo ./configure --with-libgcrypt-prefix=/usr/local/ && make && make install
cd ..
sudo echo "/usr/local/lib" >> /etc/ld.so.conf
ldconfig
tar zxvf csync2-1.34.tar.gz
cd csync2-1.34
sudo ./configure && make && make install && make cert
cd ..
tar zxvf inotify-tools-3.13.tar.gz
cd inotify-tools-3.13
sudo ./configure && make && make install
