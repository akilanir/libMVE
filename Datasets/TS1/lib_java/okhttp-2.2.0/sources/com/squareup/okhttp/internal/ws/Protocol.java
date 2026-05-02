package com.squareup.okhttp.internal.ws;

/* loaded from: okhttp-2.2.0.jar:com/squareup/okhttp/internal/ws/Protocol.class */
final class Protocol {
    static final int B0_FLAG_FIN = 128;
    static final int B0_FLAG_RSV1 = 64;
    static final int B0_FLAG_RSV2 = 32;
    static final int B0_FLAG_RSV3 = 16;
    static final int B0_MASK_OPCODE = 15;
    static final int OPCODE_FLAG_CONTROL = 8;
    static final int B1_FLAG_MASK = 128;
    static final int B1_MASK_LENGTH = 127;
    static final int OPCODE_CONTINUATION = 0;
    static final int OPCODE_TEXT = 1;
    static final int OPCODE_BINARY = 2;
    static final int OPCODE_CONTROL_CLOSE = 8;
    static final int OPCODE_CONTROL_PING = 9;
    static final int OPCODE_CONTROL_PONG = 10;
    static final int PAYLOAD_MAX = 125;
    static final int PAYLOAD_SHORT = 126;
    static final int PAYLOAD_LONG = 127;

    static void toggleMask(byte[] buffer, long byteCount, byte[] key, long frameBytesRead) {
        int keyLength = key.length;
        int i = OPCODE_CONTINUATION;
        while (i < byteCount) {
            int keyIndex = (int) (frameBytesRead % keyLength);
            buffer[i] = (byte) (buffer[i] ^ key[keyIndex]);
            i += OPCODE_TEXT;
            frameBytesRead++;
        }
    }

    private Protocol() {
        throw new AssertionError("No instances.");
    }
}
