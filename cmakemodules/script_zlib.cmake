# Check for system zlib:
# ===================================================
SET(CMAKE_MRPT_HAS_ZLIB 1)	# Always present: system or built-in
IF(MSVC)
	SET(CMAKE_MRPT_HAS_ZLIB_SYSTEM 0)
ELSE(MSVC)
	FIND_PACKAGE(ZLIB)
	IF(ZLIB_FOUND)
			#MESSAGE(STATUS "Found library: zlib - Include: ${ZLIB_INCLUDE_DIR}")
            INCLUDE_DIRECTORIES("${ZLIB_INCLUDE_DIRS}")

            SET(MRPT_ZLIB_LIBS ZLIB::zlib) # APPEND_MRPT_LIBS(z)

			SET(CMAKE_MRPT_HAS_ZLIB_SYSTEM 1)
	ELSE(ZLIB_FOUND)
			# If we are using wxWidgets we dont need this... for now check if this is MinGW on Windows...
			IF (WIN32 AND CMAKE_MRPT_HAS_WXWIDGETS)
				SET(CMAKE_MRPT_HAS_ZLIB_SYSTEM 1)
				SET(CMAKE_MRPT_HAS_ZLIB_SYSTEM_IS_WX 1)
			ELSE(WIN32 AND CMAKE_MRPT_HAS_WXWIDGETS)
				SET(CMAKE_MRPT_HAS_ZLIB_SYSTEM 0)			
			ENDIF(WIN32 AND CMAKE_MRPT_HAS_WXWIDGETS)
	ENDIF(ZLIB_FOUND)
ENDIF(MSVC)

