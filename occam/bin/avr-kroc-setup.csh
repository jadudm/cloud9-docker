if ( $?PATH ) then
	setenv PATH "/usr/local/kroc-avr/bin:$PATH"
else
	setenv PATH "/usr/local/kroc-avr/bin"
endif
if ( $?MANPATH ) then
	setenv MANPATH ":/usr/local/kroc-avr/share/man:$MANPATH"
else
	setenv MANPATH ":/usr/local/kroc-avr/share/man"
endif
if ( $?LD_LIBRARY_PATH ) then
	setenv LD_LIBRARY_PATH "/usr/local/kroc-avr/lib:$LD_LIBRARY_PATH"
else
	setenv LD_LIBRARY_PATH "/usr/local/kroc-avr/lib"
endif
if ( $?PKG_CONFIG_PATH ) then
	setenv PKG_CONFIG_PATH "/usr/local/kroc-avr/lib/pkgconfig:$PKG_CONFIG_PATH"
else
	setenv PKG_CONFIG_PATH "/usr/local/kroc-avr/lib/pkgconfig"
endif
if ( $?ACLOCAL ) then
	setenv ACLOCAL "$ACLOCAL -I /usr/local/kroc-avr/share/aclocal"
else
	setenv ACLOCAL "aclocal -I /usr/local/kroc-avr/share/aclocal"
endif
