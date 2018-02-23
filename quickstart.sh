# Install some basic commandline tools
apt-get -y install nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

apt-get -y install ranger
apt-get -y install tmux
apt-get -y install htop

curl https://sh.rustup.rs -sSf | sh
source ~/.bashrc

cargo update
cargo +nightly install clippy
cargo +nightly install rustfmt-preview
