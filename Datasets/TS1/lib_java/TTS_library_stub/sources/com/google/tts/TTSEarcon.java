package com.google.tts;

/* loaded from: TTS_library_stub.jar:com/google/tts/TTSEarcon.class */
public enum TTSEarcon {
    SILENCE,
    TICK,
    TOCK,
    CANCEL;

    /* renamed from: values, reason: to resolve conflict with enum method */
    public static TTSEarcon[] valuesCustom() {
        TTSEarcon[] valuesCustom = values();
        int length = valuesCustom.length;
        TTSEarcon[] tTSEarconArr = new TTSEarcon[length];
        System.arraycopy(valuesCustom, 0, tTSEarconArr, 0, length);
        return tTSEarconArr;
    }
}
