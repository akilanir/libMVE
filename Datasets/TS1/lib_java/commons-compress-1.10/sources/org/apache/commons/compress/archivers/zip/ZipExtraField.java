package org.apache.commons.compress.archivers.zip;

import java.util.zip.ZipException;

/* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/archivers/zip/ZipExtraField.class */
public interface ZipExtraField {
    ZipShort getHeaderId();

    ZipShort getLocalFileDataLength();

    ZipShort getCentralDirectoryLength();

    byte[] getLocalFileDataData();

    byte[] getCentralDirectoryData();

    void parseFromLocalFileData(byte[] bArr, int i, int i2) throws ZipException;

    void parseFromCentralDirectoryData(byte[] bArr, int i, int i2) throws ZipException;
}
