# cleared comments to keep things simple

  # CMAKE_INSTALL_BINDIR
  # CMAKE_INSTALL_LIBDIR
  # CMAKE_INSTALL_INCLUDEDIR

  # CMAKE_INSTALL_SBINDIR
  # CMAKE_INSTALL_LIBEXECDIR
  # CMAKE_INSTALL_SYSCONFDIR
  # CMAKE_INSTALL_SHAREDSTATEDIR
  # CMAKE_INSTALL_LOCALSTATEDIR
  # CMAKE_INSTALL_RUNSTATEDIR

  # CMAKE_INSTALL_INCLUDEDIR
  # CMAKE_INSTALL_OLDINCLUDEDIR
  # CMAKE_INSTALL_DATAROOTDIR
  # CMAKE_INSTALL_DATADIR
  # CMAKE_INSTALL_INFODIR
  # CMAKE_INSTALL_LOCALEDIR
  # CMAKE_INSTALL_MANDIR
  # CMAKE_INSTALL_DOCDIR

# macro(MyInstallDirs_set_common_dir_values PREFIX SUFFIX)
macro(MyInstallDirs_set_common_dir_values)
_MyInstallDirs_force_set(CMAKE_INSTALL_LIBDIR "lib"
  "User libraries (bin)"
)
_MyInstallDirs_force_set(CMAKE_INSTALL_BINDIR "bin"
  "User executables (bin)")
_MyInstallDirs_force_set(CMAKE_INSTALL_SBINDIR "sbin"
  "System admin executables (sbin)")
_MyInstallDirs_force_set(CMAKE_INSTALL_LIBEXECDIR "libexec"
  "Program executables (libexec)")
_MyInstallDirs_force_set(CMAKE_INSTALL_SYSCONFDIR "etc"
  "Read-only single-machine data (etc)")
_MyInstallDirs_force_set(CMAKE_INSTALL_SHAREDSTATEDIR "com"
  "Modifiable architecture-independent data (com)")
_MyInstallDirs_force_set(CMAKE_INSTALL_LOCALSTATEDIR "var"
  "Modifiable single-machine data (var)")

_MyInstallDirs_force_set(CMAKE_INSTALL_INCLUDEDIR "include"
  "C header files (include)")
_MyInstallDirs_force_set(CMAKE_INSTALL_OLDINCLUDEDIR "/usr/include"
  "C header files for non-gcc (/usr/include)")
_MyInstallDirs_force_set(CMAKE_INSTALL_DATAROOTDIR "share"
  "Read-only architecture-independent data root (share)")
endmacro()

macro(_MyInstallDirs_force_set var default description)
    set(${var} "${default}" CACHE PATH "${description}")
endmacro()
