foreach dir (${HOME}/Library/Android/sdk ${HOME}/android-sdk-macosx ${HOME}/android-sdk)
        if ( -d ${dir} ) then
                setenv ANDROID_SDK_ROOT ${dir}
                break
        endif
end
foreach dir (/opt/local/share/gradle /usr/local/opt/gradle /usr/local/share/java/gradle)
        if (-d ${dir} ) then
                setenv GRADLE_HOME ${dir}
                break
        endif
end

if ($?ANDROID_SDK_ROOT) then
        setenv ANDROID_HOME ${ANDROID_SDK_ROOT}
else
        setenv ANDROID_SDK_ROOT /noexist
endif

# if /etc/PATH exists, use it for the path, and tack on ${HOME}/bin
if (-r /etc/PATH) then
	setenv PATH `cat /etc/PATH`
	setenv PATH ${PATH}:${HOME}/bin
else
	set path=( )
	foreach dir (/sbin /bin /usr/sbin /usr/local/sbin /opt/local/sbin /usr/local/opt/curl/bin /usr/local/ssl/bin /opt/local/bin /usr/local/bin /opt/X11/bin /usr/bin /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin /usr/gcc/4.8/bin /opt/developerstudio12.5/bin /usr/games /usr/local/games ${HOME}/bin ${ANDROID_SDK_ROOT}/emulator ${ANDROID_SDK_ROOT}/tools ${ANDROID_SDK_ROOT}/tools/bin ${ANDROID_SDK_ROOT}/platform-tools ${HOME}/.composer/vendor/bin ${HOME}/node_modules/.bin)
		if ( -d $dir ) then
			set path=($path $dir)
		endif
	end
endif

if (`uname` == "Darwin") then
	if ($?MANPATH) then
		set testmanpath=`echo ${MANPATH:ags/:/ /}`
		unsetenv MANPATH
	else
		set testmanpath='/usr/share/man'
	endif
	foreach dir (${testmanpath} /Applications/Xcode.app/Conents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/share/man /opt/local/man /opt/local/share/man /usr/local/share/man)
		if ( -d $dir ) then
			if ($?MANPATH) then
				setenv MANPATH ${MANPATH}:${dir}
			else
				setenv MANPATH ${dir}
			endif
		endif
	end
	unset testmanpath
endif

