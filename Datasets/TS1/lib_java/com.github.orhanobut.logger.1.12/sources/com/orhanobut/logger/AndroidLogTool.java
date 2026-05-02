package com.orhanobut.logger;

import android.util.Log;

/* loaded from: com.github.orhanobut.logger.1.12.jar:com/orhanobut/logger/AndroidLogTool.class */
public class AndroidLogTool implements LogTool {
    @Override // com.orhanobut.logger.LogTool
    public void d(String tag, String message) {
        Log.d(tag, message);
    }

    @Override // com.orhanobut.logger.LogTool
    public void e(String tag, String message) {
        Log.e(tag, message);
    }

    @Override // com.orhanobut.logger.LogTool
    public void w(String tag, String message) {
        Log.w(tag, message);
    }

    @Override // com.orhanobut.logger.LogTool
    public void i(String tag, String message) {
        Log.i(tag, message);
    }

    @Override // com.orhanobut.logger.LogTool
    public void v(String tag, String message) {
        Log.v(tag, message);
    }

    @Override // com.orhanobut.logger.LogTool
    public void wtf(String tag, String message) {
        Log.wtf(tag, message);
    }
}
