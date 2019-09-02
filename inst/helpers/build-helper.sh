#!/bin/bash
# -*- sh-basic-offset: 2; sh-indentation: 2 -*-
# Helpers for running R pkg builds on builds.sr.ht
#
# https://git.sr.ht/~hrbrmstr/sourcehut/blob/master/inst/helpers/build-helper.sh

setup_locale() {
  
  echo "en_US.UTF-8 UTF-8" > loc

  sudo cp loc /etc/locale.gen
  sudo locale-gen --purge "en_US.UTF-8"
  sudo /usr/sbin/update-locale LANG=en_US.UTF-8

  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8
  export LANGUAGE=en_US.UTF-8

  rm -f loc

}

setup_cran_repo() {
  
  mkdir -p ~/packages

  echo 'options(repos = c(CRAN = "https://cloud.r-project.org"))' > ~/.Rprofile
  echo 'R_LIBS_USER=/home/build/packages' > ~/.Renviron

}

setup_compiler() {
 
  mkdir ~/.R
  echo "CFLAGS=" > ~/.R/Makevars
  echo "CPPFLAGS= " >> ~/.R/Makevars
  echo "CXXFLAGS=" >> ~/.R/Makevars
  echo "FCFLAGS=" >> ~/.R/Makevars
  echo "FFLAGS=" >> ~/.R/Makevars
  echo "GCJFLAGS=" >> ~/.R/Makevars
  echo "LDFLAGS =" >> ~/.R/Makevars
  echo "OBJCFLAGS=" >> ~/.R/Makevars
  echo "OBJCXXFLAGS=" >> ~/.R/Makevars 

}

setup_java() {

  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8
  export LANGUAGE=en_US.UTF-8

  sudo R CMD javareconf

}

install_deps() {

  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8
  export LANGUAGE=en_US.UTF-8

  Rscript -e "devtools::install_deps(pkg = '${R_PACKAGE}', upgrade = 'never', dependencies = TRUE)"

}

build_and_check() {

  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8
  export LANGUAGE=en_US.UTF-8

  export _R_CHECK_CRAN_INCOMING_=FALSE
  export _R_CHECK_URLS_USE_CURL_=FALSE
  export _R_CHECK_LENGTH_1_CONDITION_=TRUE
  export _R_CHECK_LENGTH_1_LOGIC2_=TRUE
  export _R_CHECK_TOPLEVEL_FILES_=TRUE
  export _R_CHECK_VC_DIRS_=TRUE
  export _R_CHECK_TIMINGS_=10
  export _R_CHECK_INSTALL_DEPENDS_=TRUE
  export _R_CHECK_SUGGESTS_ONLY_=TRUE
  export _R_CHECK_NO_RECOMMENDED_=TRUE
  export _R_CHECK_EXECUTABLES_EXCLUSIONS_=FALSE
  export _R_CHECK_DOC_SIZES2_=TRUE
  export _R_CHECK_CODE_ASSIGN_TO_GLOBALENV_=TRUE
  export _R_CHECK_CODE_ATTACH_=TRUE
  export _R_CHECK_CODE_DATA_INTO_GLOBALENV_=TRUE
  export _R_CHECK_CODE_USAGE_VIA_NAMESPACES_=TRUE
  export _R_CHECK_DOT_FIRSTLIB_=TRUE
  export _R_CHECK_DEPRECATED_DEFUNCT_=TRUE
  export _R_CHECK_REPLACING_IMPORTS_=TRUE
  export _R_CHECK_SCREEN_DEVICE_=stop
  export _R_CHECK_TOPLEVEL_FILES_=TRUE
  export _R_CHECK_S3_METHODS_NOT_REGISTERED_=TRUE
  export _R_CHECK_OVERWRITE_REGISTERED_S3_METHODS_=TRUE
  export _R_CHECK_PRAGMAS_=TRUE
  export _R_CHECK_CRAN_INCOMING_USE_ASPELL_=TRUE
  export _R_CHECK_COMPILATION_FLAGS_=TRUE
  export _R_CHECK_R_DEPENDS_=warn
  export _R_CHECK_SERIALIZATION_=TRUE
  export _R_CHECK_R_ON_PATH_=TRUE
  export _R_CHECK_PACKAGES_USED_IN_TESTS_USE_SUBDIRS_=TRUE
  export _R_CHECK_SHLIB_OPENMP_FLAGS_=TRUE
  export _R_CHECK_CONNECTIONS_LEFT_OPEN_=TRUE
  export _R_CHECK_FUTURE_FILE_TIMESTAMPS_=TRUE
  export _R_CHECK_AUTOCONF_=TRUE

  R CMD build ${R_PACKAGE}
  R CMD check --as-cran ${R_PACKAGE}_*gz

}