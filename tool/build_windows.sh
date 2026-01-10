if [ "$1" = "x64" ]; then
  rustup target add x86_64-pc-windows-msvc
  cargo build --target x86_64-pc-windows-msvc --release
  mv "target/x86_64-pc-windows-msvc/release/isar.dll" "isar_windows_x64.dll"
else
  echo "Building for Windows arm64 with fixed Rust 1.88.0"
  RUST_TOOLCHAIN="1.88.0-aarch64-pc-windows-msvc"
  rustup target add aarch64-pc-windows-msvc --toolchain $RUST_TOOLCHAIN
  rustup run $RUST_TOOLCHAIN rustc --version
  rustup run $RUST_TOOLCHAIN cargo --version
  rustup run $RUST_TOOLCHAIN cargo build --target aarch64-pc-windows-msvc --release
  mv "target/aarch64-pc-windows-msvc/release/isar.dll" "isar_windows_arm64.dll"
fi
