package com.jcraft.jsch;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.Socket;
import java.util.Vector;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/Util.class */
class Util {
    private static final byte[] b64 = str2byte("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=");
    private static String[] chars = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"};
    static final byte[] empty = str2byte("");

    Util() {
    }

    private static byte val(byte foo) {
        if (foo == 61) {
            return (byte) 0;
        }
        for (int j = 0; j < b64.length; j++) {
            if (foo == b64[j]) {
                return (byte) j;
            }
        }
        return (byte) 0;
    }

    static byte[] fromBase64(byte[] buf, int start, int length) throws JSchException {
        try {
            byte[] foo = new byte[length];
            int j = 0;
            int i = start;
            while (true) {
                if (i >= start + length) {
                    break;
                }
                foo[j] = (byte) ((val(buf[i]) << 2) | ((val(buf[i + 1]) & 48) >>> 4));
                if (buf[i + 2] == 61) {
                    j++;
                    break;
                }
                foo[j + 1] = (byte) (((val(buf[i + 1]) & 15) << 4) | ((val(buf[i + 2]) & 60) >>> 2));
                if (buf[i + 3] == 61) {
                    j += 2;
                    break;
                }
                foo[j + 2] = (byte) (((val(buf[i + 2]) & 3) << 6) | (val(buf[i + 3]) & 63));
                j += 3;
                i += 4;
            }
            byte[] bar = new byte[j];
            System.arraycopy(foo, 0, bar, 0, j);
            return bar;
        } catch (ArrayIndexOutOfBoundsException e) {
            throw new JSchException("fromBase64: invalid base64 data", e);
        }
    }

    static byte[] toBase64(byte[] buf, int start, int length) {
        byte[] tmp = new byte[length * 2];
        int foo = ((length / 3) * 3) + start;
        int i = 0;
        int j = start;
        while (j < foo) {
            int k = (buf[j] >>> 2) & 63;
            int i2 = i;
            int i3 = i + 1;
            tmp[i2] = b64[k];
            int k2 = ((buf[j] & 3) << 4) | ((buf[j + 1] >>> 4) & 15);
            int i4 = i3 + 1;
            tmp[i3] = b64[k2];
            int k3 = ((buf[j + 1] & 15) << 2) | ((buf[j + 2] >>> 6) & 3);
            int i5 = i4 + 1;
            tmp[i4] = b64[k3];
            int k4 = buf[j + 2] & 63;
            i = i5 + 1;
            tmp[i5] = b64[k4];
            j += 3;
        }
        int foo2 = (start + length) - foo;
        if (foo2 == 1) {
            int k5 = (buf[j] >>> 2) & 63;
            int i6 = i;
            int i7 = i + 1;
            tmp[i6] = b64[k5];
            int k6 = ((buf[j] & 3) << 4) & 63;
            int i8 = i7 + 1;
            tmp[i7] = b64[k6];
            int i9 = i8 + 1;
            tmp[i8] = 61;
            i = i9 + 1;
            tmp[i9] = 61;
        } else if (foo2 == 2) {
            int k7 = (buf[j] >>> 2) & 63;
            int i10 = i;
            int i11 = i + 1;
            tmp[i10] = b64[k7];
            int k8 = ((buf[j] & 3) << 4) | ((buf[j + 1] >>> 4) & 15);
            int i12 = i11 + 1;
            tmp[i11] = b64[k8];
            int k9 = ((buf[j + 1] & 15) << 2) & 63;
            int i13 = i12 + 1;
            tmp[i12] = b64[k9];
            i = i13 + 1;
            tmp[i13] = 61;
        }
        byte[] bar = new byte[i];
        System.arraycopy(tmp, 0, bar, 0, i);
        return bar;
    }

    static String[] split(String foo, String split) {
        int start;
        if (foo == null) {
            return null;
        }
        byte[] buf = str2byte(foo);
        Vector bar = new Vector();
        int i = 0;
        while (true) {
            start = i;
            int index = foo.indexOf(split, start);
            if (index < 0) {
                break;
            }
            bar.addElement(byte2str(buf, start, index - start));
            i = index + 1;
        }
        bar.addElement(byte2str(buf, start, buf.length - start));
        String[] result = new String[bar.size()];
        for (int i2 = 0; i2 < result.length; i2++) {
            result[i2] = (String) bar.elementAt(i2);
        }
        return result;
    }

    static boolean glob(byte[] pattern, byte[] name) {
        return glob0(pattern, 0, name, 0);
    }

