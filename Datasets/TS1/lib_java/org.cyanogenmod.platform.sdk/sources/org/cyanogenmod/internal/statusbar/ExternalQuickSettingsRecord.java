package org.cyanogenmod.internal.statusbar;

import android.os.UserHandle;
import cyanogenmod.app.CustomTile;
import cyanogenmod.app.StatusBarPanelCustomTile;

/* loaded from: org.cyanogenmod.platform.sdk.jar:org/cyanogenmod/internal/statusbar/ExternalQuickSettingsRecord.class */
public class ExternalQuickSettingsRecord {
    public final StatusBarPanelCustomTile sbTile;
    public boolean isUpdate;
    public boolean isCanceled;

    public ExternalQuickSettingsRecord(StatusBarPanelCustomTile tile) {
        this.sbTile = tile;
    }

    public CustomTile getCustomTile() {
        return this.sbTile.getCustomTile();
    }

    public UserHandle getUser() {
        return this.sbTile.getUser();
    }

    public int getUserId() {
        return this.sbTile.getUserId();
    }

    public String getKey() {
        return this.sbTile.getKey();
    }
}
