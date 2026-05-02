package com.jcraft.jsch;

import com.jcraft.jsch.Channel;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PipedInputStream;
import java.io.PipedOutputStream;
import java.util.Hashtable;
import java.util.Vector;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/ChannelSftp.class */
public class ChannelSftp extends ChannelSession {
    private static final int LOCAL_MAXIMUM_PACKET_SIZE = 32768;
    private static final int LOCAL_WINDOW_SIZE_MAX = 2097152;
    private static final byte SSH_FXP_INIT = 1;
    private static final byte SSH_FXP_VERSION = 2;
    private static final byte SSH_FXP_OPEN = 3;
    private static final byte SSH_FXP_CLOSE = 4;
    private static final byte SSH_FXP_READ = 5;
    private static final byte SSH_FXP_WRITE = 6;
    private static final byte SSH_FXP_LSTAT = 7;
    private static final byte SSH_FXP_FSTAT = 8;
    private static final byte SSH_FXP_SETSTAT = 9;
    private static final byte SSH_FXP_FSETSTAT = 10;
    private static final byte SSH_FXP_OPENDIR = 11;
    private static final byte SSH_FXP_READDIR = 12;
    private static final byte SSH_FXP_REMOVE = 13;
    private static final byte SSH_FXP_MKDIR = 14;
    private static final byte SSH_FXP_RMDIR = 15;
    private static final byte SSH_FXP_REALPATH = 16;
    private static final byte SSH_FXP_STAT = 17;
    private static final byte SSH_FXP_RENAME = 18;
    private static final byte SSH_FXP_READLINK = 19;
    private static final byte SSH_FXP_SYMLINK = 20;
    private static final byte SSH_FXP_STATUS = 101;
    private static final byte SSH_FXP_HANDLE = 102;
    private static final byte SSH_FXP_DATA = 103;
    private static final byte SSH_FXP_NAME = 104;
    private static final byte SSH_FXP_ATTRS = 105;
    private static final byte SSH_FXP_EXTENDED = -56;
    private static final byte SSH_FXP_EXTENDED_REPLY = -55;
    private static final int SSH_FXF_READ = 1;
    private static final int SSH_FXF_WRITE = 2;
    private static final int SSH_FXF_APPEND = 4;
    private static final int SSH_FXF_CREAT = 8;
    private static final int SSH_FXF_TRUNC = 16;
    private static final int SSH_FXF_EXCL = 32;
    private static final int SSH_FILEXFER_ATTR_SIZE = 1;
    private static final int SSH_FILEXFER_ATTR_UIDGID = 2;
    private static final int SSH_FILEXFER_ATTR_PERMISSIONS = 4;
    private static final int SSH_FILEXFER_ATTR_ACMODTIME = 8;
    private static final int SSH_FILEXFER_ATTR_EXTENDED = Integer.MIN_VALUE;
    public static final int SSH_FX_OK = 0;
    public static final int SSH_FX_EOF = 1;
    public static final int SSH_FX_NO_SUCH_FILE = 2;
    public static final int SSH_FX_PERMISSION_DENIED = 3;
    public static final int SSH_FX_FAILURE = 4;
    public static final int SSH_FX_BAD_MESSAGE = 5;
    public static final int SSH_FX_NO_CONNECTION = 6;
    public static final int SSH_FX_CONNECTION_LOST = 7;
    public static final int SSH_FX_OP_UNSUPPORTED = 8;
    private static final int MAX_MSG_LENGTH = 262144;
    public static final int OVERWRITE = 0;
    public static final int RESUME = 1;
    public static final int APPEND = 2;
    private Buffer buf;
    private Packet packet;
    private Buffer obuf;
    private Packet opacket;
    private static final String file_separator = File.separator;
    private static final char file_separatorc = File.separatorChar;
    private static boolean fs_is_bs;
    private String cwd;
    private String home;
    private String lcwd;
    private static final String UTF8 = "UTF-8";
    private boolean interactive = false;
    private int seq = 1;
    private int[] ackid = new int[1];
    private int client_version = 3;
    private int server_version = 3;
    private String version = String.valueOf(this.client_version);
    private Hashtable extensions = null;
    private InputStream io_in = null;
    private boolean extension_posix_rename = false;
    private boolean extension_statvfs = false;
    private boolean extension_hardlink = false;
    private String fEncoding = UTF8;
    private boolean fEncoding_is_utf8 = true;
    private RequestQueue rq = new RequestQueue(16);

    /* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/ChannelSftp$LsEntrySelector.class */
    public interface LsEntrySelector {
        public static final int CONTINUE = 0;
        public static final int BREAK = 1;

        int select(LsEntry lsEntry);
    }

    @Override // com.jcraft.jsch.ChannelSession, com.jcraft.jsch.Channel, java.lang.Runnable
    public /* bridge */ /* synthetic */ void run() {
        super.run();
    }

    @Override // com.jcraft.jsch.ChannelSession
    public /* bridge */ /* synthetic */ void setPtyType(String x0, int x1, int x2, int x3, int x4) {
        super.setPtyType(x0, x1, x2, x3, x4);
    }

    @Override // com.jcraft.jsch.ChannelSession
    public /* bridge */ /* synthetic */ void setPtyType(String x0) {
        super.setPtyType(x0);
    }

    @Override // com.jcraft.jsch.ChannelSession
    public /* bridge */ /* synthetic */ void setPtySize(int x0, int x1, int x2, int x3) {
        super.setPtySize(x0, x1, x2, x3);
    }

    @Override // com.jcraft.jsch.ChannelSession
    public /* bridge */ /* synthetic */ void setTerminalMode(byte[] x0) {
        super.setTerminalMode(x0);
    }

    @Override // com.jcraft.jsch.ChannelSession
    public /* bridge */ /* synthetic */ void setPty(boolean x0) {
        super.setPty(x0);
    }

    @Override // com.jcraft.jsch.ChannelSession
    public /* bridge */ /* synthetic */ void setEnv(byte[] x0, byte[] x1) {
        super.setEnv(x0, x1);
    }

    @Override // com.jcraft.jsch.ChannelSession
    public /* bridge */ /* synthetic */ void setEnv(String x0, String x1) {
        super.setEnv(x0, x1);
    }

    @Override // com.jcraft.jsch.ChannelSession
    public /* bridge */ /* synthetic */ void setEnv(Hashtable x0) {
        super.setEnv(x0);
    }

    @Override // com.jcraft.jsch.ChannelSession, com.jcraft.jsch.Channel
    public /* bridge */ /* synthetic */ void setXForwarding(boolean x0) {
        super.setXForwarding(x0);
    }

    @Override // com.jcraft.jsch.ChannelSession
    public /* bridge */ /* synthetic */ void setAgentForwarding(boolean x0) {
        super.setAgentForwarding(x0);
    }

    static {
        fs_is_bs = ((byte) File.separatorChar) == 92;
    }

    public void setBulkRequests(int bulk_requests) throws JSchException {
        if (bulk_requests > 0) {
            this.rq = new RequestQueue(bulk_requests);
            return;
        }
        throw new JSchException("setBulkRequests: " + bulk_requests + " must be greater than 0.");
    }

    public int getBulkRequests() {
        return this.rq.size();
    }

    public ChannelSftp() {
        setLocalWindowSizeMax(LOCAL_WINDOW_SIZE_MAX);
        setLocalWindowSize(LOCAL_WINDOW_SIZE_MAX);
        setLocalPacketSize(LOCAL_MAXIMUM_PACKET_SIZE);
    }

    @Override // com.jcraft.jsch.Channel
    void init() {
    }

    @Override // com.jcraft.jsch.Channel
    public void start() throws JSchException {
        try {
            PipedOutputStream pos = new PipedOutputStream();
            this.io.setOutputStream(pos);
            PipedInputStream pis = new Channel.MyPipedInputStream(pos, this.rmpsize);
            this.io.setInputStream(pis);
            this.io_in = this.io.in;
            if (this.io_in == null) {
                throw new JSchException("channel is down");
            }
            Request request = new RequestSftp();
            request.request(getSession(), this);
            this.buf = new Buffer(this.lmpsize);
            this.packet = new Packet(this.buf);
            this.obuf = new Buffer(this.rmpsize);
            this.opacket = new Packet(this.obuf);
            sendINIT();
            Header header = header(this.buf, new Header());
            int length = header.length;
            if (length > MAX_MSG_LENGTH) {
                throw new SftpException(4, "Received message is too long: " + length);
            }
            int i = header.type;
            this.server_version = header.rid;
            this.extensions = new Hashtable();
            if (length > 0) {
                fill(this.buf, length);
                while (length > 0) {
                    byte[] extension_name = this.buf.getString();
                    int length2 = length - (4 + extension_name.length);
                    byte[] extension_data = this.buf.getString();
                    length = length2 - (4 + extension_data.length);
                    this.extensions.put(Util.byte2str(extension_name), Util.byte2str(extension_data));
                }
            }
            if (this.extensions.get("posix-rename@openssh.com") != null && this.extensions.get("posix-rename@openssh.com").equals("1")) {
                this.extension_posix_rename = true;
            }
            if (this.extensions.get("statvfs@openssh.com") != null && this.extensions.get("statvfs@openssh.com").equals("2")) {
                this.extension_statvfs = true;
            }
            if (this.extensions.get("hardlink@openssh.com") != null && this.extensions.get("hardlink@openssh.com").equals("1")) {
                this.extension_hardlink = true;
            }
            this.lcwd = new File(".").getCanonicalPath();
        } catch (Exception e) {
            if (e instanceof JSchException) {
                throw ((JSchException) e);
            }
            if (e instanceof Throwable) {
                throw new JSchException(e.toString(), e);
            }
            throw new JSchException(e.toString());
        }
    }

    public void quit() {
        disconnect();
    }

    public void exit() {
        disconnect();
    }

    public void lcd(String path) throws SftpException {
        String path2 = localAbsolutePath(path);
        if (new File(path2).isDirectory()) {
            try {
                path2 = new File(path2).getCanonicalPath();
            } catch (Exception e) {
            }
            this.lcwd = path2;
            return;
        }
        throw new SftpException(2, "No such directory");
    }

    public void cd(String path) throws SftpException {
        try {
            ((Channel.MyPipedInputStream) this.io_in).updateReadSide();
            String path2 = isUnique(remoteAbsolutePath(path));
            byte[] str = _realpath(path2);
            SftpATTRS attr = _stat(str);
            if ((attr.getFlags() & 4) == 0) {
                throw new SftpException(4, "Can't change directory: " + path2);
            }
            if (!attr.isDir()) {
                throw new SftpException(4, "Can't change directory: " + path2);
            }
            setCwd(Util.byte2str(str, this.fEncoding));
        } catch (Exception e) {
            if (e instanceof SftpException) {
                throw ((SftpException) e);
            }
            if (e instanceof Throwable) {
                throw new SftpException(4, "", e);
            }
            throw new SftpException(4, "");
        }
    }

