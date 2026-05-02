package com.stericson.RootTools.containers;

import java.io.File;
import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.Set;

/* loaded from: RootTools-3.5.jar:com/stericson/RootTools/containers/Mount.class */
public class Mount {
    final File mDevice;
    final File mMountPoint;
    final String mType;
    final Set<String> mFlags;

    public Mount(File device, File path, String type, String flagsStr) {
        this.mDevice = device;
        this.mMountPoint = path;
        this.mType = type;
        this.mFlags = new LinkedHashSet(Arrays.asList(flagsStr.split(",")));
    }

    public File getDevice() {
        return this.mDevice;
    }

    public File getMountPoint() {
        return this.mMountPoint;
    }

    public String getType() {
        return this.mType;
    }

    public Set<String> getFlags() {
        return this.mFlags;
    }

    public String toString() {
        return String.format("%s on %s type %s %s", this.mDevice, this.mMountPoint, this.mType, this.mFlags);
    }
}
