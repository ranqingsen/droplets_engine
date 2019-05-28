@if not exist %~dp0\Engine\Externals mkdir %~dp0\Engine\Externals

git clone https://github.com/ranqingsen/engine_external_library.git %~dp0\Engine\Externals\clang
SetX PATH "%~dp0\Engine\Externals\clang\clang\bin;%PATH%"


