#!/bin/bash
set -e
export PATH="/usr/lib/ccache:/usr/local/opt/ccache/libexec:$PATH"
CURRENT_REF="$(git rev-parse HEAD)"
rm -rf emscripten_builder
git clone https://github.com/lvgl/lv_sim_emscripten.git emscripten_builder
scripts/genexamplelist.sh > emscripten_builder/examplelist.c
cd emscripten_builder
git checkout 45e0bc5c8d3e55cfbcaf8214361d2335b8b9a7b4
git submodule update --init -- lvgl
cd lvgl
#git checkout $CURRENT_REF
# git checkout 0ad639eee6b92799dd223dd0fac6c932a84b4c0f # https://github.com/lvgl/lvgl/commits/release/v8.1/
git checkout fc98bf7f3cceb5b08a176520c0699b391628fe47 # https://github.com/lvgl/lvgl/commits/release/v8.2/
cd ..
git submodule update --init -- lv_drivers
mkdir cmbuild
cd cmbuild
emcmake cmake .. -DLVGL_CHOSEN_DEMO=lv_example_noop -DCMAKE_C_COMPILER_LAUNCHER=ccache -DCMAKE_CXX_COMPILER_LAUNCHER=ccache
emmake make -j$(nproc)
rm -rf CMakeFiles
cd ../..
cp -a emscripten_builder/cmbuild docs/_static/built_lv_examples