    private static boolean glob0(byte[] pattern, int pattern_index, byte[] name, int name_index) {
        if (name.length > 0 && name[0] == 46) {
            if (pattern.length > 0 && pattern[0] == 46) {
                if (pattern.length == 2 && pattern[1] == 42) {
                    return true;
                }
                return glob(pattern, pattern_index + 1, name, name_index + 1);
            }
            return false;
        }
        return glob(pattern, pattern_index, name, name_index);
    }

    private static boolean glob(byte[] pattern, int pattern_index, byte[] name, int name_index) {
        int patternlen = pattern.length;
        if (patternlen == 0) {
            return false;
        }
        int namelen = name.length;
        int i = pattern_index;
        int j = name_index;
        while (i < patternlen && j < namelen) {
            if (pattern[i] == 92) {
                if (i + 1 == patternlen) {
                    return false;
                }
                int i2 = i + 1;
                if (pattern[i2] != name[j]) {
                    return false;
                }
                i = i2 + skipUTF8Char(pattern[i2]);
                j += skipUTF8Char(name[j]);
            } else {
                if (pattern[i] == 42) {
                    while (i < patternlen && pattern[i] == 42) {
                        i++;
                    }
                    if (patternlen == i) {
                        return true;
                    }
                    byte foo = pattern[i];
                    if (foo == 63) {
                        while (j < namelen) {
                            if (glob(pattern, i, name, j)) {
                                return true;
                            }
                            j += skipUTF8Char(name[j]);
                        }
                        return false;
                    }
                    if (foo == 92) {
                        if (i + 1 == patternlen) {
                            return false;
                        }
                        int i3 = i + 1;
                        byte foo2 = pattern[i3];
                        while (j < namelen) {
                            if (foo2 == name[j] && glob(pattern, i3 + skipUTF8Char(foo2), name, j + skipUTF8Char(name[j]))) {
                                return true;
                            }
                            j += skipUTF8Char(name[j]);
                        }
                        return false;
                    }
                    while (j < namelen) {
                        if (foo == name[j] && glob(pattern, i, name, j)) {
                            return true;
                        }
                        j += skipUTF8Char(name[j]);
                    }
                    return false;
                }
                if (pattern[i] == 63) {
                    i++;
                    j += skipUTF8Char(name[j]);
                } else {
                    if (pattern[i] != name[j]) {
                        return false;
                    }
                    i += skipUTF8Char(pattern[i]);
                    j += skipUTF8Char(name[j]);
                    if (j < namelen) {
                        continue;
                    } else {
                        if (i >= patternlen) {
                            return true;
                        }
                        if (pattern[i] == 42) {
                            break;
                        }
                    }
                }
            }
        }
        if (i == patternlen && j == namelen) {
            return true;
        }
        if (j >= namelen && pattern[i] == 42) {
            boolean ok = true;
            while (true) {
                if (i >= patternlen) {
                    break;
                }
                int i4 = i;
                i++;
                if (pattern[i4] != 42) {
                    ok = false;
                    break;
                }
            }
            return ok;
        }
        return false;
    }

    static String quote(String path) {
        byte[] _path = str2byte(path);
        int count = 0;
        for (byte b : _path) {
            if (b == 92 || b == 63 || b == 42) {
                count++;
            }
        }
        if (count == 0) {
            return path;
        }
        byte[] _path2 = new byte[_path.length + count];
        int j = 0;
        for (byte b2 : _path) {
            if (b2 == 92 || b2 == 63 || b2 == 42) {
                int i = j;
                j++;
                _path2[i] = 92;
            }
            int i2 = j;
            j++;
            _path2[i2] = b2;
        }
        return byte2str(_path2);
    }

    static String unquote(String path) {
        byte[] foo = str2byte(path);
        byte[] bar = unquote(foo);
        if (foo.length == bar.length) {
            return path;
        }
        return byte2str(bar);
    }

    static byte[] unquote(byte[] path) {
        int pathlen = path.length;
        int i = 0;
        while (i < pathlen) {
            if (path[i] == 92) {
                if (i + 1 == pathlen) {
                    break;
                }
                System.arraycopy(path, i + 1, path, i, path.length - (i + 1));
                pathlen--;
                i++;
            } else {
                i++;
            }
        }
        if (pathlen == path.length) {
            return path;
        }
        byte[] foo = new byte[pathlen];
        System.arraycopy(path, 0, foo, 0, pathlen);
        return foo;
    }

