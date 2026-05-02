package zmq;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import zmq.TcpAddress;

/* loaded from: jeromq-0.3.5.jar:zmq/Options.class */
public class Options {
    String lastEndpoint;
    int sendHwm = 1000;
    int recvHwm = 1000;
    long affinity = 0;
    byte identitySize = 0;
    int rate = 100;
    int recoveryIvl = 10000;
    int multicastHops = 1;
    int sndbuf = 0;
    int rcvbuf = 0;
    int type = -1;
    int linger = -1;
    int reconnectIvl = 100;
    int reconnectIvlMax = 0;
    int backlog = 100;
    long maxMsgSize = -1;
    int recvTimeout = -1;
    int sendTimeout = -1;
    int ipv4only = 1;
    int delayAttachOnConnect = 0;
    boolean delayOnClose = true;
    boolean delayOnDisconnect = true;
    boolean filter = false;
    boolean recvIdentity = false;
    int tcpKeepAlive = -1;
    int tcpKeepAliveCnt = -1;
    int tcpKeepAliveIdle = -1;
    int tcpKeepAliveIntvl = -1;
    int socketId = 0;
    byte[] identity = null;
    final List<TcpAddress.TcpAddressMask> tcpAcceptFilters = new ArrayList();
    Class<? extends DecoderBase> decoder = null;
    Class<? extends EncoderBase> encoder = null;

    public void setSocketOpt(int option, Object optval) {
        byte[] val;
        switch (option) {
            case 4:
                this.affinity = ((Long) optval).longValue();
                return;
            case 5:
                if (optval instanceof String) {
                    val = ((String) optval).getBytes(ZMQ.CHARSET);
                } else if (optval instanceof byte[]) {
                    val = (byte[]) optval;
                } else {
                    throw new IllegalArgumentException("identity " + optval);
                }
                if (val == null || val.length > 255) {
                    throw new IllegalArgumentException("identity must not be null or less than 255 " + optval);
                }
                this.identity = Arrays.copyOf(val, val.length);
                this.identitySize = (byte) this.identity.length;
                return;
            case 8:
                this.rate = ((Integer) optval).intValue();
                return;
            case 9:
                this.recoveryIvl = ((Integer) optval).intValue();
                return;
            case ZMQ.ZMQ_SNDBUF /* 11 */:
                this.sndbuf = ((Integer) optval).intValue();
                return;
            case ZMQ.ZMQ_RCVBUF /* 12 */:
                this.rcvbuf = ((Integer) optval).intValue();
                return;
            case ZMQ.ZMQ_LINGER /* 17 */:
                this.linger = ((Integer) optval).intValue();
                return;
            case ZMQ.ZMQ_RECONNECT_IVL /* 18 */:
                this.reconnectIvl = ((Integer) optval).intValue();
                if (this.reconnectIvl < -1) {
                    throw new IllegalArgumentException("reconnectIvl " + optval);
                }
                return;
            case ZMQ.ZMQ_BACKLOG /* 19 */:
                this.backlog = ((Integer) optval).intValue();
                return;
            case ZMQ.ZMQ_RECONNECT_IVL_MAX /* 21 */:
                this.reconnectIvlMax = ((Integer) optval).intValue();
                if (this.reconnectIvlMax < 0) {
                    throw new IllegalArgumentException("reconnectIvlMax " + optval);
                }
                return;
            case 22:
                this.maxMsgSize = ((Long) optval).longValue();
                return;
            case ZMQ.ZMQ_SNDHWM /* 23 */:
                this.sendHwm = ((Integer) optval).intValue();
                if (this.sendHwm < 0) {
                    throw new IllegalArgumentException("sendHwm " + optval);
                }
                return;
            case ZMQ.ZMQ_RCVHWM /* 24 */:
                this.recvHwm = ((Integer) optval).intValue();
                if (this.recvHwm < 0) {
                    throw new IllegalArgumentException("recvHwm " + optval);
                }
                return;
            case ZMQ.ZMQ_MULTICAST_HOPS /* 25 */:
                this.multicastHops = ((Integer) optval).intValue();
                return;
            case ZMQ.ZMQ_RCVTIMEO /* 27 */:
                this.recvTimeout = ((Integer) optval).intValue();
                return;
            case ZMQ.ZMQ_SNDTIMEO /* 28 */:
                this.sendTimeout = ((Integer) optval).intValue();
                return;
            case ZMQ.ZMQ_IPV4ONLY /* 31 */:
                this.ipv4only = ((Integer) optval).intValue();
                if (this.ipv4only != 0 && this.ipv4only != 1) {
                    throw new IllegalArgumentException("ipv4only only accepts 0 or 1 " + optval);
                }
                return;
            case ZMQ.ZMQ_TCP_KEEPALIVE /* 34 */:
                this.tcpKeepAlive = ((Integer) optval).intValue();
                if (this.tcpKeepAlive != -1 && this.tcpKeepAlive != 0 && this.tcpKeepAlive != 1) {
                    throw new IllegalArgumentException("tcpKeepAlive only accepts one of -1,0,1 " + optval);
                }
                return;
            case 35:
            case 36:
            case ZMQ.ZMQ_TCP_KEEPALIVE_INTVL /* 37 */:
                return;
            case ZMQ.ZMQ_TCP_ACCEPT_FILTER /* 38 */:
                String filterStr = (String) optval;
                if (filterStr == null) {
                    this.tcpAcceptFilters.clear();
                    return;
                } else {
                    if (filterStr.length() == 0 || filterStr.length() > 255) {
                        throw new IllegalArgumentException("tcp_accept_filter " + optval);
                    }
                    TcpAddress.TcpAddressMask filter = new TcpAddress.TcpAddressMask();
                    filter.resolve(filterStr, this.ipv4only == 1);
                    this.tcpAcceptFilters.add(filter);
                    return;
                }
            case ZMQ.ZMQ_DELAY_ATTACH_ON_CONNECT /* 39 */:
                this.delayAttachOnConnect = ((Integer) optval).intValue();
                if (this.delayAttachOnConnect != 0 && this.delayAttachOnConnect != 1) {
                    throw new IllegalArgumentException("delayAttachOnConnect only accept 0 or 1 " + optval);
                }
                return;
            case ZMQ.ZMQ_ENCODER /* 1001 */:
                if (optval instanceof String) {
                    try {
                        this.encoder = Class.forName((String) optval).asSubclass(EncoderBase.class);
                        return;
                    } catch (ClassNotFoundException e) {
                        throw new IllegalArgumentException(e);
                    }
                } else {
                    if (optval instanceof Class) {
                        this.encoder = (Class) optval;
                        return;
                    }
                    throw new IllegalArgumentException("encoder " + optval);
                }
            case ZMQ.ZMQ_DECODER /* 1002 */:
                if (optval instanceof String) {
                    try {
                        this.decoder = Class.forName((String) optval).asSubclass(DecoderBase.class);
                        return;
                    } catch (ClassNotFoundException e2) {
                        throw new IllegalArgumentException(e2);
                    }
                } else {
                    if (optval instanceof Class) {
                        this.decoder = (Class) optval;
                        return;
                    }
                    throw new IllegalArgumentException("decoder " + optval);
                }
            default:
                throw new IllegalArgumentException("Unknown Option " + option);
        }
    }