    public void put(String src, String dst) throws SftpException {
        put(src, dst, (SftpProgressMonitor) null, 0);
    }

    public void put(String src, String dst, int mode) throws SftpException {
        put(src, dst, (SftpProgressMonitor) null, mode);
    }

    public void put(String src, String dst, SftpProgressMonitor monitor) throws SftpException {
        put(src, dst, monitor, 0);
    }

    /* JADX WARN: Finally extract failed */
    public void put(String src, String dst, SftpProgressMonitor monitor, int mode) throws SftpException {
        String _dst;
        int ii;
        try {
            ((Channel.MyPipedInputStream) this.io_in).updateReadSide();
            String src2 = localAbsolutePath(src);
            String dst2 = remoteAbsolutePath(dst);
            Vector v = glob_remote(dst2);
            int vsize = v.size();
            if (vsize != 1) {
                if (vsize == 0) {
                    if (isPattern(dst2)) {
                        throw new SftpException(4, dst2);
                    }
                    Util.unquote(dst2);
                }
                throw new SftpException(4, v.toString());
            }
            String dst3 = (String) v.elementAt(0);
            boolean isRemoteDir = isRemoteDir(dst3);
            Vector v2 = glob_local(src2);
            int vsize2 = v2.size();
            StringBuffer dstsb = null;
            if (isRemoteDir) {
                if (!dst3.endsWith("/")) {
                    dst3 = dst3 + "/";
                }
                dstsb = new StringBuffer(dst3);
            } else if (vsize2 > 1) {
                throw new SftpException(4, "Copying multiple files, but the destination is missing or a file.");
            }
            for (int j = 0; j < vsize2; j++) {
                String _src = (String) v2.elementAt(j);
                if (isRemoteDir) {
                    int i = _src.lastIndexOf(file_separatorc);
                    if (fs_is_bs && (ii = _src.lastIndexOf(47)) != -1 && ii > i) {
                        i = ii;
                    }
                    if (i == -1) {
                        dstsb.append(_src);
                    } else {
                        dstsb.append(_src.substring(i + 1));
                    }
                    _dst = dstsb.toString();
                    dstsb.delete(dst3.length(), _dst.length());
                } else {
                    _dst = dst3;
                }
                long size_of_dst = 0;
                if (mode == 1) {
                    try {
                        SftpATTRS attr = _stat(_dst);
                        size_of_dst = attr.getSize();
                    } catch (Exception e) {
                    }
                    long size_of_src = new File(_src).length();
                    if (size_of_src < size_of_dst) {
                        throw new SftpException(4, "failed to resume for " + _dst);
                    }
                    if (size_of_src == size_of_dst) {
                        return;
                    }
                }
                if (monitor != null) {
                    monitor.init(0, _src, _dst, new File(_src).length());
                    if (mode == 1) {
                        monitor.count(size_of_dst);
                    }
                }
                FileInputStream fis = null;
                try {
                    fis = new FileInputStream(_src);
                    _put(fis, _dst, monitor, mode);
                    if (fis != null) {
                        fis.close();
                    }
                } catch (Throwable th) {
                    if (fis != null) {
                        fis.close();
                    }
                    throw th;
                }
            }
        } catch (Exception e2) {
            if (e2 instanceof SftpException) {
                throw ((SftpException) e2);
            }
            if (e2 instanceof Throwable) {
                throw new SftpException(4, e2.toString(), e2);
            }
            throw new SftpException(4, e2.toString());
        }
    }

    public void put(InputStream src, String dst) throws SftpException {
        put(src, dst, (SftpProgressMonitor) null, 0);
    }

    public void put(InputStream src, String dst, int mode) throws SftpException {
        put(src, dst, (SftpProgressMonitor) null, mode);
    }

    public void put(InputStream src, String dst, SftpProgressMonitor monitor) throws SftpException {
        put(src, dst, monitor, 0);
    }

    public void put(InputStream src, String dst, SftpProgressMonitor monitor, int mode) throws SftpException {
        try {
            ((Channel.MyPipedInputStream) this.io_in).updateReadSide();
            String dst2 = remoteAbsolutePath(dst);
            Vector v = glob_remote(dst2);
            int vsize = v.size();
            if (vsize != 1) {
                if (vsize == 0) {
                    if (isPattern(dst2)) {
                        throw new SftpException(4, dst2);
                    }
                    Util.unquote(dst2);
                }
                throw new SftpException(4, v.toString());
            }
            String dst3 = (String) v.elementAt(0);
            if (monitor != null) {
                monitor.init(0, "-", dst3, -1L);
            }
            _put(src, dst3, monitor, mode);
        } catch (Exception e) {
            if (e instanceof SftpException) {
                if (((SftpException) e).id == 4 && isRemoteDir(dst)) {
                    throw new SftpException(4, dst + " is a directory");
                }
                throw ((SftpException) e);
            }
            if (e instanceof Throwable) {
                throw new SftpException(4, e.toString(), e);
            }
            throw new SftpException(4, e.toString());
        }
    }

    public void _put(InputStream src, String dst, SftpProgressMonitor monitor, int mode) throws SftpException {
        int _datalen;
        int nread;
        try {
            ((Channel.MyPipedInputStream) this.io_in).updateReadSide();
            byte[] dstb = Util.str2byte(dst, this.fEncoding);
            long skip = 0;
            if (mode == 1 || mode == 2) {
                try {
                    SftpATTRS attr = _stat(dstb);
                    skip = attr.getSize();
                } catch (Exception e) {
                }
            }
            if (mode == 1 && skip > 0) {
                long skipped = src.skip(skip);
                if (skipped < skip) {
                    throw new SftpException(4, "failed to resume for " + dst);
                }
            }
            if (mode == 0) {
                sendOPENW(dstb);
            } else {
                sendOPENA(dstb);
            }
            Header header = header(this.buf, new Header());
            int length = header.length;
            int type = header.type;
            fill(this.buf, length);
            if (type != SSH_FXP_STATUS && type != SSH_FXP_HANDLE) {
                throw new SftpException(4, "invalid type=" + type);
            }
            if (type == SSH_FXP_STATUS) {
                int i = this.buf.getInt();
                throwStatusError(this.buf, i);
            }
            byte[] handle = this.buf.getString();
            byte[] data = null;
            if (1 == 0) {
                data = new byte[this.obuf.buffer.length - ((39 + handle.length) + 84)];
            }
            long offset = 0;
            if (mode == 1 || mode == 2) {
                offset = 0 + skip;
            }
            int startid = this.seq;
            int ackcount = 0;
            int _s = 0;
            if (1 == 0) {
                _datalen = data.length;
            } else {
                data = this.obuf.buffer;
                _s = 39 + handle.length;
                _datalen = (this.obuf.buffer.length - _s) - 84;
            }
            int bulk_requests = this.rq.size();
            while (true) {
                int count = 0;
                int s = _s;
                int datalen = _datalen;
                do {
                    nread = src.read(data, s, datalen);
                    if (nread > 0) {
                        s += nread;
                        datalen -= nread;
                        count += nread;
                    }
                    if (datalen <= 0) {
                        break;
                    }
                } while (nread > 0);
                if (count > 0) {
                    int foo = count;
                    while (foo > 0) {
                        if (this.seq - 1 == startid || (this.seq - startid) - ackcount >= bulk_requests) {
                            while ((this.seq - startid) - ackcount >= bulk_requests && checkStatus(this.ackid, header)) {
                                int _ackid = this.ackid[0];
                                if (startid > _ackid || _ackid > this.seq - 1) {
                                    if (_ackid == this.seq) {
                                        System.err.println("ack error: startid=" + startid + " seq=" + this.seq + " _ackid=" + _ackid);
                                    } else {
                                        throw new SftpException(4, "ack error: startid=" + startid + " seq=" + this.seq + " _ackid=" + _ackid);
                                    }
                                }
                                ackcount++;
                            }
                        }
                        foo -= sendWRITE(handle, offset, data, 0, foo);
                    }
                    offset += count;
                    if (monitor != null && !monitor.count(count)) {
                        break;
                    }
                } else {
                    break;
                }
            }
            int _ackcount = this.seq - startid;
            while (_ackcount > ackcount && checkStatus(null, header)) {
                ackcount++;
            }
            if (monitor != null) {
                monitor.end();
            }
            _sendCLOSE(handle, header);
        } catch (Exception e2) {
            if (e2 instanceof SftpException) {
                throw ((SftpException) e2);
            }
            if (e2 instanceof Throwable) {
                throw new SftpException(4, e2.toString(), e2);
            }
            throw new SftpException(4, e2.toString());
        }
    }

    public OutputStream put(String dst) throws SftpException {
        return put(dst, (SftpProgressMonitor) null, 0);
    }

    public OutputStream put(String dst, int mode) throws SftpException {
        return put(dst, (SftpProgressMonitor) null, mode);
    }

    public OutputStream put(String dst, SftpProgressMonitor monitor, int mode) throws SftpException {
        return put(dst, monitor, mode, 0L);
    }

