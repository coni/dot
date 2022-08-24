filename=themes
url=$(curl -s https://api.github.com/repos/coni/dot/releases/latest | grep "\"browser_download_url\".*themes.*" | cut -d : -f 2,3 | tr -d \")
curl -L $url -o /tmp/$filename.tar.gz
tar xf /tmp/$filename.tar.gz -C /tmp/
cp -r /tmp/.themes/ $HOME/
rm -rf /tmp/.themes/ /tmp/$filename