    public Object getsockopt(int option) {
        switch (option) {
            case 4:
                return Long.valueOf(this.affinity);
            case 5:
                return this.identity;
            case 6:
            case 7:
            case 10:
            case 13:
            case 14:
            case ZMQ.ZMQ_EVENTS /* 15 */:
            case 20:
            case 26:
            case 29:
            case 30:
            case 33:
            case ZMQ.ZMQ_TCP_ACCEPT_FILTER /* 38 */:
            default:
                throw new IllegalArgumentException("option=" + option);
            case 8:
                return Integer.valueOf(this.rate);
            case 9:
                return Integer.valueOf(this.recoveryIvl);
            case ZMQ.ZMQ_SNDBUF /* 11 */:
                return Integer.valueOf(this.sndbuf);
            case ZMQ.ZMQ_RCVBUF /* 12 */:
                return Integer.valueOf(this.rcvbuf);
            case 16:
                return Integer.valueOf(this.type);
            case ZMQ.ZMQ_LINGER /* 17 */:
                return Integer.valueOf(this.linger);
            case ZMQ.ZMQ_RECONNECT_IVL /* 18 */:
                return Integer.valueOf(this.reconnectIvl);
            case ZMQ.ZMQ_BACKLOG /* 19 */:
                return Integer.valueOf(this.backlog);
            case ZMQ.ZMQ_RECONNECT_IVL_MAX /* 21 */:
                return Integer.valueOf(this.reconnectIvlMax);
            case 22:
                return Long.valueOf(this.maxMsgSize);
            case ZMQ.ZMQ_SNDHWM /* 23 */:
                return Integer.valueOf(this.sendHwm);
            case ZMQ.ZMQ_RCVHWM /* 24 */:
                return Integer.valueOf(this.recvHwm);
            case ZMQ.ZMQ_MULTICAST_HOPS /* 25 */:
                return Integer.valueOf(this.multicastHops);
            case ZMQ.ZMQ_RCVTIMEO /* 27 */:
                return Integer.valueOf(this.recvTimeout);
            case ZMQ.ZMQ_SNDTIMEO /* 28 */:
                return Integer.valueOf(this.sendTimeout);
            case ZMQ.ZMQ_IPV4ONLY /* 31 */:
                return Integer.valueOf(this.ipv4only);
            case 32:
                return this.lastEndpoint;
            case ZMQ.ZMQ_TCP_KEEPALIVE /* 34 */:
                return Integer.valueOf(this.tcpKeepAlive);
            case 35:
            case 36:
            case ZMQ.ZMQ_TCP_KEEPALIVE_INTVL /* 37 */:
                return 0;
            case ZMQ.ZMQ_DELAY_ATTACH_ON_CONNECT /* 39 */:
                return Integer.valueOf(this.delayAttachOnConnect);
        }
    }
}