    public OutputStream put(String dst, final SftpProgressMonitor monitor, int mode, long offset) throws SftpException {
        try {
            ((Channel.MyPipedInputStream) this.io_in).updateReadSide();
            String dst2 = isUnique(remoteAbsolutePath(dst));
            if (isRemoteDir(dst2)) {
                throw new SftpException(4, dst2 + " is a directory");
            }
            byte[] dstb = Util.str2byte(dst2, this.fEncoding);
            long skip = 0;
            if (mode == 1 || mode == 2) {
                try {
                    SftpATTRS attr = _stat(dstb);
                    skip = attr.getSize();
                } catch (Exception e) {
                }
            }
            if (mode == 0) {
                sendOPENW(dstb);
            } else {
                sendOPENA(dstb);
            }
            Header header = header(this.buf, new Header());
            int length = header.length;
            int type = header.type;
            fill(this.buf, length);
            if (type != SSH_FXP_STATUS && type != SSH_FXP_HANDLE) {
                throw new SftpException(4, "");
            }
            if (type == SSH_FXP_STATUS) {
                int i = this.buf.getInt();
                throwStatusError(this.buf, i);
            }
            final byte[] handle = this.buf.getString();
            if (mode == 1 || mode == 2) {
                offset += skip;
            }
            final long[] _offset = {offset};
            OutputStream out = new OutputStream() { // from class: com.jcraft.jsch.ChannelSftp.1
                private Header header;
                private boolean init = true;
                private boolean isClosed = false;
                private int[] ackid = new int[1];
                private int startid = 0;
                private int _ackid = 0;
                private int ackcount = 0;
                private int writecount = 0;
                byte[] _data = new byte[1];

                {
                    this.header = ChannelSftp.this.new Header();
                }

                @Override // java.io.OutputStream
                public void write(byte[] d) throws IOException {
                    write(d, 0, d.length);
                }

                @Override // java.io.OutputStream
                public void write(byte[] d, int s, int len) throws IOException {
                    if (this.init) {
                        this.startid = ChannelSftp.this.seq;
                        this._ackid = ChannelSftp.this.seq;
                        this.init = false;
                    }
                    if (this.isClosed) {
                        throw new IOException("stream already closed");
                    }
                    int _len = len;
                    while (_len > 0) {
                        try {
                            int sent = ChannelSftp.this.sendWRITE(handle, _offset[0], d, s, _len);
                            this.writecount++;
                            long[] jArr = _offset;
                            jArr[0] = jArr[0] + sent;
                            s += sent;
                            _len -= sent;
                            if (ChannelSftp.this.seq - 1 == this.startid || ChannelSftp.this.io_in.available() >= 1024) {
                                while (ChannelSftp.this.io_in.available() > 0 && ChannelSftp.this.checkStatus(this.ackid, this.header)) {
                                    this._ackid = this.ackid[0];
                                    if (this.startid > this._ackid || this._ackid > ChannelSftp.this.seq - 1) {
                                        throw new SftpException(4, "");
                                    }
                                    this.ackcount++;
                                }
                            }
                        } catch (IOException e2) {
                            throw e2;
                        } catch (Exception e3) {
                            throw new IOException(e3.toString());
                        }
                    }
                    if (monitor != null && !monitor.count(len)) {
                        close();
                        throw new IOException("canceled");
                    }
                }

                @Override // java.io.OutputStream
                public void write(int foo) throws IOException {
                    this._data[0] = (byte) foo;
                    write(this._data, 0, 1);
                }

                @Override // java.io.OutputStream, java.io.Flushable
                public void flush() throws IOException {
                    if (this.isClosed) {
                        throw new IOException("stream already closed");
                    }
                    if (!this.init) {
                        while (this.writecount > this.ackcount && ChannelSftp.this.checkStatus(null, this.header)) {
                            try {
                                this.ackcount++;
                            } catch (SftpException e2) {
                                throw new IOException(e2.toString());
                            }
                        }
                    }
                }

                @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
                public void close() throws IOException {
                    if (this.isClosed) {
                        return;
                    }
                    flush();
                    if (monitor != null) {
                        monitor.end();
                    }
                    try {
                        ChannelSftp.this._sendCLOSE(handle, this.header);
                        this.isClosed = true;
                    } catch (IOException e2) {
                        throw e2;
                    } catch (Exception e3) {
                        throw new IOException(e3.toString());
                    }
                }
            };
            return out;
        } catch (Exception e2) {
            if (e2 instanceof SftpException) {
                throw ((SftpException) e2);
            }
            if (e2 instanceof Throwable) {
                throw new SftpException(4, "", e2);
            }
            throw new SftpException(4, "");
        }
    }

    public void get(String src, String dst) throws SftpException {
        get(src, dst, null, 0);
    }

    public void get(String src, String dst, SftpProgressMonitor monitor) throws SftpException {
        get(src, dst, monitor, 0);
    }

    /* JADX WARN: Finally extract failed */
    public void get(String src, String dst, SftpProgressMonitor monitor, int mode) throws SftpException {
        boolean _dstExist = false;
        String _dst = null;
        try {
            ((Channel.MyPipedInputStream) this.io_in).updateReadSide();
            String src2 = remoteAbsolutePath(src);
            String dst2 = localAbsolutePath(dst);
            Vector v = glob_remote(src2);
            int vsize = v.size();
            if (vsize == 0) {
                throw new SftpException(2, "No such file");
            }
            File dstFile = new File(dst2);
            boolean isDstDir = dstFile.isDirectory();
            StringBuffer dstsb = null;
            if (isDstDir) {
                if (!dst2.endsWith(file_separator)) {
                    dst2 = dst2 + file_separator;
                }
                dstsb = new StringBuffer(dst2);
            } else if (vsize > 1) {
                throw new SftpException(4, "Copying multiple files, but destination is missing or a file.");
            }
            for (int j = 0; j < vsize; j++) {
                String _src = (String) v.elementAt(j);
                SftpATTRS attr = _stat(_src);
                if (attr.isDir()) {
                    throw new SftpException(4, "not supported to get directory " + _src);
                }
                if (isDstDir) {
                    int i = _src.lastIndexOf(47);
                    if (i == -1) {
                        dstsb.append(_src);
                    } else {
                        dstsb.append(_src.substring(i + 1));
                    }
                    _dst = dstsb.toString();
                    dstsb.delete(dst2.length(), _dst.length());
                } else {
                    _dst = dst2;
                }
                File _dstFile = new File(_dst);
                if (mode == 1) {
                    long size_of_src = attr.getSize();
                    long size_of_dst = _dstFile.length();
                    if (size_of_dst > size_of_src) {
                        throw new SftpException(4, "failed to resume for " + _dst);
                    }
                    if (size_of_dst == size_of_src) {
                        return;
                    }
                }
                if (monitor != null) {
                    monitor.init(1, _src, _dst, attr.getSize());
                    if (mode == 1) {
                        monitor.count(_dstFile.length());
                    }
                }
                FileOutputStream fos = null;
                _dstExist = _dstFile.exists();
                if (mode == 0) {
                    try {
                        fos = new FileOutputStream(_dst);
                    } catch (Throwable th) {
                        if (fos != null) {
                            fos.close();
                        }
                        throw th;
                    }
                } else {
                    fos = new FileOutputStream(_dst, true);
                }
                _get(_src, fos, monitor, mode, new File(_dst).length());
                if (fos != null) {
                    fos.close();
                }
            }
        } catch (Exception e) {
            if (!_dstExist && _dst != null) {
                File _dstFile2 = new File(_dst);
                if (_dstFile2.exists() && _dstFile2.length() == 0) {
                    _dstFile2.delete();
                }
            }
            if (e instanceof SftpException) {
                throw ((SftpException) e);
            }
            if (e instanceof Throwable) {
                throw new SftpException(4, "", e);
            }
            throw new SftpException(4, "");
        }
    }

    public void get(String src, OutputStream dst) throws SftpException {
        get(src, dst, null, 0, 0L);
    }

    public void get(String src, OutputStream dst, SftpProgressMonitor monitor) throws SftpException {
        get(src, dst, monitor, 0, 0L);
    }

    public void get(String src, OutputStream dst, SftpProgressMonitor monitor, int mode, long skip) throws SftpException {
        try {
            ((Channel.MyPipedInputStream) this.io_in).updateReadSide();
            String src2 = isUnique(remoteAbsolutePath(src));
            if (monitor != null) {
                SftpATTRS attr = _stat(src2);
                monitor.init(1, src2, "??", attr.getSize());
                if (mode == 1) {
                    monitor.count(skip);
                }
            }
            _get(src2, dst, monitor, mode, skip);
        } catch (Exception e) {
            if (e instanceof SftpException) {
                throw ((SftpException) e);
            }
            if (e instanceof Throwable) {
                throw new SftpException(4, "", e);
            }
            throw new SftpException(4, "");
        }
    }

    private void _get(String src, OutputStream dst, SftpProgressMonitor monitor, int mode, long skip) throws SftpException {
        byte[] srcb = Util.str2byte(src, this.fEncoding);
        try {
            sendOPENR(srcb);
            Header header = header(this.buf, new Header());
            int length = header.length;
            int type = header.type;
            fill(this.buf, length);
            if (type != SSH_FXP_STATUS && type != SSH_FXP_HANDLE) {
                throw new SftpException(4, "");
            }
            if (type == SSH_FXP_STATUS) {
                throwStatusError(this.buf, this.buf.getInt());
            }
            byte[] handle = this.buf.getString();
            long offset = 0;
            if (mode == 1) {
                offset = 0 + skip;
            }
            int request_max = 1;
            this.rq.init();
            long request_offset = offset;
            int request_len = this.buf.buffer.length - SSH_FXP_REMOVE;
            if (this.server_version == 0) {
                request_len = 1024;
            }
            loop0: while (true) {
                if (this.rq.count() < request_max) {
                    sendREAD(handle, request_offset, request_len, this.rq);
                    request_offset += request_len;
                } else {
                    header = header(this.buf, header);
                    int length2 = header.length;
                    int type2 = header.type;
                    try {
                        RequestQueue.Request rr = this.rq.get(header.rid);
                        if (type2 == SSH_FXP_STATUS) {
                            fill(this.buf, length2);
                            int i = this.buf.getInt();
                            if (i == 1) {
                                break;
                            } else {
                                throwStatusError(this.buf, i);
                            }
                        }
                        if (type2 != SSH_FXP_DATA) {
                            break;
                        }
                        this.buf.rewind();
                        fill(this.buf.buffer, 0, 4);
                        int length3 = length2 - 4;
                        int length_of_data = this.buf.getInt();
                        int optional_data = length3 - length_of_data;
                        int foo = length_of_data;
                        while (foo > 0) {
                            int bar = foo;
                            if (bar > this.buf.buffer.length) {
                                bar = this.buf.buffer.length;
                            }
                            int data_len = this.io_in.read(this.buf.buffer, 0, bar);
                            if (data_len < 0) {
                                break loop0;
                            }
                            dst.write(this.buf.buffer, 0, data_len);
                            offset += data_len;
                            foo -= data_len;
                            if (monitor != null && !monitor.count(data_len)) {
                                skip(foo);
                                if (optional_data > 0) {
                                    skip(optional_data);
                                }
                            }
                        }
                        if (optional_data > 0) {
                            skip(optional_data);
                        }
                        if (length_of_data < rr.length) {
                            this.rq.cancel(header, this.buf);
                            sendREAD(handle, rr.offset + length_of_data, (int) (rr.length - length_of_data), this.rq);
                            request_offset = rr.offset + rr.length;
                        }
                        if (request_max < this.rq.size()) {
                            request_max++;
                        }
                    } catch (RequestQueue.OutOfOrderException e) {
                        request_offset = e.offset;
                        skip(header.length);
                        this.rq.cancel(header, this.buf);
                    }
                }
            }
            dst.flush();
            if (monitor != null) {
                monitor.end();
            }
            this.rq.cancel(header, this.buf);
            _sendCLOSE(handle, header);
        } catch (Exception e2) {
            if (e2 instanceof SftpException) {
                throw ((SftpException) e2);
            }
            if (e2 instanceof Throwable) {
                throw new SftpException(4, "", e2);
            }
            throw new SftpException(4, "");
        }
    }

