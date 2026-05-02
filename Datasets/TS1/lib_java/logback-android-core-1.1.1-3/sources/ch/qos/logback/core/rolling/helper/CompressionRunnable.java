package ch.qos.logback.core.rolling.helper;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/rolling/helper/CompressionRunnable.class */
public class CompressionRunnable implements Runnable {
    final Compressor compressor;
    final String nameOfFile2Compress;
    final String nameOfCompressedFile;
    final String innerEntryName;

    public CompressionRunnable(Compressor compressor, String str, String str2, String str3) {
        this.compressor = compressor;
        this.nameOfFile2Compress = str;
        this.nameOfCompressedFile = str2;
        this.innerEntryName = str3;
    }

    @Override // java.lang.Runnable
    public void run() {
        this.compressor.compress(this.nameOfFile2Compress, this.nameOfCompressedFile, this.innerEntryName);
    }
}
