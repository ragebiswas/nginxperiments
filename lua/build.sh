#wget 'http://nginx.org/download/nginx-1.11.2.tar.gz'
#tar -xzvf nginx-1.11.2.tar.gz
cd nginx-1.11.2/

# tell nginx's build system where to find LuaJIT 2.0:
export LUAJIT_LIB=/usr/lib/x86_64-linux-gnu
export LUAJIT_INC=/usr/include/luajit-2.0

# tell nginx's build system where to find LuaJIT 2.1:
# export LUAJIT_LIB=/path/to/luajit/lib
# export LUAJIT_INC=/path/to/luajit/include/luajit-2.1

# or tell where to find Lua if using Lua instead:
#export LUA_LIB=/path/to/lua/lib
#export LUA_INC=/path/to/lua/include

# Here we assume Nginx is to be installed under /opt/nginx/.
./configure --prefix=/home/raj/ng/nginx \
 --with-ld-opt="-Wl,-rpath,/usr/lib/x86_64-linux-gnu" \
 --add-module=/home/raj/ng/ngx_devel_kit-0.3.0/ \
 --add-module=/home/raj/ng/lua-nginx-module-0.10.6/

make -j2
make install
