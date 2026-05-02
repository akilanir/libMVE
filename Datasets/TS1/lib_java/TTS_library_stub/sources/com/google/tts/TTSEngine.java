package com.google.tts;

/* loaded from: TTS_library_stub.jar:com/google/tts/TTSEngine.class */
public enum TTSEngine {
    PRERECORDED_ONLY,
    PRERECORDED_WITH_TTS,
    TTS_ONLY,
    ESPEAK,
    PICO;

    /* renamed from: values, reason: to resolve conflict with enum method */
    public static TTSEngine[] valuesCustom() {
        TTSEngine[] valuesCustom = values();
        int length = valuesCustom.length;
        TTSEngine[] tTSEngineArr = new TTSEngine[length];
        System.arraycopy(valuesCustom, 0, tTSEngineArr, 0, length);
        return tTSEngineArr;
    }
}
