package com.squareup.okhttp.internal.framed;

import java.util.Arrays;

/* loaded from: okhttp-2.7.5.jar:com/squareup/okhttp/internal/framed/Settings.class */
public final class Settings {
    static final int DEFAULT_INITIAL_WINDOW_SIZE = 65536;
    static final int FLAG_CLEAR_PREVIOUSLY_PERSISTED_SETTINGS = 1;
    static final int PERSIST_VALUE = 1;
    static final int PERSISTED = 2;
    static final int UPLOAD_BANDWIDTH = 1;
    static final int HEADER_TABLE_SIZE = 1;
    static final int DOWNLOAD_BANDWIDTH = 2;
    static final int ENABLE_PUSH = 2;
    static final int ROUND_TRIP_TIME = 3;
    static final int MAX_CONCURRENT_STREAMS = 4;
    static final int CURRENT_CWND = 5;
    static final int MAX_FRAME_SIZE = 5;
    static final int DOWNLOAD_RETRANS_RATE = 6;
    static final int MAX_HEADER_LIST_SIZE = 6;
    static final int INITIAL_WINDOW_SIZE = 7;
    static final int CLIENT_CERTIFICATE_VECTOR_SIZE = 8;
    static final int FLOW_CONTROL_OPTIONS = 10;
    static final int COUNT = 10;
    static final int FLOW_CONTROL_OPTIONS_DISABLED = 1;
    private int set;
    private int persistValue;
    private int persisted;
    private final int[] values = new int[10];

    void clear() {
        this.persisted = 0;
        this.persistValue = 0;
        this.set = 0;
        Arrays.fill(this.values, 0);
    }

    Settings set(int id, int idFlags, int value) {
        if (id >= this.values.length) {
            return this;
        }
        int bit = 1 << id;
        this.set |= bit;
        if ((idFlags & 1) != 0) {
            this.persistValue |= bit;
        } else {
            this.persistValue &= bit ^ (-1);
        }
        if ((idFlags & 2) != 0) {
            this.persisted |= bit;
        } else {
            this.persisted &= bit ^ (-1);
        }
        this.values[id] = value;
        return this;
    }

    boolean isSet(int id) {
        int bit = 1 << id;
        return (this.set & bit) != 0;
    }

    int get(int id) {
        return this.values[id];
    }

    int flags(int id) {
        int result = 0;
        if (isPersisted(id)) {
            result = 0 | 2;
        }
        if (persistValue(id)) {
            result |= 1;
        }
        return result;
    }

    int size() {
        return Integer.bitCount(this.set);
    }

    int getUploadBandwidth(int defaultValue) {
        return (2 & this.set) != 0 ? this.values[1] : defaultValue;
    }

    int getHeaderTableSize() {
        if ((2 & this.set) != 0) {
            return this.values[1];
        }
        return -1;
    }

    int getDownloadBandwidth(int defaultValue) {
        return (MAX_CONCURRENT_STREAMS & this.set) != 0 ? this.values[2] : defaultValue;
    }

    boolean getEnablePush(boolean defaultValue) {
        return ((MAX_CONCURRENT_STREAMS & this.set) != 0 ? this.values[2] : defaultValue ? 1 : 0) == 1;
    }

    int getRoundTripTime(int defaultValue) {
        return (CLIENT_CERTIFICATE_VECTOR_SIZE & this.set) != 0 ? this.values[ROUND_TRIP_TIME] : defaultValue;
    }

    int getMaxConcurrentStreams(int defaultValue) {
        return (16 & this.set) != 0 ? this.values[MAX_CONCURRENT_STREAMS] : defaultValue;
    }

    int getCurrentCwnd(int defaultValue) {
        return (32 & this.set) != 0 ? this.values[5] : defaultValue;
    }

    int getMaxFrameSize(int defaultValue) {
        return (32 & this.set) != 0 ? this.values[5] : defaultValue;
    }

    int getDownloadRetransRate(int defaultValue) {
        return (64 & this.set) != 0 ? this.values[6] : defaultValue;
    }

    int getMaxHeaderListSize(int defaultValue) {
        return (64 & this.set) != 0 ? this.values[6] : defaultValue;
    }

    int getInitialWindowSize(int defaultValue) {
        return (128 & this.set) != 0 ? this.values[INITIAL_WINDOW_SIZE] : defaultValue;
    }

    int getClientCertificateVectorSize(int defaultValue) {
        return (256 & this.set) != 0 ? this.values[CLIENT_CERTIFICATE_VECTOR_SIZE] : defaultValue;
    }

    boolean isFlowControlDisabled() {
        int value = (1024 & this.set) != 0 ? this.values[10] : 0;
        return (value & 1) != 0;
    }

    boolean persistValue(int id) {
        int bit = 1 << id;
        return (this.persistValue & bit) != 0;
    }

    boolean isPersisted(int id) {
        int bit = 1 << id;
        return (this.persisted & bit) != 0;
    }

    void merge(Settings other) {
        for (int i = 0; i < 10; i++) {
            if (other.isSet(i)) {
                set(i, other.flags(i), other.get(i));
            }
        }
    }
}