    static String getFingerPrint(HASH hash, byte[] data) {
        try {
            hash.init();
            hash.update(data, 0, data.length);
            byte[] foo = hash.digest();
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < foo.length; i++) {
                int bar = foo[i] & 255;
                sb.append(chars[(bar >>> 4) & 15]);
                sb.append(chars[bar & 15]);
                if (i + 1 < foo.length) {
                    sb.append(":");
                }
            }
            return sb.toString();
        } catch (Exception e) {
            return "???";
        }
    }

    static boolean array_equals(byte[] foo, byte[] bar) {
        int i = foo.length;
        if (i != bar.length) {
            return false;
        }
        for (int j = 0; j < i; j++) {
            if (foo[j] != bar[j]) {
                return false;
            }
        }
        return true;
    }

    static Socket createSocket(final String host, final int port, int timeout) throws JSchException {
        if (timeout == 0) {
            try {
                Socket socket = new Socket(host, port);
                return socket;
            } catch (Exception e) {
                String message = e.toString();
                if (e instanceof Throwable) {
                    throw new JSchException(message, e);
                }
                throw new JSchException(message);
            }
        }
        final Socket[] sockp = new Socket[1];
        final Exception[] ee = new Exception[1];
        String message2 = "";
        Thread tmp = new Thread(new Runnable() { // from class: com.jcraft.jsch.Util.1
            @Override // java.lang.Runnable
            public void run() {
                sockp[0] = null;
                try {
                    sockp[0] = new Socket(host, port);
                } catch (Exception e2) {
                    ee[0] = e2;
                    if (sockp[0] != null && sockp[0].isConnected()) {
                        try {
                            sockp[0].close();
                        } catch (Exception e3) {
                        }
                    }
                    sockp[0] = null;
                }
            }
        });
        tmp.setName("Opening Socket " + host);
        tmp.start();
        try {
            tmp.join(timeout);
            message2 = "timeout: ";
        } catch (InterruptedException e2) {
        }
        if (sockp[0] != null && sockp[0].isConnected()) {
            Socket socket2 = sockp[0];
            return socket2;
        }
        String message3 = message2 + "socket is not established";
        if (ee[0] != null) {
            message3 = ee[0].toString();
        }
        tmp.interrupt();
        throw new JSchException(message3, ee[0]);
    }

    static byte[] str2byte(String str, String encoding) {
        if (str == null) {
            return null;
        }
        try {
            return str.getBytes(encoding);
        } catch (UnsupportedEncodingException e) {
            return str.getBytes();
        }
    }

    static byte[] str2byte(String str) {
        return str2byte(str, "UTF-8");
    }

    static String byte2str(byte[] str, String encoding) {
        return byte2str(str, 0, str.length, encoding);
    }

    static String byte2str(byte[] str, int s, int l, String encoding) {
        try {
            return new String(str, s, l, encoding);
        } catch (UnsupportedEncodingException e) {
            return new String(str, s, l);
        }
    }

    static String byte2str(byte[] str) {
        return byte2str(str, 0, str.length, "UTF-8");
    }

    static String byte2str(byte[] str, int s, int l) {
        return byte2str(str, s, l, "UTF-8");
    }

    static String toHex(byte[] str) {
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < str.length; i++) {
            String foo = Integer.toHexString(str[i] & 255);
            sb.append("0x" + (foo.length() == 1 ? "0" : "") + foo);
            if (i + 1 < str.length) {
                sb.append(":");
            }
        }
        return sb.toString();
    }

    static void bzero(byte[] foo) {
        if (foo == null) {
            return;
        }
        for (int i = 0; i < foo.length; i++) {
            foo[i] = 0;
        }
    }

    static String diffString(String str, String[] not_available) {
        String[] stra = split(str, ",");
        String result = null;
        for (int i = 0; i < stra.length; i++) {
            int j = 0;
            while (true) {
                if (j < not_available.length) {
                    if (stra[i].equals(not_available[j])) {
                        break;
                    }
                    j++;
                } else {
                    result = result == null ? stra[i] : result + "," + stra[i];
                }
            }
        }
        return result;
    }

    static String checkTilde(String str) {
        try {
            if (str.startsWith("~")) {
                str = str.replace("~", System.getProperty("user.home"));
            }
        } catch (SecurityException e) {
        }
        return str;
    }

    private static int skipUTF8Char(byte b) {
        if (((byte) (b & 128)) == 0) {
            return 1;
        }
        if (((byte) (b & 224)) == -64) {
            return 2;
        }
        return ((byte) (b & 240)) == -32 ? 3 : 1;
    }

    static byte[] fromFile(String _file) throws IOException {
        String _file2 = checkTilde(_file);
        File file = new File(_file2);
        FileInputStream fis = new FileInputStream(_file2);
        try {
            byte[] result = new byte[(int) file.length()];
            int len = 0;
            while (true) {
                int i = fis.read(result, len, result.length - len);
                if (i <= 0) {
                    break;
                }
                len += i;
            }
            fis.close();
            if (fis != null) {
                fis.close();
            }
            return result;
        } catch (Throwable th) {
            if (fis != null) {
                fis.close();
            }
            throw th;
        }
    }
}