    /* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/ChannelSftp$RequestQueue.class */
    private class RequestQueue {
        Request[] rrq;
        int head;
        int count;

        /* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/ChannelSftp$RequestQueue$OutOfOrderException.class */
        class OutOfOrderException extends Exception {
            long offset;

            OutOfOrderException(long offset) {
                this.offset = offset;
            }
        }

        /* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/ChannelSftp$RequestQueue$Request.class */
        class Request {
            int id;
            long offset;
            long length;

            Request() {
            }
        }

        RequestQueue(int size) {
            this.rrq = null;
            this.rrq = new Request[size];
            for (int i = 0; i < this.rrq.length; i++) {
                this.rrq[i] = new Request();
            }
            init();
        }

        void init() {
            this.count = 0;
            this.head = 0;
        }

        void add(int id, long offset, int length) {
            if (this.count == 0) {
                this.head = 0;
            }
            int tail = this.head + this.count;
            if (tail >= this.rrq.length) {
                tail -= this.rrq.length;
            }
            this.rrq[tail].id = id;
            this.rrq[tail].offset = offset;
            this.rrq[tail].length = length;
            this.count++;
        }

        Request get(int id) throws OutOfOrderException, SftpException {
            this.count--;
            int i = this.head;
            this.head++;
            if (this.head == this.rrq.length) {
                this.head = 0;
            }
            if (this.rrq[i].id != id) {
                long offset = getOffset();
                boolean find = false;
                int j = 0;
                while (true) {
                    if (j >= this.rrq.length) {
                        break;
                    }
                    if (this.rrq[j].id != id) {
                        j++;
                    } else {
                        find = true;
                        this.rrq[j].id = 0;
                        break;
                    }
                }
                if (find) {
                    throw new OutOfOrderException(offset);
                }
                throw new SftpException(4, "RequestQueue: unknown request id " + id);
            }
            this.rrq[i].id = 0;
            return this.rrq[i];
        }

        int count() {
            return this.count;
        }

        int size() {
            return this.rrq.length;
        }

        void cancel(Header header, Buffer buf) throws IOException {
            int _count = this.count;
            for (int i = 0; i < _count; i++) {
                header = ChannelSftp.this.header(buf, header);
                int length = header.length;
                int j = 0;
                while (true) {
                    if (j >= this.rrq.length) {
                        break;
                    }
                    if (this.rrq[j].id != header.rid) {
                        j++;
                    } else {
                        this.rrq[j].id = 0;
                        break;
                    }
                }
                ChannelSftp.this.skip(length);
            }
            init();
        }

        long getOffset() {
            long result = Long.MAX_VALUE;
            for (int i = 0; i < this.rrq.length; i++) {
                if (this.rrq[i].id != 0 && result > this.rrq[i].offset) {
                    result = this.rrq[i].offset;
                }
            }
            return result;
        }
    }

    public InputStream get(String src) throws SftpException {
        return get(src, (SftpProgressMonitor) null, 0L);
    }

    public InputStream get(String src, SftpProgressMonitor monitor) throws SftpException {
        return get(src, monitor, 0L);
    }

    public InputStream get(String src, int mode) throws SftpException {
        return get(src, (SftpProgressMonitor) null, 0L);
    }

    public InputStream get(String src, SftpProgressMonitor monitor, int mode) throws SftpException {
        return get(src, monitor, 0L);
    }

    public InputStream get(String src, final SftpProgressMonitor monitor, final long skip) throws SftpException {
        try {
            ((Channel.MyPipedInputStream) this.io_in).updateReadSide();
            String src2 = isUnique(remoteAbsolutePath(src));
            byte[] srcb = Util.str2byte(src2, this.fEncoding);
            SftpATTRS attr = _stat(srcb);
            if (monitor != null) {
                monitor.init(1, src2, "??", attr.getSize());
            }
            sendOPENR(srcb);
            Header header = header(this.buf, new Header());
            int length = header.length;
            int type = header.type;
            fill(this.buf, length);
            if (type != SSH_FXP_STATUS && type != SSH_FXP_HANDLE) {
                throw new SftpException(4, "");
            }
            if (type == SSH_FXP_STATUS) {
                int i = this.buf.getInt();
                throwStatusError(this.buf, i);
            }
            final byte[] handle = this.buf.getString();
            this.rq.init();
            InputStream in = new InputStream() { // from class: com.jcraft.jsch.ChannelSftp.2
                long offset;
                Header header;
                long request_offset;
                boolean closed = false;
                int rest_length = 0;
                byte[] _data = new byte[1];
                byte[] rest_byte = new byte[1024];
                int request_max = 1;

                {
                    this.offset = skip;
                    this.header = ChannelSftp.this.new Header();
                    this.request_offset = this.offset;
                }

                @Override // java.io.InputStream
                public int read() throws IOException {
                    if (this.closed) {
                        return -1;
                    }
                    int i2 = read(this._data, 0, 1);
                    if (i2 == -1) {
                        return -1;
                    }
                    return this._data[0] & 255;
                }

                @Override // java.io.InputStream
                public int read(byte[] d) throws IOException {
                    if (this.closed) {
                        return -1;
                    }
                    return read(d, 0, d.length);
                }

                @Override // java.io.InputStream
                public int read(byte[] d, int s, int len) throws IOException {
                    int j;
                    if (this.closed) {
                        return -1;
                    }
                    if (d == null) {
                        throw new NullPointerException();
                    }
                    if (s < 0 || len < 0 || s + len > d.length) {
                        throw new IndexOutOfBoundsException();
                    }
                    if (len == 0) {
                        return 0;
                    }
                    if (this.rest_length <= 0) {
                        if (ChannelSftp.this.buf.buffer.length - ChannelSftp.SSH_FXP_REMOVE < len) {
                            len = ChannelSftp.this.buf.buffer.length - ChannelSftp.SSH_FXP_REMOVE;
                        }
                        if (ChannelSftp.this.server_version == 0 && len > 1024) {
                            len = 1024;
                        }
                        if (ChannelSftp.this.rq.count() == 0) {
                            int request_len = ChannelSftp.this.buf.buffer.length - ChannelSftp.SSH_FXP_REMOVE;
                            if (ChannelSftp.this.server_version == 0) {
                                request_len = 1024;
                            }
                            while (ChannelSftp.this.rq.count() < this.request_max) {
                                try {
                                    ChannelSftp.this.sendREAD(handle, this.request_offset, request_len, ChannelSftp.this.rq);
                                    this.request_offset += request_len;
                                } catch (Exception e) {
                                    throw new IOException("error");
                                }
                            }
                        }
                        this.header = ChannelSftp.this.header(ChannelSftp.this.buf, this.header);
                        this.rest_length = this.header.length;
                        int type2 = this.header.type;
                        int i2 = this.header.rid;
                        try {
                            RequestQueue.Request rr = ChannelSftp.this.rq.get(this.header.rid);
                            if (type2 != ChannelSftp.SSH_FXP_STATUS && type2 != ChannelSftp.SSH_FXP_DATA) {
                                throw new IOException("error");
                            }
                            if (type2 == ChannelSftp.SSH_FXP_STATUS) {
                                ChannelSftp.this.fill(ChannelSftp.this.buf, this.rest_length);
                                int i3 = ChannelSftp.this.buf.getInt();
                                this.rest_length = 0;
                                if (i3 == 1) {
                                    close();
                                    return -1;
                                }
                                throw new IOException("error");
                            }
                            ChannelSftp.this.buf.rewind();
                            ChannelSftp.this.fill(ChannelSftp.this.buf.buffer, 0, 4);
                            int length_of_data = ChannelSftp.this.buf.getInt();
                            this.rest_length -= 4;
                            int optional_data = this.rest_length - length_of_data;
                            this.offset += length_of_data;
                            if (length_of_data > 0) {
                                int bar = length_of_data;
                                if (bar > len) {
                                    bar = len;
                                }
                                int i4 = ChannelSftp.this.io_in.read(d, s, bar);
                                if (i4 < 0) {
                                    return -1;
                                }
                                int foo = length_of_data - i4;
                                this.rest_length = foo;
                                if (foo > 0) {
                                    if (this.rest_byte.length < foo) {
                                        this.rest_byte = new byte[foo];
                                    }
                                    int _s = 0;
                                    int i5 = foo;
                                    while (true) {
                                        int _len = i5;
                                        if (_len <= 0 || (j = ChannelSftp.this.io_in.read(this.rest_byte, _s, _len)) <= 0) {
                                            break;
                                        }
                                        _s += j;
                                        i5 = _len - j;
                                    }
                                }
                                if (optional_data > 0) {
                                    ChannelSftp.this.io_in.skip(optional_data);
                                }
                                if (length_of_data < rr.length) {
                                    ChannelSftp.this.rq.cancel(this.header, ChannelSftp.this.buf);
                                    try {
                                        ChannelSftp.this.sendREAD(handle, rr.offset + length_of_data, (int) (rr.length - length_of_data), ChannelSftp.this.rq);
                                        this.request_offset = rr.offset + rr.length;
                                    } catch (Exception e2) {
                                        throw new IOException("error");
                                    }
                                }
                                if (this.request_max < ChannelSftp.this.rq.size()) {
                                    this.request_max++;
                                }
                                if (monitor != null && !monitor.count(i4)) {
                                    close();
                                    return -1;
                                }
                                return i4;
                            }
                            return 0;
                        } catch (RequestQueue.OutOfOrderException e3) {
                            this.request_offset = e3.offset;
                            skip(this.header.length);
                            ChannelSftp.this.rq.cancel(this.header, ChannelSftp.this.buf);
                            return 0;
                        } catch (SftpException e4) {
                            throw new IOException("error: " + e4.toString());
                        }
                    }
                    int foo2 = this.rest_length;
                    if (foo2 > len) {
                        foo2 = len;
                    }
                    System.arraycopy(this.rest_byte, 0, d, s, foo2);
                    if (foo2 != this.rest_length) {
                        System.arraycopy(this.rest_byte, foo2, this.rest_byte, 0, this.rest_length - foo2);
                    }
                    if (monitor != null && !monitor.count(foo2)) {
                        close();
                        return -1;
                    }
                    this.rest_length -= foo2;
                    return foo2;
                }

                @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
                public void close() throws IOException {
                    if (this.closed) {
                        return;
                    }
                    this.closed = true;
                    if (monitor != null) {
                        monitor.end();
                    }
                    ChannelSftp.this.rq.cancel(this.header, ChannelSftp.this.buf);
                    try {
                        ChannelSftp.this._sendCLOSE(handle, this.header);
                    } catch (Exception e) {
                        throw new IOException("error");
                    }
                }
            };
            return in;
        } catch (Exception e) {
            if (e instanceof SftpException) {
                throw ((SftpException) e);
            }
            if (e instanceof Throwable) {
                throw new SftpException(4, "", e);
            }
            throw new SftpException(4, "");
        }
    }

