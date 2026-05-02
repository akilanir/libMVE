package org.apache.commons.net.ntp;

import java.net.DatagramPacket;

/* loaded from: commons-net-3.3.jar:org/apache/commons/net/ntp/NtpV3Impl.class */
public class NtpV3Impl implements NtpV3Packet {
    private static final int MODE_INDEX = 0;
    private static final int MODE_SHIFT = 0;
    private static final int VERSION_INDEX = 0;
    private static final int VERSION_SHIFT = 3;
    private static final int LI_INDEX = 0;
    private static final int LI_SHIFT = 6;
    private static final int STRATUM_INDEX = 1;
    private static final int POLL_INDEX = 2;
    private static final int PRECISION_INDEX = 3;
    private static final int ROOT_DELAY_INDEX = 4;
    private static final int ROOT_DISPERSION_INDEX = 8;
    private static final int REFERENCE_ID_INDEX = 12;
    private static final int REFERENCE_TIMESTAMP_INDEX = 16;
    private static final int ORIGINATE_TIMESTAMP_INDEX = 24;
    private static final int RECEIVE_TIMESTAMP_INDEX = 32;
    private static final int TRANSMIT_TIMESTAMP_INDEX = 40;
    private final byte[] buf = new byte[48];
    private volatile DatagramPacket dp;

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public int getMode() {
        return (ui(this.buf[0]) >> 0) & 7;
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public String getModeName() {
        return NtpUtils.getModeName(getMode());
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public void setMode(int mode) {
        this.buf[0] = (byte) ((this.buf[0] & 248) | (mode & 7));
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public int getLeapIndicator() {
        return (ui(this.buf[0]) >> 6) & 3;
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public void setLeapIndicator(int li) {
        this.buf[0] = (byte) ((this.buf[0] & 63) | ((li & 3) << 6));
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public int getPoll() {
        return this.buf[2];
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public void setPoll(int poll) {
        this.buf[2] = (byte) (poll & 255);
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public int getPrecision() {
        return this.buf[3];
    }

    public void setPrecision(int precision) {
        this.buf[3] = (byte) (precision & 255);
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public int getVersion() {
        return (ui(this.buf[0]) >> 3) & 7;
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public void setVersion(int version) {
        this.buf[0] = (byte) ((this.buf[0] & 199) | ((version & 7) << 3));
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public int getStratum() {
        return ui(this.buf[1]);
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public void setStratum(int stratum) {
        this.buf[1] = (byte) (stratum & 255);
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public int getRootDelay() {
        return getInt(4);
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public double getRootDelayInMillisDouble() {
        double l = getRootDelay();
        return l / 65.536d;
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public int getRootDispersion() {
        return getInt(8);
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public long getRootDispersionInMillis() {
        long l = getRootDispersion();
        return (l * 1000) / 65536;
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public double getRootDispersionInMillisDouble() {
        double l = getRootDispersion();
        return l / 65.536d;
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public void setReferenceId(int refId) {
        for (int i = 3; i >= 0; i--) {
            this.buf[12 + i] = (byte) (refId & 255);
            refId >>>= 8;
        }
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public int getReferenceId() {
        return getInt(12);
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public String getReferenceIdString() {
        int version = getVersion();
        int stratum = getStratum();
        if (version == 3 || version == 4) {
            if (stratum == 0 || stratum == 1) {
                return idAsString();
            }
            if (version == 4) {
                return idAsHex();
            }
        }
        if (stratum >= 2) {
            return idAsIPAddress();
        }
        return idAsHex();
    }

    private String idAsIPAddress() {
        return ui(this.buf[12]) + "." + ui(this.buf[13]) + "." + ui(this.buf[14]) + "." + ui(this.buf[15]);
    }

    private String idAsString() {
        char c;
        StringBuilder id = new StringBuilder();
        for (int i = 0; i <= 3 && (c = (char) this.buf[12 + i]) != 0; i++) {
            id.append(c);
        }
        return id.toString();
    }

    private String idAsHex() {
        return Integer.toHexString(getReferenceId());
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public TimeStamp getTransmitTimeStamp() {
        return getTimestamp(TRANSMIT_TIMESTAMP_INDEX);
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public void setTransmitTime(TimeStamp ts) {
        setTimestamp(TRANSMIT_TIMESTAMP_INDEX, ts);
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public void setOriginateTimeStamp(TimeStamp ts) {
        setTimestamp(24, ts);
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public TimeStamp getOriginateTimeStamp() {
        return getTimestamp(24);
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public TimeStamp getReferenceTimeStamp() {
        return getTimestamp(16);
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public void setReferenceTime(TimeStamp ts) {
        setTimestamp(16, ts);
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public TimeStamp getReceiveTimeStamp() {
        return getTimestamp(32);
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public void setReceiveTimeStamp(TimeStamp ts) {
        setTimestamp(32, ts);
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public String getType() {
        return NtpV3Packet.TYPE_NTP;
    }

    private int getInt(int index) {
        int i = (ui(this.buf[index]) << 24) | (ui(this.buf[index + 1]) << 16) | (ui(this.buf[index + 2]) << 8) | ui(this.buf[index + 3]);
        return i;
    }

    private TimeStamp getTimestamp(int index) {
        return new TimeStamp(getLong(index));
    }

    private long getLong(int index) {
        long i = (ul(this.buf[index]) << 56) | (ul(this.buf[index + 1]) << 48) | (ul(this.buf[index + 2]) << 40) | (ul(this.buf[index + 3]) << 32) | (ul(this.buf[index + 4]) << 24) | (ul(this.buf[index + 5]) << 16) | (ul(this.buf[index + 6]) << 8) | ul(this.buf[index + 7]);
        return i;
    }

    private void setTimestamp(int index, TimeStamp t) {
        long ntpTime = t == null ? 0L : t.ntpValue();
        for (int i = 7; i >= 0; i--) {
            this.buf[index + i] = (byte) (ntpTime & 255);
            ntpTime >>>= 8;
        }
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public synchronized DatagramPacket getDatagramPacket() {
        if (this.dp == null) {
            this.dp = new DatagramPacket(this.buf, this.buf.length);
            this.dp.setPort(123);
        }
        return this.dp;
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public void setDatagramPacket(DatagramPacket srcDp) {
        byte[] incomingBuf = srcDp.getData();
        int len = srcDp.getLength();
        if (len > this.buf.length) {
            len = this.buf.length;
        }
        System.arraycopy(incomingBuf, 0, this.buf, 0, len);
    }

    protected static final int ui(byte b) {
        int i = b & 255;
        return i;
    }

    protected static final long ul(byte b) {
        long i = b & 255;
        return i;
    }

    public String toString() {
        return "[version:" + getVersion() + ", mode:" + getMode() + ", poll:" + getPoll() + ", precision:" + getPrecision() + ", delay:" + getRootDelay() + ", dispersion(ms):" + getRootDispersionInMillisDouble() + ", id:" + getReferenceIdString() + ", xmitTime:" + getTransmitTimeStamp().toDateString() + " ]";
    }
}
