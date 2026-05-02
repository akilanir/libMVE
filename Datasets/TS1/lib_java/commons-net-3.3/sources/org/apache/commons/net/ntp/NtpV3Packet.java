package org.apache.commons.net.ntp;

import java.net.DatagramPacket;

/* loaded from: commons-net-3.3.jar:org/apache/commons/net/ntp/NtpV3Packet.class */
public interface NtpV3Packet {
    public static final int NTP_PORT = 123;
    public static final int LI_NO_WARNING = 0;
    public static final int LI_LAST_MINUTE_HAS_61_SECONDS = 1;
    public static final int LI_LAST_MINUTE_HAS_59_SECONDS = 2;
    public static final int LI_ALARM_CONDITION = 3;
    public static final int MODE_RESERVED = 0;
    public static final int MODE_SYMMETRIC_ACTIVE = 1;
    public static final int MODE_SYMMETRIC_PASSIVE = 2;
    public static final int MODE_CLIENT = 3;
    public static final int MODE_SERVER = 4;
    public static final int MODE_BROADCAST = 5;
    public static final int MODE_CONTROL_MESSAGE = 6;
    public static final int MODE_PRIVATE = 7;
    public static final int NTP_MINPOLL = 4;
    public static final int NTP_MAXPOLL = 14;
    public static final int NTP_MINCLOCK = 1;
    public static final int NTP_MAXCLOCK = 10;
    public static final int VERSION_3 = 3;
    public static final int VERSION_4 = 4;
    public static final String TYPE_NTP = "NTP";
    public static final String TYPE_ICMP = "ICMP";
    public static final String TYPE_TIME = "TIME";
    public static final String TYPE_DAYTIME = "DAYTIME";

    DatagramPacket getDatagramPacket();

    void setDatagramPacket(DatagramPacket datagramPacket);

    int getLeapIndicator();

    void setLeapIndicator(int i);

    int getMode();

    String getModeName();

    void setMode(int i);

    int getPoll();

    void setPoll(int i);

    int getPrecision();

    int getRootDelay();

    double getRootDelayInMillisDouble();

    int getRootDispersion();

    long getRootDispersionInMillis();

    double getRootDispersionInMillisDouble();

    int getVersion();

    void setVersion(int i);

    int getStratum();

    void setStratum(int i);

    String getReferenceIdString();

    int getReferenceId();

    void setReferenceId(int i);

    TimeStamp getTransmitTimeStamp();

    TimeStamp getReferenceTimeStamp();

    TimeStamp getOriginateTimeStamp();

    TimeStamp getReceiveTimeStamp();

    void setTransmitTime(TimeStamp timeStamp);

    void setReferenceTime(TimeStamp timeStamp);

    void setOriginateTimeStamp(TimeStamp timeStamp);

    void setReceiveTimeStamp(TimeStamp timeStamp);

    String getType();
}