    public Vector ls(String path) throws SftpException {
        final Vector v = new Vector();
        LsEntrySelector selector = new LsEntrySelector() { // from class: com.jcraft.jsch.ChannelSftp.3
            @Override // com.jcraft.jsch.ChannelSftp.LsEntrySelector
            public int select(LsEntry entry) {
                v.addElement(entry);
                return 0;
            }
        };
        ls(path, selector);
        return v;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v162 */
    /* JADX WARN: Type inference failed for: r0v24, types: [byte[], byte[][]] */
    /* JADX WARN: Type inference failed for: r0v41, types: [byte[]] */
    /* JADX WARN: Type inference failed for: r8v0, types: [com.jcraft.jsch.ChannelSftp] */
    public void ls(String path, LsEntrySelector selector) throws SftpException {
        byte[] pattern;
        boolean find;
        String l;
        try {
            ((Channel.MyPipedInputStream) this.io_in).updateReadSide();
            String path2 = remoteAbsolutePath(path);
            new Vector();
            int foo = path2.lastIndexOf(47);
            String dir = path2.substring(0, foo == 0 ? 1 : foo);
            String _pattern = path2.substring(foo + 1);
            String dir2 = Util.unquote(dir);
            ?? r0 = new byte[1];
            boolean pattern_has_wildcard = isPattern(_pattern, r0);
            if (pattern_has_wildcard) {
                pattern = r0[0];
            } else {
                String upath = Util.unquote(path2);
                SftpATTRS attr = _stat(upath);
                if (attr.isDir()) {
                    pattern = null;
                    dir2 = upath;
                } else if (this.fEncoding_is_utf8) {
                    pattern = Util.unquote((byte[]) r0[0]);
                } else {
                    pattern = Util.str2byte(Util.unquote(_pattern), this.fEncoding);
                }
            }
            sendOPENDIR(Util.str2byte(dir2, this.fEncoding));
            Header header = header(this.buf, new Header());
            int length = header.length;
            int type = header.type;
            fill(this.buf, length);
            if (type != SSH_FXP_STATUS && type != SSH_FXP_HANDLE) {
                throw new SftpException(4, "");
            }
            if (type == SSH_FXP_STATUS) {
                throwStatusError(this.buf, this.buf.getInt());
            }
            int cancel = 0;
            byte[] handle = this.buf.getString();
            while (cancel == 0) {
                sendREADDIR(handle);
                header = header(this.buf, header);
                int length2 = header.length;
                int type2 = header.type;
                if (type2 != SSH_FXP_STATUS && type2 != SSH_FXP_NAME) {
                    throw new SftpException(4, "");
                }
                if (type2 == SSH_FXP_STATUS) {
                    fill(this.buf, length2);
                    int i = this.buf.getInt();
                    if (i == 1) {
                        break;
                    } else {
                        throwStatusError(this.buf, i);
                    }
                }
                this.buf.rewind();
                fill(this.buf.buffer, 0, 4);
                int length3 = length2 - 4;
                int count = this.buf.getInt();
                this.buf.reset();
                while (count > 0) {
                    if (length3 > 0) {
                        this.buf.shift();
                        int j = this.buf.buffer.length > this.buf.index + length3 ? length3 : this.buf.buffer.length - this.buf.index;
                        int i2 = fill(this.buf.buffer, this.buf.index, j);
                        this.buf.index += i2;
                        length3 -= i2;
                    }
                    byte[] filename = this.buf.getString();
                    byte[] longname = null;
                    if (this.server_version <= 3) {
                        longname = this.buf.getString();
                    }
                    SftpATTRS attrs = SftpATTRS.getATTR(this.buf);
                    if (cancel == 1) {
                        count--;
                    } else {
                        String f = null;
                        if (pattern == null) {
                            find = true;
                        } else if (!pattern_has_wildcard) {
                            find = Util.array_equals(pattern, filename);
                        } else {
                            byte[] _filename = filename;
                            if (!this.fEncoding_is_utf8) {
                                f = Util.byte2str(_filename, this.fEncoding);
                                _filename = Util.str2byte(f, UTF8);
                            }
                            find = Util.glob(pattern, _filename);
                        }
                        if (find) {
                            if (f == null) {
                                f = Util.byte2str(filename, this.fEncoding);
                            }
                            if (longname == null) {
                                l = attrs.toString() + " " + f;
                            } else {
                                l = Util.byte2str(longname, this.fEncoding);
                            }
                            cancel = selector.select(new LsEntry(f, l, attrs));
                        }
                        count--;
                    }
                }
            }
            _sendCLOSE(handle, header);
        } catch (Exception e) {
            if (e instanceof SftpException) {
                throw ((SftpException) e);
            }
            if (e instanceof Throwable) {
                throw new SftpException(4, "", e);
            }
            throw new SftpException(4, "");
        }
    }

    public String readlink(String path) throws SftpException {
        try {
            if (this.server_version < 3) {
                throw new SftpException(8, "The remote sshd is too old to support symlink operation.");
            }
            ((Channel.MyPipedInputStream) this.io_in).updateReadSide();
            sendREADLINK(Util.str2byte(isUnique(remoteAbsolutePath(path)), this.fEncoding));
            Header header = header(this.buf, new Header());
            int length = header.length;
            int type = header.type;
            fill(this.buf, length);
            if (type != SSH_FXP_STATUS && type != SSH_FXP_NAME) {
                throw new SftpException(4, "");
            }
            if (type == SSH_FXP_NAME) {
                int count = this.buf.getInt();
                byte[] filename = null;
                for (int i = 0; i < count; i++) {
                    filename = this.buf.getString();
                    if (this.server_version <= 3) {
                        this.buf.getString();
                    }
                    SftpATTRS.getATTR(this.buf);
                }
                return Util.byte2str(filename, this.fEncoding);
            }
            int i2 = this.buf.getInt();
            throwStatusError(this.buf, i2);
            return null;
        } catch (Exception e) {
            if (e instanceof SftpException) {
                throw ((SftpException) e);
            }
            if (e instanceof Throwable) {
                throw new SftpException(4, "", e);
            }
            throw new SftpException(4, "");
        }
    }

    public void symlink(String oldpath, String newpath) throws SftpException {
        String oldpath2;
        if (this.server_version < 3) {
            throw new SftpException(8, "The remote sshd is too old to support symlink operation.");
        }
        try {
            ((Channel.MyPipedInputStream) this.io_in).updateReadSide();
            String _oldpath = remoteAbsolutePath(oldpath);
            String newpath2 = remoteAbsolutePath(newpath);
            String _oldpath2 = isUnique(_oldpath);
            if (oldpath.charAt(0) != '/') {
                String cwd = getCwd();
                oldpath2 = _oldpath2.substring(cwd.length() + (cwd.endsWith("/") ? 0 : 1));
            } else {
                oldpath2 = _oldpath2;
            }
            if (isPattern(newpath2)) {
                throw new SftpException(4, newpath2);
            }
            sendSYMLINK(Util.str2byte(oldpath2, this.fEncoding), Util.str2byte(Util.unquote(newpath2), this.fEncoding));
            Header header = header(this.buf, new Header());
            int length = header.length;
            int type = header.type;
            fill(this.buf, length);
            if (type != SSH_FXP_STATUS) {
                throw new SftpException(4, "");
            }
            int i = this.buf.getInt();
            if (i == 0) {
                return;
            }
            throwStatusError(this.buf, i);
        } catch (Exception e) {
            if (e instanceof SftpException) {
                throw ((SftpException) e);
            }
            if (e instanceof Throwable) {
                throw new SftpException(4, "", e);
            }
            throw new SftpException(4, "");
        }
    }

    public void hardlink(String oldpath, String newpath) throws SftpException {
        String oldpath2;
        if (!this.extension_hardlink) {
            throw new SftpException(8, "hardlink@openssh.com is not supported");
        }
        try {
            ((Channel.MyPipedInputStream) this.io_in).updateReadSide();
            String _oldpath = remoteAbsolutePath(oldpath);
            String newpath2 = remoteAbsolutePath(newpath);
            String _oldpath2 = isUnique(_oldpath);
            if (oldpath.charAt(0) != '/') {
                String cwd = getCwd();
                oldpath2 = _oldpath2.substring(cwd.length() + (cwd.endsWith("/") ? 0 : 1));
            } else {
                oldpath2 = _oldpath2;
            }
            if (isPattern(newpath2)) {
                throw new SftpException(4, newpath2);
            }
            sendHARDLINK(Util.str2byte(oldpath2, this.fEncoding), Util.str2byte(Util.unquote(newpath2), this.fEncoding));
            Header header = header(this.buf, new Header());
            int length = header.length;
            int type = header.type;
            fill(this.buf, length);
            if (type != SSH_FXP_STATUS) {
                throw new SftpException(4, "");
            }
            int i = this.buf.getInt();
            if (i == 0) {
                return;
            }
            throwStatusError(this.buf, i);
        } catch (Exception e) {
            if (e instanceof SftpException) {
                throw ((SftpException) e);
            }
            if (e instanceof Throwable) {
                throw new SftpException(4, "", e);
            }
            throw new SftpException(4, "");
        }
    }

    public void rename(String oldpath, String newpath) throws SftpException {
        String newpath2;
        if (this.server_version < 2) {
            throw new SftpException(8, "The remote sshd is too old to support rename operation.");
        }
        try {
            ((Channel.MyPipedInputStream) this.io_in).updateReadSide();
            String oldpath2 = remoteAbsolutePath(oldpath);
            String newpath3 = remoteAbsolutePath(newpath);
            String oldpath3 = isUnique(oldpath2);
            Vector v = glob_remote(newpath3);
            int vsize = v.size();
            if (vsize >= 2) {
                throw new SftpException(4, v.toString());
            }
            if (vsize == 1) {
                newpath2 = (String) v.elementAt(0);
            } else {
                if (isPattern(newpath3)) {
                    throw new SftpException(4, newpath3);
                }
                newpath2 = Util.unquote(newpath3);
            }
            sendRENAME(Util.str2byte(oldpath3, this.fEncoding), Util.str2byte(newpath2, this.fEncoding));
            Header header = header(this.buf, new Header());
            int length = header.length;
            int type = header.type;
            fill(this.buf, length);
            if (type != SSH_FXP_STATUS) {
                throw new SftpException(4, "");
            }
            int i = this.buf.getInt();
            if (i == 0) {
                return;
            }
            throwStatusError(this.buf, i);
        } catch (Exception e) {
            if (e instanceof SftpException) {
                throw ((SftpException) e);
            }
            if (e instanceof Throwable) {
                throw new SftpException(4, "", e);
            }
            throw new SftpException(4, "");
        }
    }

    public void rm(String path) throws SftpException {
        try {
            ((Channel.MyPipedInputStream) this.io_in).updateReadSide();
            Vector v = glob_remote(remoteAbsolutePath(path));
            int vsize = v.size();
            Header header = new Header();
            for (int j = 0; j < vsize; j++) {
                String path2 = (String) v.elementAt(j);
                sendREMOVE(Util.str2byte(path2, this.fEncoding));
                header = header(this.buf, header);
                int length = header.length;
                int type = header.type;
                fill(this.buf, length);
                if (type != SSH_FXP_STATUS) {
                    throw new SftpException(4, "");
                }
                int i = this.buf.getInt();
                if (i != 0) {
                    throwStatusError(this.buf, i);
                }
            }
        } catch (Exception e) {
            if (e instanceof SftpException) {
                throw ((SftpException) e);
            }
            if (e instanceof Throwable) {
                throw new SftpException(4, "", e);
            }
            throw new SftpException(4, "");
        }
    }

    private boolean isRemoteDir(String path) {
        try {
            sendSTAT(Util.str2byte(path, this.fEncoding));
            Header header = header(this.buf, new Header());
            int length = header.length;
            int type = header.type;
            fill(this.buf, length);
            if (type != SSH_FXP_ATTRS) {
                return false;
            }
            SftpATTRS attr = SftpATTRS.getATTR(this.buf);
            return attr.isDir();
        } catch (Exception e) {
            return false;
        }
    }

    public void chgrp(int gid, String path) throws SftpException {
        try {
            ((Channel.MyPipedInputStream) this.io_in).updateReadSide();
            Vector v = glob_remote(remoteAbsolutePath(path));
            int vsize = v.size();
            for (int j = 0; j < vsize; j++) {
                String path2 = (String) v.elementAt(j);
                SftpATTRS attr = _stat(path2);
                attr.setFLAGS(0);
                attr.setUIDGID(attr.uid, gid);
                _setStat(path2, attr);
            }
        } catch (Exception e) {
            if (e instanceof SftpException) {
                throw ((SftpException) e);
            }
            if (e instanceof Throwable) {
                throw new SftpException(4, "", e);
            }
            throw new SftpException(4, "");
        }
    }

    public void chown(int uid, String path) throws SftpException {
        try {
            ((Channel.MyPipedInputStream) this.io_in).updateReadSide();
            Vector v = glob_remote(remoteAbsolutePath(path));
            int vsize = v.size();
            for (int j = 0; j < vsize; j++) {
                String path2 = (String) v.elementAt(j);
                SftpATTRS attr = _stat(path2);
                attr.setFLAGS(0);
                attr.setUIDGID(uid, attr.gid);
                _setStat(path2, attr);
            }
        } catch (Exception e) {
            if (e instanceof SftpException) {
                throw ((SftpException) e);
            }
            if (e instanceof Throwable) {
                throw new SftpException(4, "", e);
            }
            throw new SftpException(4, "");
        }
    }

    public void chmod(int permissions, String path) throws SftpException {
        try {
            ((Channel.MyPipedInputStream) this.io_in).updateReadSide();
            Vector v = glob_remote(remoteAbsolutePath(path));
            int vsize = v.size();
            for (int j = 0; j < vsize; j++) {
                String path2 = (String) v.elementAt(j);
                SftpATTRS attr = _stat(path2);
                attr.setFLAGS(0);
                attr.setPERMISSIONS(permissions);
                _setStat(path2, attr);
            }
        } catch (Exception e) {
            if (e instanceof SftpException) {
                throw ((SftpException) e);
            }
            if (e instanceof Throwable) {
                throw new SftpException(4, "", e);
            }
            throw new SftpException(4, "");
        }
    }

    public void setMtime(String path, int mtime) throws SftpException {
        try {
            ((Channel.MyPipedInputStream) this.io_in).updateReadSide();
            Vector v = glob_remote(remoteAbsolutePath(path));
            int vsize = v.size();
            for (int j = 0; j < vsize; j++) {
                String path2 = (String) v.elementAt(j);
                SftpATTRS attr = _stat(path2);
                attr.setFLAGS(0);
                attr.setACMODTIME(attr.getATime(), mtime);
                _setStat(path2, attr);
            }
        } catch (Exception e) {
            if (e instanceof SftpException) {
                throw ((SftpException) e);
            }
            if (e instanceof Throwable) {
                throw new SftpException(4, "", e);
            }
            throw new SftpException(4, "");
        }
    }

    public void rmdir(String path) throws SftpException {
        try {
            ((Channel.MyPipedInputStream) this.io_in).updateReadSide();
            Vector v = glob_remote(remoteAbsolutePath(path));
            int vsize = v.size();
            Header header = new Header();
            for (int j = 0; j < vsize; j++) {
                String path2 = (String) v.elementAt(j);
                sendRMDIR(Util.str2byte(path2, this.fEncoding));
                header = header(this.buf, header);
                int length = header.length;
                int type = header.type;
                fill(this.buf, length);
                if (type != SSH_FXP_STATUS) {
                    throw new SftpException(4, "");
                }
                int i = this.buf.getInt();
                if (i != 0) {
                    throwStatusError(this.buf, i);
                }
            }
        } catch (Exception e) {
            if (e instanceof SftpException) {
                throw ((SftpException) e);
            }
            if (e instanceof Throwable) {
                throw new SftpException(4, "", e);
            }
            throw new SftpException(4, "");
        }
    }

    public void mkdir(String path) throws SftpException {
        try {
            ((Channel.MyPipedInputStream) this.io_in).updateReadSide();
            sendMKDIR(Util.str2byte(remoteAbsolutePath(path), this.fEncoding), null);
            Header header = header(this.buf, new Header());
            int length = header.length;
            int type = header.type;
            fill(this.buf, length);
            if (type != SSH_FXP_STATUS) {
                throw new SftpException(4, "");
            }
            int i = this.buf.getInt();
            if (i == 0) {
                return;
            }
            throwStatusError(this.buf, i);
        } catch (Exception e) {
            if (e instanceof SftpException) {
                throw ((SftpException) e);
            }
            if (e instanceof Throwable) {
                throw new SftpException(4, "", e);
            }
            throw new SftpException(4, "");
        }
    }

    public SftpATTRS stat(String path) throws SftpException {
        try {
            ((Channel.MyPipedInputStream) this.io_in).updateReadSide();
            return _stat(isUnique(remoteAbsolutePath(path)));
        } catch (Exception e) {
            if (e instanceof SftpException) {
                throw ((SftpException) e);
            }
            if (e instanceof Throwable) {
                throw new SftpException(4, "", e);
            }
            throw new SftpException(4, "");
        }
    }

    private SftpATTRS _stat(byte[] path) throws SftpException {
        try {
            sendSTAT(path);
            Header header = header(this.buf, new Header());
            int length = header.length;
            int type = header.type;
            fill(this.buf, length);
            if (type != SSH_FXP_ATTRS) {
                if (type == SSH_FXP_STATUS) {
                    int i = this.buf.getInt();
                    throwStatusError(this.buf, i);
                }
                throw new SftpException(4, "");
            }
            SftpATTRS attr = SftpATTRS.getATTR(this.buf);
            return attr;
        } catch (Exception e) {
            if (e instanceof SftpException) {
                throw ((SftpException) e);
            }
            if (e instanceof Throwable) {
                throw new SftpException(4, "", e);
            }
            throw new SftpException(4, "");
        }
    }

    private SftpATTRS _stat(String path) throws SftpException {
        return _stat(Util.str2byte(path, this.fEncoding));
    }

    public SftpStatVFS statVFS(String path) throws SftpException {
        try {
            ((Channel.MyPipedInputStream) this.io_in).updateReadSide();
            return _statVFS(isUnique(remoteAbsolutePath(path)));
        } catch (Exception e) {
            if (e instanceof SftpException) {
                throw ((SftpException) e);
            }
            if (e instanceof Throwable) {
                throw new SftpException(4, "", e);
            }
            throw new SftpException(4, "");
        }
    }

    private SftpStatVFS _statVFS(byte[] path) throws SftpException {
        if (!this.extension_statvfs) {
            throw new SftpException(8, "statvfs@openssh.com is not supported");
        }
        try {
            sendSTATVFS(path);
            Header header = header(this.buf, new Header());
            int length = header.length;
            int type = header.type;
            fill(this.buf, length);
            if (type != 201) {
                if (type == SSH_FXP_STATUS) {
                    int i = this.buf.getInt();
                    throwStatusError(this.buf, i);
                }
                throw new SftpException(4, "");
            }
            SftpStatVFS stat = SftpStatVFS.getStatVFS(this.buf);
            return stat;
        } catch (Exception e) {
            if (e instanceof SftpException) {
                throw ((SftpException) e);
            }
            if (e instanceof Throwable) {
                throw new SftpException(4, "", e);
            }
            throw new SftpException(4, "");
        }
    }

    private SftpStatVFS _statVFS(String path) throws SftpException {
        return _statVFS(Util.str2byte(path, this.fEncoding));
    }

    public SftpATTRS lstat(String path) throws SftpException {
        try {
            ((Channel.MyPipedInputStream) this.io_in).updateReadSide();
            return _lstat(isUnique(remoteAbsolutePath(path)));
        } catch (Exception e) {
            if (e instanceof SftpException) {
                throw ((SftpException) e);
            }
            if (e instanceof Throwable) {
                throw new SftpException(4, "", e);
            }
            throw new SftpException(4, "");
        }
    }

    private SftpATTRS _lstat(String path) throws SftpException {
        try {
            sendLSTAT(Util.str2byte(path, this.fEncoding));
            Header header = header(this.buf, new Header());
            int length = header.length;
            int type = header.type;
            fill(this.buf, length);
            if (type != SSH_FXP_ATTRS) {
                if (type == SSH_FXP_STATUS) {
                    int i = this.buf.getInt();
                    throwStatusError(this.buf, i);
                }
                throw new SftpException(4, "");
            }
            SftpATTRS attr = SftpATTRS.getATTR(this.buf);
            return attr;
        } catch (Exception e) {
            if (e instanceof SftpException) {
                throw ((SftpException) e);
            }
            if (e instanceof Throwable) {
                throw new SftpException(4, "", e);
            }
            throw new SftpException(4, "");
        }
    }

    private byte[] _realpath(String path) throws SftpException, IOException, Exception {
        sendREALPATH(Util.str2byte(path, this.fEncoding));
        Header header = header(this.buf, new Header());
        int length = header.length;
        int type = header.type;
        fill(this.buf, length);
        if (type != SSH_FXP_STATUS && type != SSH_FXP_NAME) {
            throw new SftpException(4, "");
        }
        if (type == SSH_FXP_STATUS) {
            int i = this.buf.getInt();
            throwStatusError(this.buf, i);
        }
        int i2 = this.buf.getInt();
        byte[] str = null;
        while (true) {
            int i3 = i2;
            i2--;
            if (i3 > 0) {
                str = this.buf.getString();
                if (this.server_version <= 3) {
                    this.buf.getString();
                }
                SftpATTRS.getATTR(this.buf);
            } else {
                return str;
            }
        }
    }

    public void setStat(String path, SftpATTRS attr) throws SftpException {
        try {
            ((Channel.MyPipedInputStream) this.io_in).updateReadSide();
            Vector v = glob_remote(remoteAbsolutePath(path));
            int vsize = v.size();
            for (int j = 0; j < vsize; j++) {
                String path2 = (String) v.elementAt(j);
                _setStat(path2, attr);
            }
        } catch (Exception e) {
            if (e instanceof SftpException) {
                throw ((SftpException) e);
            }
            if (e instanceof Throwable) {
                throw new SftpException(4, "", e);
            }
            throw new SftpException(4, "");
        }
    }

    private void _setStat(String path, SftpATTRS attr) throws SftpException {
        try {
            sendSETSTAT(Util.str2byte(path, this.fEncoding), attr);
            Header header = header(this.buf, new Header());
            int length = header.length;
            int type = header.type;
            fill(this.buf, length);
            if (type != SSH_FXP_STATUS) {
                throw new SftpException(4, "");
            }
            int i = this.buf.getInt();
            if (i != 0) {
                throwStatusError(this.buf, i);
            }
        } catch (Exception e) {
            if (e instanceof SftpException) {
                throw ((SftpException) e);
            }
            if (e instanceof Throwable) {
                throw new SftpException(4, "", e);
            }
            throw new SftpException(4, "");
        }
    }

    public String pwd() throws SftpException {
        return getCwd();
    }

    public String lpwd() {
        return this.lcwd;
    }

    public String version() {
        return this.version;
    }

    public String getHome() throws SftpException {
        if (this.home == null) {
            try {
                ((Channel.MyPipedInputStream) this.io_in).updateReadSide();
                byte[] _home = _realpath("");
                this.home = Util.byte2str(_home, this.fEncoding);
            } catch (Exception e) {
                if (e instanceof SftpException) {
                    throw ((SftpException) e);
                }
                if (e instanceof Throwable) {
                    throw new SftpException(4, "", e);
                }
                throw new SftpException(4, "");
            }
        }
        return this.home;
    }

    private String getCwd() throws SftpException {
        if (this.cwd == null) {
            this.cwd = getHome();
        }
        return this.cwd;
    }

    private void setCwd(String cwd) {
        this.cwd = cwd;
    }

    private void read(byte[] buf, int s, int l) throws IOException, SftpException {
        while (l > 0) {
            int i = this.io_in.read(buf, s, l);
            if (i <= 0) {
                throw new SftpException(4, "");
            }
            s += i;
            l -= i;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean checkStatus(int[] ackid, Header header) throws IOException, SftpException {
        Header header2 = header(this.buf, header);
        int length = header2.length;
        int type = header2.type;
        if (ackid != null) {
            ackid[0] = header2.rid;
        }
        fill(this.buf, length);
        if (type != SSH_FXP_STATUS) {
            throw new SftpException(4, "");
        }
        int i = this.buf.getInt();
        if (i != 0) {
            throwStatusError(this.buf, i);
            return true;
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean _sendCLOSE(byte[] handle, Header header) throws Exception {
        sendCLOSE(handle);
        return checkStatus(null, header);
    }

    private void sendINIT() throws Exception {
        this.packet.reset();
        putHEAD((byte) 1, 5);
        this.buf.putInt(3);
        getSession().write(this.packet, this, SSH_FXP_SETSTAT);
    }

    private void sendREALPATH(byte[] path) throws Exception {
        sendPacketPath((byte) 16, path);
    }

    private void sendSTAT(byte[] path) throws Exception {
        sendPacketPath((byte) 17, path);
    }

    private void sendSTATVFS(byte[] path) throws Exception {
        sendPacketPath((byte) 0, path, "statvfs@openssh.com");
    }

    private void sendLSTAT(byte[] path) throws Exception {
        sendPacketPath((byte) 7, path);
    }

    private void sendFSTAT(byte[] handle) throws Exception {
        sendPacketPath((byte) 8, handle);
    }

    private void sendSETSTAT(byte[] path, SftpATTRS attr) throws Exception {
        this.packet.reset();
        putHEAD((byte) 9, SSH_FXP_SETSTAT + path.length + attr.length());
        Buffer buffer = this.buf;
        int i = this.seq;
        this.seq = i + 1;
        buffer.putInt(i);
        this.buf.putString(path);
        attr.dump(this.buf);
        getSession().write(this.packet, this, SSH_FXP_SETSTAT + path.length + attr.length() + 4);
    }

    private void sendREMOVE(byte[] path) throws Exception {
        sendPacketPath((byte) 13, path);
    }

    private void sendMKDIR(byte[] path, SftpATTRS attr) throws Exception {
        this.packet.reset();
        putHEAD((byte) 14, SSH_FXP_SETSTAT + path.length + (attr != null ? attr.length() : 4));
        Buffer buffer = this.buf;
        int i = this.seq;
        this.seq = i + 1;
        buffer.putInt(i);
        this.buf.putString(path);
        if (attr != null) {
            attr.dump(this.buf);
        } else {
            this.buf.putInt(0);
        }
        getSession().write(this.packet, this, SSH_FXP_SETSTAT + path.length + (attr != null ? attr.length() : 4) + 4);
    }

    private void sendRMDIR(byte[] path) throws Exception {
        sendPacketPath((byte) 15, path);
    }

    private void sendSYMLINK(byte[] p1, byte[] p2) throws Exception {
        sendPacketPath((byte) 20, p1, p2);
    }

    private void sendHARDLINK(byte[] p1, byte[] p2) throws Exception {
        sendPacketPath((byte) 0, p1, p2, "hardlink@openssh.com");
    }

    private void sendREADLINK(byte[] path) throws Exception {
        sendPacketPath((byte) 19, path);
    }

    private void sendOPENDIR(byte[] path) throws Exception {
        sendPacketPath((byte) 11, path);
    }

    private void sendREADDIR(byte[] path) throws Exception {
        sendPacketPath((byte) 12, path);
    }

    private void sendRENAME(byte[] p1, byte[] p2) throws Exception {
        sendPacketPath((byte) 18, p1, p2, this.extension_posix_rename ? "posix-rename@openssh.com" : null);
    }

    private void sendCLOSE(byte[] path) throws Exception {
        sendPacketPath((byte) 4, path);
    }

    private void sendOPENR(byte[] path) throws Exception {
        sendOPEN(path, 1);
    }

    private void sendOPENW(byte[] path) throws Exception {
        sendOPEN(path, 26);
    }

    private void sendOPENA(byte[] path) throws Exception {
        sendOPEN(path, SSH_FXP_FSETSTAT);
    }

    private void sendOPEN(byte[] path, int mode) throws Exception {
        this.packet.reset();
        putHEAD((byte) 3, SSH_FXP_STAT + path.length);
        Buffer buffer = this.buf;
        int i = this.seq;
        this.seq = i + 1;
        buffer.putInt(i);
        this.buf.putString(path);
        this.buf.putInt(mode);
        this.buf.putInt(0);
        getSession().write(this.packet, this, SSH_FXP_STAT + path.length + 4);
    }

    private void sendPacketPath(byte fxp, byte[] path) throws Exception {
        sendPacketPath(fxp, path, (String) null);
    }

    private void sendPacketPath(byte fxp, byte[] path, String extension) throws Exception {
        this.packet.reset();
        int len = SSH_FXP_SETSTAT + path.length;
        if (extension == null) {
            putHEAD(fxp, len);
            Buffer buffer = this.buf;
            int i = this.seq;
            this.seq = i + 1;
            buffer.putInt(i);
        } else {
            len += 4 + extension.length();
            putHEAD((byte) -56, len);
            Buffer buffer2 = this.buf;
            int i2 = this.seq;
            this.seq = i2 + 1;
            buffer2.putInt(i2);
            this.buf.putString(Util.str2byte(extension));
        }
        this.buf.putString(path);
        getSession().write(this.packet, this, len + 4);
    }

    private void sendPacketPath(byte fxp, byte[] p1, byte[] p2) throws Exception {
        sendPacketPath(fxp, p1, p2, null);
    }

    private void sendPacketPath(byte fxp, byte[] p1, byte[] p2, String extension) throws Exception {
        this.packet.reset();
        int len = SSH_FXP_REMOVE + p1.length + p2.length;
        if (extension == null) {
            putHEAD(fxp, len);
            Buffer buffer = this.buf;
            int i = this.seq;
            this.seq = i + 1;
            buffer.putInt(i);
        } else {
            len += 4 + extension.length();
            putHEAD((byte) -56, len);
            Buffer buffer2 = this.buf;
            int i2 = this.seq;
            this.seq = i2 + 1;
            buffer2.putInt(i2);
            this.buf.putString(Util.str2byte(extension));
        }
        this.buf.putString(p1);
        this.buf.putString(p2);
        getSession().write(this.packet, this, len + 4);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int sendWRITE(byte[] handle, long offset, byte[] data, int start, int length) throws Exception {
        int _length = length;
        this.opacket.reset();
        if (this.obuf.buffer.length < this.obuf.index + SSH_FXP_REMOVE + 21 + handle.length + length + 84) {
            _length = this.obuf.buffer.length - ((((this.obuf.index + SSH_FXP_REMOVE) + 21) + handle.length) + 84);
        }
        putHEAD(this.obuf, (byte) 6, 21 + handle.length + _length);
        Buffer buffer = this.obuf;
        int i = this.seq;
        this.seq = i + 1;
        buffer.putInt(i);
        this.obuf.putString(handle);
        this.obuf.putLong(offset);
        if (this.obuf.buffer != data) {
            this.obuf.putString(data, start, _length);
        } else {
            this.obuf.putInt(_length);
            this.obuf.skip(_length);
        }
        getSession().write(this.opacket, this, 21 + handle.length + _length + 4);
        return _length;
    }

    private void sendREAD(byte[] handle, long offset, int length) throws Exception {
        sendREAD(handle, offset, length, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sendREAD(byte[] handle, long offset, int length, RequestQueue rrq) throws Exception {
        this.packet.reset();
        putHEAD((byte) 5, 21 + handle.length);
        Buffer buffer = this.buf;
        int i = this.seq;
        this.seq = i + 1;
        buffer.putInt(i);
        this.buf.putString(handle);
        this.buf.putLong(offset);
        this.buf.putInt(length);
        getSession().write(this.packet, this, 21 + handle.length + 4);
        if (rrq != null) {
            rrq.add(this.seq - 1, offset, length);
        }
    }

    private void putHEAD(Buffer buf, byte type, int length) throws Exception {
        buf.putByte((byte) 94);
        buf.putInt(this.recipient);
        buf.putInt(length + 4);
        buf.putInt(length);
        buf.putByte(type);
    }

    private void putHEAD(byte type, int length) throws Exception {
        putHEAD(this.buf, type, length);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v13, types: [byte[], byte[][]] */
    private Vector glob_remote(String _path) throws Exception {
        Vector v = new Vector();
        int foo = _path.lastIndexOf(47);
        if (foo < 0) {
            v.addElement(Util.unquote(_path));
            return v;
        }
        String dir = _path.substring(0, foo == 0 ? 1 : foo);
        String _pattern = _path.substring(foo + 1);
        String dir2 = Util.unquote(dir);
        ?? r0 = new byte[1];
        boolean pattern_has_wildcard = isPattern(_pattern, r0);
        if (!pattern_has_wildcard) {
            if (!dir2.equals("/")) {
                dir2 = dir2 + "/";
            }
            v.addElement(dir2 + Util.unquote(_pattern));
            return v;
        }
        byte[] bArr = r0[0];
        sendOPENDIR(Util.str2byte(dir2, this.fEncoding));
        Header header = header(this.buf, new Header());
        int length = header.length;
        int type = header.type;
        fill(this.buf, length);
        if (type != SSH_FXP_STATUS && type != SSH_FXP_HANDLE) {
            throw new SftpException(4, "");
        }
        if (type == SSH_FXP_STATUS) {
            throwStatusError(this.buf, this.buf.getInt());
        }
        byte[] handle = this.buf.getString();
        String pdir = null;
        while (true) {
            sendREADDIR(handle);
            header = header(this.buf, header);
            int length2 = header.length;
            int type2 = header.type;
            if (type2 != SSH_FXP_STATUS && type2 != SSH_FXP_NAME) {
                throw new SftpException(4, "");
            }
            if (type2 == SSH_FXP_STATUS) {
                fill(this.buf, length2);
                if (_sendCLOSE(handle, header)) {
                    return v;
                }
                return null;
            }
            this.buf.rewind();
            fill(this.buf.buffer, 0, 4);
            int length3 = length2 - 4;
            this.buf.reset();
            for (int count = this.buf.getInt(); count > 0; count--) {
                if (length3 > 0) {
                    this.buf.shift();
                    int j = this.buf.buffer.length > this.buf.index + length3 ? length3 : this.buf.buffer.length - this.buf.index;
                    int i = this.io_in.read(this.buf.buffer, this.buf.index, j);
                    if (i <= 0) {
                        break;
                    }
                    this.buf.index += i;
                    length3 -= i;
                }
                byte[] filename = this.buf.getString();
                if (this.server_version <= 3) {
                    this.buf.getString();
                }
                SftpATTRS.getATTR(this.buf);
                byte[] _filename = filename;
                String f = null;
                if (!this.fEncoding_is_utf8) {
                    f = Util.byte2str(filename, this.fEncoding);
                    _filename = Util.str2byte(f, UTF8);
                }
                boolean found = Util.glob(bArr, _filename);
                if (found) {
                    if (f == null) {
                        f = Util.byte2str(filename, this.fEncoding);
                    }
                    if (pdir == null) {
                        pdir = dir2;
                        if (!pdir.endsWith("/")) {
                            pdir = pdir + "/";
                        }
                    }
                    v.addElement(pdir + f);
                }
            }
        }
    }

    private boolean isPattern(byte[] path) {
        int length = path.length;
        int i = 0;
        while (i < length) {
            if (path[i] == 42 || path[i] == 63) {
                return true;
            }
            if (path[i] == 92 && i + 1 < length) {
                i++;
            }
            i++;
        }
        return false;
    }

    private Vector glob_local(String _path) throws Exception {
        byte[] dir;
        Vector v = new Vector();
        byte[] path = Util.str2byte(_path, UTF8);
        int i = path.length - 1;
        while (i >= 0) {
            if (path[i] == 42 || path[i] == 63) {
                if (fs_is_bs || i <= 0 || path[i - 1] != 92) {
                    break;
                }
                i--;
                if (i <= 0 || path[i - 1] != 92) {
                    break;
                }
                i = (i - 1) - 1;
            } else {
                i--;
            }
        }
        if (i < 0) {
            v.addElement(fs_is_bs ? _path : Util.unquote(_path));
            return v;
        }
        while (i >= 0 && path[i] != file_separatorc && (!fs_is_bs || path[i] != 47)) {
            i--;
        }
        if (i < 0) {
            v.addElement(fs_is_bs ? _path : Util.unquote(_path));
            return v;
        }
        if (i == 0) {
            dir = new byte[]{(byte) file_separatorc};
        } else {
            dir = new byte[i];
            System.arraycopy(path, 0, dir, 0, i);
        }
        byte[] pattern = new byte[(path.length - i) - 1];
        System.arraycopy(path, i + 1, pattern, 0, pattern.length);
        try {
            String[] children = new File(Util.byte2str(dir, UTF8)).list();
            String pdir = Util.byte2str(dir) + file_separator;
            for (int j = 0; j < children.length; j++) {
                if (Util.glob(pattern, Util.str2byte(children[j], UTF8))) {
                    v.addElement(pdir + children[j]);
                }
            }
        } catch (Exception e) {
        }
        return v;
    }

    private void throwStatusError(Buffer buf, int i) throws SftpException {
        if (this.server_version >= 3 && buf.getLength() >= 4) {
            byte[] str = buf.getString();
            throw new SftpException(i, Util.byte2str(str, UTF8));
        }
        throw new SftpException(i, "Failure");
    }

    private static boolean isLocalAbsolutePath(String path) {
        return new File(path).isAbsolute();
    }

    @Override // com.jcraft.jsch.Channel
    public void disconnect() {
        super.disconnect();
    }

    private boolean isPattern(String path, byte[][] utf8) {
        byte[] _path = Util.str2byte(path, UTF8);
        if (utf8 != null) {
            utf8[0] = _path;
        }
        return isPattern(_path);
    }

    private boolean isPattern(String path) {
        return isPattern(path, (byte[][]) null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void fill(Buffer buf, int len) throws IOException {
        buf.reset();
        fill(buf.buffer, 0, len);
        buf.skip(len);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int fill(byte[] buf, int s, int len) throws IOException {
        while (len > 0) {
            int i = this.io_in.read(buf, s, len);
            if (i <= 0) {
                throw new IOException("inputstream is closed");
            }
            s += i;
            len -= i;
        }
        return s - s;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void skip(long foo) throws IOException {
        while (foo > 0) {
            long bar = this.io_in.skip(foo);
            if (bar > 0) {
                foo -= bar;
            } else {
                return;
            }
        }
    }

    /* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/ChannelSftp$Header.class */
    class Header {
        int length;
        int type;
        int rid;

        Header() {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Header header(Buffer buf, Header header) throws IOException {
        buf.rewind();
        fill(buf.buffer, 0, SSH_FXP_SETSTAT);
        header.length = buf.getInt() - 5;
        header.type = buf.getByte() & 255;
        header.rid = buf.getInt();
        return header;
    }

    private String remoteAbsolutePath(String path) throws SftpException {
        if (path.charAt(0) == '/') {
            return path;
        }
        String cwd = getCwd();
        return cwd.endsWith("/") ? cwd + path : cwd + "/" + path;
    }

    private String localAbsolutePath(String path) {
        return isLocalAbsolutePath(path) ? path : this.lcwd.endsWith(file_separator) ? this.lcwd + path : this.lcwd + file_separator + path;
    }

    private String isUnique(String path) throws SftpException, Exception {
        Vector v = glob_remote(path);
        if (v.size() != 1) {
            throw new SftpException(4, path + " is not unique: " + v.toString());
        }
        return (String) v.elementAt(0);
    }

    public int getServerVersion() throws SftpException {
        if (!isConnected()) {
            throw new SftpException(4, "The channel is not connected.");
        }
        return this.server_version;
    }

    public void setFilenameEncoding(String encoding) throws SftpException {
        int sversion = getServerVersion();
        if (3 <= sversion && sversion <= 5 && !encoding.equals(UTF8)) {
            throw new SftpException(4, "The encoding can not be changed for this sftp server.");
        }
        if (encoding.equals(UTF8)) {
            encoding = UTF8;
        }
        this.fEncoding = encoding;
        this.fEncoding_is_utf8 = this.fEncoding.equals(UTF8);
    }

    public String getExtension(String key) {
        if (this.extensions == null) {
            return null;
        }
        return (String) this.extensions.get(key);
    }

    public String realpath(String path) throws SftpException {
        try {
            byte[] _path = _realpath(remoteAbsolutePath(path));
            return Util.byte2str(_path, this.fEncoding);
        } catch (Exception e) {
            if (e instanceof SftpException) {
                throw ((SftpException) e);
            }
            if (e instanceof Throwable) {
                throw new SftpException(4, "", e);
            }
            throw new SftpException(4, "");
        }
    }

    /* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/ChannelSftp$LsEntry.class */
    public class LsEntry implements Comparable {
        private String filename;
        private String longname;
        private SftpATTRS attrs;

        LsEntry(String filename, String longname, SftpATTRS attrs) {
            setFilename(filename);
            setLongname(longname);
            setAttrs(attrs);
        }

        public String getFilename() {
            return this.filename;
        }

        void setFilename(String filename) {
            this.filename = filename;
        }

        public String getLongname() {
            return this.longname;
        }

        void setLongname(String longname) {
            this.longname = longname;
        }

        public SftpATTRS getAttrs() {
            return this.attrs;
        }

        void setAttrs(SftpATTRS attrs) {
            this.attrs = attrs;
        }

        public String toString() {
            return this.longname;
        }

        @Override // java.lang.Comparable
        public int compareTo(Object o) throws ClassCastException {
            if (o instanceof LsEntry) {
                return this.filename.compareTo(((LsEntry) o).getFilename());
            }
            throw new ClassCastException("a decendent of LsEntry must be given.");
        }
    }
}
