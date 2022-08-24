filename=fonts_and_wallpaper
url=$(curl -s https://api.github.com/repos/coni/dot/releases/latest | grep "browser_download_url" | cut -d : -f 2,3 | tr -d \")
curl -L $url -o /tmp/$filename.tar.gz
tar xf /tmp/$filename.tar.gz -C /tmp/
cp -r /tmp/$filename/.config/ $HOME/
cp -r /tmp/$filename/.fonts/ $HOME/
rm -rf /tmp/$filename*
