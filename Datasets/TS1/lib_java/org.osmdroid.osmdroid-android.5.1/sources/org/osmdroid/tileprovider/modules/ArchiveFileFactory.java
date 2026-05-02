package org.osmdroid.tileprovider.modules;

import android.util.Log;
import java.io.File;
import java.util.HashMap;
import java.util.Map;
import org.osmdroid.api.IMapView;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/tileprovider/modules/ArchiveFileFactory.class */
public class ArchiveFileFactory {
    static Map<String, Class<? extends IArchiveFile>> extensionMap = new HashMap();

    static {
        extensionMap.put("zip", ZipFileArchive.class);
        extensionMap.put("sqlite", DatabaseFileArchive.class);
        extensionMap.put("mbtiles", MBTilesFileArchive.class);
        extensionMap.put("gemf", GEMFFileArchive.class);
    }

    public static boolean isFileExtensionRegistered(String extension) {
        return extensionMap.containsKey(extension);
    }

    public static void registerArchiveFileProvider(Class<? extends IArchiveFile> provider, String fileExtension) {
        extensionMap.put(fileExtension, provider);
    }

    public static IArchiveFile getArchiveFile(File pFile) {
        String extension = pFile.getName();
        if (extension.contains(".")) {
            try {
                extension = extension.substring(extension.lastIndexOf(".") + 1);
            } catch (Exception e) {
            }
        }
        Class<? extends IArchiveFile> aClass = extensionMap.get(extension.toLowerCase());
        if (aClass != null) {
            try {
                IArchiveFile provider = aClass.newInstance();
                provider.init(pFile);
                return provider;
            } catch (IllegalAccessException e2) {
                Log.e(IMapView.LOGTAG, "Error initializing archive file provider " + pFile.getAbsolutePath(), e2);
                return null;
            } catch (InstantiationException e3) {
                Log.e(IMapView.LOGTAG, "Error initializing archive file provider " + pFile.getAbsolutePath(), e3);
                return null;
            } catch (Exception e4) {
                Log.e(IMapView.LOGTAG, "Error opening archive file " + pFile.getAbsolutePath(), e4);
                return null;
            }
        }
        return null;
    }
}
