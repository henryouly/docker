docker run \
    -v /mnt/data:/srv \
    -v "$(pwd)/data/database.db:/database.db" \
    -v "$(pwd)/config/filebrowser.json:/.filebrowser.json" \
    -p 6802:80 \
    filebrowser/filebrowser:pi
