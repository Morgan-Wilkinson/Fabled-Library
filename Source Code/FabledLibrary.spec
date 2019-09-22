# -*- mode: python ; coding: utf-8 -*-

block_cipher = None


a = Analysis(['FabledLibrary.py'],
             pathex=['/Users/morgan/Documents/GitHub/Fabled-Library/Source Code'],
             binaries=[],
             datas=[],
             hiddenimports=['pdfkit', 'PyPDF2'],
             hookspath=[],
             runtime_hooks=[],
             excludes=[],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher,
             noarchive=False)
pyz = PYZ(a.pure, a.zipped_data,
             cipher=block_cipher)
exe = EXE(pyz,
          a.scripts,
          a.binaries,
          a.zipfiles,
          a.datas,
          [],
          name='FabledLibrary',
          debug=False,
          bootloader_ignore_signals=False,
          strip=False,
          upx=True,
          upx_exclude=[],
          runtime_tmpdir=None,
          console=False )
app = BUNDLE(exe,
             name='Fabled Library.app',
             icon='/Users/morgan/Documents/GitHub/Fabled-Library/Source Code/icon.icns',
             bundle_identifier=None,
             info_plist={'NSHighResolutionCapable': 'True'})
