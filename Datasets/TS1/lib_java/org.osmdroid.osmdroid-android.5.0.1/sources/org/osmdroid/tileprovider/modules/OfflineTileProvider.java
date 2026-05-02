package org.osmdroid.tileprovider.modules;

import android.util.Log;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import org.osmdroid.api.IMapView;
import org.osmdroid.tileprovider.IMapTileProviderCallback;
import org.osmdroid.tileprovider.IRegisterReceiver;
import org.osmdroid.tileprovider.MapTileProviderArray;
import org.osmdroid.tileprovider.tilesource.FileBasedTileSource;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/tileprovider/modules/OfflineTileProvider.class */
public class OfflineTileProvider extends MapTileProviderArray implements IMapTileProviderCallback {
    IArchiveFile[] archives;

    public OfflineTileProvider(IRegisterReceiver pRegisterReceiver, File[] source) throws Exception {
        super(FileBasedTileSource.getSource(source[0].getName()), pRegisterReceiver);
        List<IArchiveFile> files = new ArrayList<>();
        for (int i = 0; i < source.length; i++) {
            IArchiveFile temp = ArchiveFileFactory.getArchiveFile(source[i]);
            if (temp != null) {
                files.add(temp);
            } else {
                Log.w(IMapView.LOGTAG, "Skipping " + source[i] + ", no tile provider is registered to handle the file extension");
            }
        }
        this.archives = new IArchiveFile[files.size()];
        this.archives = (IArchiveFile[]) files.toArray(this.archives);
        this.mTileProviderList.add(new MapTileFileArchiveProvider(pRegisterReceiver, getTileSource(), this.archives));
    }

    public IArchiveFile[] getArchives() {
        return this.archives;
    }
}
