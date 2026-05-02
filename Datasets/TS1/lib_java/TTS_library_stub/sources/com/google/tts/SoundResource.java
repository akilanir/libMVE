package com.google.tts;

/* loaded from: TTS_library_stub.jar:com/google/tts/SoundResource.class */
public class SoundResource {
    public String sourcePackageName;
    public int resId;
    public String filename;

    public SoundResource(String packageName, int id) {
        this.sourcePackageName = packageName;
        this.resId = id;
        this.filename = null;
    }

    public SoundResource(String file) {
        this.sourcePackageName = null;
        this.resId = -1;
        this.filename = file;
    }
}
