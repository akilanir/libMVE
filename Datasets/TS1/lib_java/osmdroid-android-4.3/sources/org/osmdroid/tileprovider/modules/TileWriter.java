package org.osmdroid.tileprovider.modules;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.NoSuchElementException;
import org.osmdroid.tileprovider.MapTile;
import org.osmdroid.tileprovider.constants.OpenStreetMapTileProviderConstants;
import org.osmdroid.tileprovider.tilesource.ITileSource;
import org.osmdroid.tileprovider.util.StreamUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/tileprovider/modules/TileWriter.class */
public class TileWriter implements IFilesystemCache, OpenStreetMapTileProviderConstants {
    private static final Logger logger = LoggerFactory.getLogger(TileWriter.class);
    private static long mUsedCacheSpace;

    public TileWriter() {
        Thread t = new Thread() { // from class: org.osmdroid.tileprovider.modules.TileWriter.1
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                long unused = TileWriter.mUsedCacheSpace = 0L;
                TileWriter.this.calculateDirectorySize(OpenStreetMapTileProviderConstants.TILE_PATH_BASE);
                if (TileWriter.mUsedCacheSpace > OpenStreetMapTileProviderConstants.TILE_MAX_CACHE_SIZE_BYTES) {
                    TileWriter.this.cutCurrentCache();
                }
            }
        };
        t.setPriority(1);
        t.start();
    }

    public static long getUsedCacheSpace() {
        return mUsedCacheSpace;
    }

    @Override // org.osmdroid.tileprovider.modules.IFilesystemCache
    public boolean saveFile(ITileSource pTileSource, MapTile pTile, InputStream pStream) {
        File file = new File(TILE_PATH_BASE, pTileSource.getTileRelativeFilenameString(pTile) + OpenStreetMapTileProviderConstants.TILE_PATH_EXTENSION);
        File parent = file.getParentFile();
        if (!parent.exists() && !createFolderAndCheckIfExists(parent)) {
            return false;
        }
        BufferedOutputStream outputStream = null;
        try {
            outputStream = new BufferedOutputStream(new FileOutputStream(file.getPath()), StreamUtils.IO_BUFFER_SIZE);
            long length = StreamUtils.copy(pStream, outputStream);
            mUsedCacheSpace += length;
            if (mUsedCacheSpace > OpenStreetMapTileProviderConstants.TILE_MAX_CACHE_SIZE_BYTES) {
                cutCurrentCache();
            }
            if (outputStream != null) {
                StreamUtils.closeStream(outputStream);
                return true;
            }
            return true;
        } catch (IOException e) {
            if (outputStream != null) {
                StreamUtils.closeStream(outputStream);
            }
            return false;
        } catch (Throwable th) {
            if (outputStream != null) {
                StreamUtils.closeStream(outputStream);
            }
            throw th;
        }
    }

    private boolean createFolderAndCheckIfExists(File pFile) {
        if (pFile.mkdirs()) {
            return true;
        }
        try {
            Thread.sleep(500L);
        } catch (InterruptedException e) {
        }
        if (pFile.exists()) {
            return true;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void calculateDirectorySize(File pDirectory) {
        File[] z = pDirectory.listFiles();
        if (z != null) {
            for (File file : z) {
                if (file.isFile()) {
                    mUsedCacheSpace += file.length();
                }
                if (file.isDirectory() && !isSymbolicDirectoryLink(pDirectory, file)) {
                    calculateDirectorySize(file);
                }
            }
        }
    }

    private boolean isSymbolicDirectoryLink(File pParentDirectory, File pDirectory) {
        try {
            String canonicalParentPath1 = pParentDirectory.getCanonicalPath();
            String canonicalParentPath2 = pDirectory.getCanonicalFile().getParent();
            return !canonicalParentPath1.equals(canonicalParentPath2);
        } catch (IOException e) {
            return true;
        } catch (NoSuchElementException e2) {
            return true;
        }
    }

    private List<File> getDirectoryFileList(File aDirectory) {
        List<File> files = new ArrayList<>();
        File[] z = aDirectory.listFiles();
        if (z != null) {
            for (File file : z) {
                if (file.isFile()) {
                    files.add(file);
                }
                if (file.isDirectory()) {
                    files.addAll(getDirectoryFileList(file));
                }
            }
        }
        return files;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void cutCurrentCache() {
        synchronized (TILE_PATH_BASE) {
            if (mUsedCacheSpace > OpenStreetMapTileProviderConstants.TILE_TRIM_CACHE_SIZE_BYTES) {
                logger.info("Trimming tile cache from " + mUsedCacheSpace + " to " + OpenStreetMapTileProviderConstants.TILE_TRIM_CACHE_SIZE_BYTES);
                List<File> z = getDirectoryFileList(TILE_PATH_BASE);
                File[] files = (File[]) z.toArray(new File[0]);
                Arrays.sort(files, new Comparator<File>() { // from class: org.osmdroid.tileprovider.modules.TileWriter.2
                    @Override // java.util.Comparator
                    public int compare(File f1, File f2) {
                        return Long.valueOf(f1.lastModified()).compareTo(Long.valueOf(f2.lastModified()));
                    }
                });
                for (File file : files) {
                    if (mUsedCacheSpace <= OpenStreetMapTileProviderConstants.TILE_TRIM_CACHE_SIZE_BYTES) {
                        break;
                    }
                    long length = file.length();
                    if (file.delete()) {
                        mUsedCacheSpace -= length;
                    }
                }
                logger.info("Finished trimming tile cache");
            }
        }
    }
}
