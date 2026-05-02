.class public Lcom/jcraft/jsch/Session;
.super Ljava/lang/Object;
.source "Session.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jcraft/jsch/Session$1;,
        Lcom/jcraft/jsch/Session$GlobalRequestReply;,
        Lcom/jcraft/jsch/Session$Forwarding;
    }
.end annotation


# static fields
.field private static final PACKET_MAX_SIZE:I = 0x40000

.field static final SSH_MSG_CHANNEL_CLOSE:I = 0x61

.field static final SSH_MSG_CHANNEL_DATA:I = 0x5e

.field static final SSH_MSG_CHANNEL_EOF:I = 0x60

.field static final SSH_MSG_CHANNEL_EXTENDED_DATA:I = 0x5f

.field static final SSH_MSG_CHANNEL_FAILURE:I = 0x64

.field static final SSH_MSG_CHANNEL_OPEN:I = 0x5a

.field static final SSH_MSG_CHANNEL_OPEN_CONFIRMATION:I = 0x5b

.field static final SSH_MSG_CHANNEL_OPEN_FAILURE:I = 0x5c

.field static final SSH_MSG_CHANNEL_REQUEST:I = 0x62

.field static final SSH_MSG_CHANNEL_SUCCESS:I = 0x63

.field static final SSH_MSG_CHANNEL_WINDOW_ADJUST:I = 0x5d

.field static final SSH_MSG_DEBUG:I = 0x4

.field static final SSH_MSG_DISCONNECT:I = 0x1

.field static final SSH_MSG_GLOBAL_REQUEST:I = 0x50

.field static final SSH_MSG_IGNORE:I = 0x2

.field static final SSH_MSG_KEXDH_INIT:I = 0x1e

.field static final SSH_MSG_KEXDH_REPLY:I = 0x1f

.field static final SSH_MSG_KEXINIT:I = 0x14

.field static final SSH_MSG_KEX_DH_GEX_GROUP:I = 0x1f

.field static final SSH_MSG_KEX_DH_GEX_INIT:I = 0x20

.field static final SSH_MSG_KEX_DH_GEX_REPLY:I = 0x21

.field static final SSH_MSG_KEX_DH_GEX_REQUEST:I = 0x22

.field static final SSH_MSG_NEWKEYS:I = 0x15

.field static final SSH_MSG_REQUEST_FAILURE:I = 0x52

.field static final SSH_MSG_REQUEST_SUCCESS:I = 0x51

.field static final SSH_MSG_SERVICE_ACCEPT:I = 0x6

.field static final SSH_MSG_SERVICE_REQUEST:I = 0x5

.field static final SSH_MSG_UNIMPLEMENTED:I = 0x3

.field static final buffer_margin:I = 0x54

.field private static final keepalivemsg:[B

.field private static final nomoresessions:[B

.field static random:Lcom/jcraft/jsch/Random;


# instance fields
.field private Ec2s:[B

.field private Es2c:[B

.field private IVc2s:[B

.field private IVs2c:[B

.field private I_C:[B

.field private I_S:[B

.field private K_S:[B

.field private MACc2s:[B

.field private MACs2c:[B

.field private V_C:[B

.field private V_S:[B

.field agent_forwarding:Z

.field auth_failures:I

.field buf:Lcom/jcraft/jsch/Buffer;

.field private c2scipher:Lcom/jcraft/jsch/Cipher;

.field private c2scipher_size:I

.field private c2smac:Lcom/jcraft/jsch/MAC;

.field compress_len:[I

.field private config:Ljava/util/Hashtable;

.field private connectThread:Ljava/lang/Thread;

.field protected daemon_thread:Z

.field private deflater:Lcom/jcraft/jsch/Compression;

.field private grr:Lcom/jcraft/jsch/Session$GlobalRequestReply;

.field guess:[Ljava/lang/String;

.field host:Ljava/lang/String;

.field private hostKeyAlias:Ljava/lang/String;

.field private hostkey:Lcom/jcraft/jsch/HostKey;

.field private hostkeyRepository:Lcom/jcraft/jsch/HostKeyRepository;

.field private identityRepository:Lcom/jcraft/jsch/IdentityRepository;

.field in:Ljava/io/InputStream;

.field private in_kex:Z

.field private inflater:Lcom/jcraft/jsch/Compression;

.field private io:Lcom/jcraft/jsch/IO;

.field private isAuthed:Z

.field private volatile isConnected:Z

.field jsch:Lcom/jcraft/jsch/JSch;

.field private kex_start_time:J

.field private lock:Ljava/lang/Object;

.field max_auth_tries:I

.field org_host:Ljava/lang/String;

.field out:Ljava/io/OutputStream;

.field packet:Lcom/jcraft/jsch/Packet;

.field password:[B

.field port:I

.field private proxy:Lcom/jcraft/jsch/Proxy;

.field private s2ccipher:Lcom/jcraft/jsch/Cipher;

.field private s2ccipher_size:I

.field private s2cmac:Lcom/jcraft/jsch/MAC;

.field private s2cmac_result1:[B

.field private s2cmac_result2:[B

.field private seqi:I

.field private seqo:I

.field private serverAliveCountMax:I

.field private serverAliveInterval:I

.field private session_id:[B

.field private socket:Ljava/net/Socket;

.field socket_factory:Lcom/jcraft/jsch/SocketFactory;

.field thread:Ljava/lang/Runnable;

.field private timeout:I

.field uncompress_len:[I

.field private userinfo:Lcom/jcraft/jsch/UserInfo;

.field username:Ljava/lang/String;

.field x11_forwarding:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 2350
    const-string v0, "keepalive@jcraft.com"

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/jcraft/jsch/Session;->keepalivemsg:[B

    .line 2361
    const-string v0, "no-more-sessions@openssh.com"

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/jcraft/jsch/Session;->nomoresessions:[B

    return-void
.end method

.method constructor <init>(Lcom/jcraft/jsch/JSch;Ljava/lang/String;Ljava/lang/String;I)V
    .registers 11
    .param p1, "jsch"    # Lcom/jcraft/jsch/JSch;
    .param p2, "username"    # Ljava/lang/String;
    .param p3, "host"    # Ljava/lang/String;
    .param p4, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x8

    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 158
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    const-string v0, "SSH-2.0-JSCH-0.1.51"

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->V_C:[B

    .line 86
    iput v3, p0, Lcom/jcraft/jsch/Session;->seqi:I

    .line 87
    iput v3, p0, Lcom/jcraft/jsch/Session;->seqo:I

    .line 89
    iput-object v2, p0, Lcom/jcraft/jsch/Session;->guess:[Ljava/lang/String;

    .line 103
    iput v3, p0, Lcom/jcraft/jsch/Session;->timeout:I

    .line 105
    iput-boolean v3, p0, Lcom/jcraft/jsch/Session;->isConnected:Z

    .line 107
    iput-boolean v3, p0, Lcom/jcraft/jsch/Session;->isAuthed:Z

    .line 109
    iput-object v2, p0, Lcom/jcraft/jsch/Session;->connectThread:Ljava/lang/Thread;

    .line 110
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->lock:Ljava/lang/Object;

    .line 112
    iput-boolean v3, p0, Lcom/jcraft/jsch/Session;->x11_forwarding:Z

    .line 113
    iput-boolean v3, p0, Lcom/jcraft/jsch/Session;->agent_forwarding:Z

    .line 115
    iput-object v2, p0, Lcom/jcraft/jsch/Session;->in:Ljava/io/InputStream;

    .line 116
    iput-object v2, p0, Lcom/jcraft/jsch/Session;->out:Ljava/io/OutputStream;

    .line 123
    iput-object v2, p0, Lcom/jcraft/jsch/Session;->socket_factory:Lcom/jcraft/jsch/SocketFactory;

    .line 129
    iput-object v2, p0, Lcom/jcraft/jsch/Session;->config:Ljava/util/Hashtable;

    .line 131
    iput-object v2, p0, Lcom/jcraft/jsch/Session;->proxy:Lcom/jcraft/jsch/Proxy;

    .line 134
    iput-object v2, p0, Lcom/jcraft/jsch/Session;->hostKeyAlias:Ljava/lang/String;

    .line 135
    iput v3, p0, Lcom/jcraft/jsch/Session;->serverAliveInterval:I

    .line 136
    iput v4, p0, Lcom/jcraft/jsch/Session;->serverAliveCountMax:I

    .line 138
    iput-object v2, p0, Lcom/jcraft/jsch/Session;->identityRepository:Lcom/jcraft/jsch/IdentityRepository;

    .line 139
    iput-object v2, p0, Lcom/jcraft/jsch/Session;->hostkeyRepository:Lcom/jcraft/jsch/HostKeyRepository;

    .line 141
    iput-boolean v3, p0, Lcom/jcraft/jsch/Session;->daemon_thread:Z

    .line 143
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/jcraft/jsch/Session;->kex_start_time:J

    .line 145
    const/4 v0, 0x6

    iput v0, p0, Lcom/jcraft/jsch/Session;->max_auth_tries:I

    .line 146
    iput v3, p0, Lcom/jcraft/jsch/Session;->auth_failures:I

    .line 148
    const-string v0, "127.0.0.1"

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    .line 149
    const-string v0, "127.0.0.1"

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->org_host:Ljava/lang/String;

    .line 150
    const/16 v0, 0x16

    iput v0, p0, Lcom/jcraft/jsch/Session;->port:I

    .line 152
    iput-object v2, p0, Lcom/jcraft/jsch/Session;->username:Ljava/lang/String;

    .line 153
    iput-object v2, p0, Lcom/jcraft/jsch/Session;->password:[B

    .line 605
    iput-boolean v3, p0, Lcom/jcraft/jsch/Session;->in_kex:Z

    .line 900
    new-array v0, v4, [I

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->uncompress_len:[I

    .line 901
    new-array v0, v4, [I

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->compress_len:[I

    .line 903
    iput v5, p0, Lcom/jcraft/jsch/Session;->s2ccipher_size:I

    .line 904
    iput v5, p0, Lcom/jcraft/jsch/Session;->c2scipher_size:I

    .line 2128
    new-instance v0, Lcom/jcraft/jsch/Session$GlobalRequestReply;

    invoke-direct {v0, p0, v2}, Lcom/jcraft/jsch/Session$GlobalRequestReply;-><init>(Lcom/jcraft/jsch/Session;Lcom/jcraft/jsch/Session$1;)V

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->grr:Lcom/jcraft/jsch/Session$GlobalRequestReply;

    .line 2372
    iput-object v2, p0, Lcom/jcraft/jsch/Session;->hostkey:Lcom/jcraft/jsch/HostKey;

    .line 159
    iput-object p1, p0, Lcom/jcraft/jsch/Session;->jsch:Lcom/jcraft/jsch/JSch;

    .line 160
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    invoke-direct {v0}, Lcom/jcraft/jsch/Buffer;-><init>()V

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    .line 161
    new-instance v0, Lcom/jcraft/jsch/Packet;

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->packet:Lcom/jcraft/jsch/Packet;

    .line 162
    iput-object p2, p0, Lcom/jcraft/jsch/Session;->username:Ljava/lang/String;

    .line 163
    iput-object p3, p0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    iput-object p3, p0, Lcom/jcraft/jsch/Session;->org_host:Ljava/lang/String;

    .line 164
    iput p4, p0, Lcom/jcraft/jsch/Session;->port:I

    .line 166
    invoke-direct {p0}, Lcom/jcraft/jsch/Session;->applyConfig()V

    .line 168
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->username:Ljava/lang/String;

    if-nez v0, :cond_a0

    .line 170
    :try_start_90
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v0

    const-string v1, "user.name"

    invoke-virtual {v0, v1}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->username:Ljava/lang/String;
    :try_end_a0
    .catch Ljava/lang/SecurityException; {:try_start_90 .. :try_end_a0} :catch_ad

    .line 177
    :cond_a0
    :goto_a0
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->username:Ljava/lang/String;

    if-nez v0, :cond_ac

    .line 178
    new-instance v0, Lcom/jcraft/jsch/JSchException;

    const-string v1, "username is not given."

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 180
    :cond_ac
    return-void

    .line 172
    :catch_ad
    move-exception v0

    goto :goto_a0
.end method

.method private _setPortForwardingR(Ljava/lang/String;I)I
    .registers 14
    .param p1, "bind_address"    # Ljava/lang/String;
    .param p2, "rport"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x1

    .line 2130
    iget-object v7, p0, Lcom/jcraft/jsch/Session;->grr:Lcom/jcraft/jsch/Session$GlobalRequestReply;

    monitor-enter v7

    .line 2131
    :try_start_4
    new-instance v1, Lcom/jcraft/jsch/Buffer;

    const/16 v6, 0x64

    invoke-direct {v1, v6}, Lcom/jcraft/jsch/Buffer;-><init>(I)V

    .line 2132
    .local v1, "buf":Lcom/jcraft/jsch/Buffer;
    new-instance v4, Lcom/jcraft/jsch/Packet;

    invoke-direct {v4, v1}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    .line 2134
    .local v4, "packet":Lcom/jcraft/jsch/Packet;
    invoke-static {p1}, Lcom/jcraft/jsch/ChannelForwardedTCPIP;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2136
    .local v0, "address_to_bind":Ljava/lang/String;
    iget-object v6, p0, Lcom/jcraft/jsch/Session;->grr:Lcom/jcraft/jsch/Session$GlobalRequestReply;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v8

    invoke-virtual {v6, v8}, Lcom/jcraft/jsch/Session$GlobalRequestReply;->setThread(Ljava/lang/Thread;)V

    .line 2137
    iget-object v6, p0, Lcom/jcraft/jsch/Session;->grr:Lcom/jcraft/jsch/Session$GlobalRequestReply;

    invoke-virtual {v6, p2}, Lcom/jcraft/jsch/Session$GlobalRequestReply;->setPort(I)V
    :try_end_22
    .catchall {:try_start_4 .. :try_end_22} :catchall_75

    .line 2145
    :try_start_22
    invoke-virtual {v4}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 2146
    const/16 v6, 0x50

    invoke-virtual {v1, v6}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 2147
    const-string v6, "tcpip-forward"

    invoke-static {v6}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v6

    invoke-virtual {v1, v6}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 2148
    const/4 v6, 0x1

    invoke-virtual {v1, v6}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 2149
    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v6

    invoke-virtual {v1, v6}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 2150
    invoke-virtual {v1, p2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2151
    invoke-virtual {p0, v4}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V
    :try_end_44
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_44} :catch_60
    .catchall {:try_start_22 .. :try_end_44} :catchall_75

    .line 2160
    const/4 v2, 0x0

    .line 2161
    .local v2, "count":I
    :try_start_45
    iget-object v6, p0, Lcom/jcraft/jsch/Session;->grr:Lcom/jcraft/jsch/Session$GlobalRequestReply;

    invoke-virtual {v6}, Lcom/jcraft/jsch/Session$GlobalRequestReply;->getReply()I
    :try_end_4a
    .catchall {:try_start_45 .. :try_end_4a} :catchall_75

    move-result v5

    .line 2162
    .local v5, "reply":I
    :goto_4b
    const/16 v6, 0xa

    if-ge v2, v6, :cond_82

    const/4 v6, -0x1

    if-ne v5, v6, :cond_82

    .line 2163
    const-wide/16 v8, 0x3e8

    :try_start_54
    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V
    :try_end_57
    .catch Ljava/lang/Exception; {:try_start_54 .. :try_end_57} :catch_ab
    .catchall {:try_start_54 .. :try_end_57} :catchall_75

    .line 2166
    :goto_57
    add-int/lit8 v2, v2, 0x1

    .line 2167
    :try_start_59
    iget-object v6, p0, Lcom/jcraft/jsch/Session;->grr:Lcom/jcraft/jsch/Session$GlobalRequestReply;

    invoke-virtual {v6}, Lcom/jcraft/jsch/Session$GlobalRequestReply;->getReply()I

    move-result v5

    goto :goto_4b

    .line 2153
    .end local v2    # "count":I
    .end local v5    # "reply":I
    :catch_60
    move-exception v3

    .line 2154
    .local v3, "e":Ljava/lang/Exception;
    iget-object v6, p0, Lcom/jcraft/jsch/Session;->grr:Lcom/jcraft/jsch/Session$GlobalRequestReply;

    const/4 v8, 0x0

    invoke-virtual {v6, v8}, Lcom/jcraft/jsch/Session$GlobalRequestReply;->setThread(Ljava/lang/Thread;)V

    .line 2155
    instance-of v6, v3, Ljava/lang/Throwable;

    if-eqz v6, :cond_78

    .line 2156
    new-instance v6, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v8, v3}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 2174
    .end local v0    # "address_to_bind":Ljava/lang/String;
    .end local v1    # "buf":Lcom/jcraft/jsch/Buffer;
    .end local v3    # "e":Ljava/lang/Exception;
    .end local v4    # "packet":Lcom/jcraft/jsch/Packet;
    :catchall_75
    move-exception v6

    monitor-exit v7
    :try_end_77
    .catchall {:try_start_59 .. :try_end_77} :catchall_75

    throw v6

    .line 2157
    .restart local v0    # "address_to_bind":Ljava/lang/String;
    .restart local v1    # "buf":Lcom/jcraft/jsch/Buffer;
    .restart local v3    # "e":Ljava/lang/Exception;
    .restart local v4    # "packet":Lcom/jcraft/jsch/Packet;
    :cond_78
    :try_start_78
    new-instance v6, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v8}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 2169
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v2    # "count":I
    .restart local v5    # "reply":I
    :cond_82
    iget-object v6, p0, Lcom/jcraft/jsch/Session;->grr:Lcom/jcraft/jsch/Session$GlobalRequestReply;

    const/4 v8, 0x0

    invoke-virtual {v6, v8}, Lcom/jcraft/jsch/Session$GlobalRequestReply;->setThread(Ljava/lang/Thread;)V

    .line 2170
    if-eq v5, v10, :cond_a3

    .line 2171
    new-instance v6, Lcom/jcraft/jsch/JSchException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "remote port forwarding failed for listen port "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v8}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 2173
    :cond_a3
    iget-object v6, p0, Lcom/jcraft/jsch/Session;->grr:Lcom/jcraft/jsch/Session$GlobalRequestReply;

    invoke-virtual {v6}, Lcom/jcraft/jsch/Session$GlobalRequestReply;->getPort()I

    move-result p2

    .line 2174
    monitor-exit v7
    :try_end_aa
    .catchall {:try_start_78 .. :try_end_aa} :catchall_75

    .line 2175
    return p2

    .line 2164
    :catch_ab
    move-exception v6

    goto :goto_57
.end method

.method private _write(Lcom/jcraft/jsch/Packet;)V
    .registers 4
    .param p1, "packet"    # Lcom/jcraft/jsch/Packet;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1352
    iget-object v1, p0, Lcom/jcraft/jsch/Session;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 1353
    :try_start_3
    invoke-virtual {p0, p1}, Lcom/jcraft/jsch/Session;->encode(Lcom/jcraft/jsch/Packet;)V

    .line 1354
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    if-eqz v0, :cond_15

    .line 1355
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {v0, p1}, Lcom/jcraft/jsch/IO;->put(Lcom/jcraft/jsch/Packet;)V

    .line 1356
    iget v0, p0, Lcom/jcraft/jsch/Session;->seqo:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/jcraft/jsch/Session;->seqo:I

    .line 1358
    :cond_15
    monitor-exit v1

    .line 1359
    return-void

    .line 1358
    :catchall_17
    move-exception v0

    monitor-exit v1
    :try_end_19
    .catchall {:try_start_3 .. :try_end_19} :catchall_17

    throw v0
.end method

.method private applyConfig()V
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 2612
    iget-object v12, p0, Lcom/jcraft/jsch/Session;->jsch:Lcom/jcraft/jsch/JSch;

    invoke-virtual {v12}, Lcom/jcraft/jsch/JSch;->getConfigRepository()Lcom/jcraft/jsch/ConfigRepository;

    move-result-object v1

    .line 2613
    .local v1, "configRepository":Lcom/jcraft/jsch/ConfigRepository;
    if-nez v1, :cond_9

    .line 2723
    :cond_8
    :goto_8
    return-void

    .line 2617
    :cond_9
    iget-object v12, p0, Lcom/jcraft/jsch/Session;->org_host:Ljava/lang/String;

    invoke-interface {v1, v12}, Lcom/jcraft/jsch/ConfigRepository;->getConfig(Ljava/lang/String;)Lcom/jcraft/jsch/ConfigRepository$Config;

    move-result-object v0

    .line 2620
    .local v0, "config":Lcom/jcraft/jsch/ConfigRepository$Config;
    const/4 v10, 0x0

    .line 2622
    .local v10, "value":Ljava/lang/String;
    invoke-interface {v0}, Lcom/jcraft/jsch/ConfigRepository$Config;->getUser()Ljava/lang/String;

    move-result-object v10

    .line 2623
    if-eqz v10, :cond_18

    .line 2624
    iput-object v10, p0, Lcom/jcraft/jsch/Session;->username:Ljava/lang/String;

    .line 2626
    :cond_18
    invoke-interface {v0}, Lcom/jcraft/jsch/ConfigRepository$Config;->getHostname()Ljava/lang/String;

    move-result-object v10

    .line 2627
    if-eqz v10, :cond_20

    .line 2628
    iput-object v10, p0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    .line 2630
    :cond_20
    invoke-interface {v0}, Lcom/jcraft/jsch/ConfigRepository$Config;->getPort()I

    move-result v9

    .line 2631
    .local v9, "port":I
    const/4 v12, -0x1

    if-eq v9, v12, :cond_29

    .line 2632
    iput v9, p0, Lcom/jcraft/jsch/Session;->port:I

    .line 2634
    :cond_29
    const-string v12, "kex"

    invoke-direct {p0, v0, v12}, Lcom/jcraft/jsch/Session;->checkConfig(Lcom/jcraft/jsch/ConfigRepository$Config;Ljava/lang/String;)V

    .line 2635
    const-string v12, "server_host_key"

    invoke-direct {p0, v0, v12}, Lcom/jcraft/jsch/Session;->checkConfig(Lcom/jcraft/jsch/ConfigRepository$Config;Ljava/lang/String;)V

    .line 2637
    const-string v12, "cipher.c2s"

    invoke-direct {p0, v0, v12}, Lcom/jcraft/jsch/Session;->checkConfig(Lcom/jcraft/jsch/ConfigRepository$Config;Ljava/lang/String;)V

    .line 2638
    const-string v12, "cipher.s2c"

    invoke-direct {p0, v0, v12}, Lcom/jcraft/jsch/Session;->checkConfig(Lcom/jcraft/jsch/ConfigRepository$Config;Ljava/lang/String;)V

    .line 2639
    const-string v12, "mac.c2s"

    invoke-direct {p0, v0, v12}, Lcom/jcraft/jsch/Session;->checkConfig(Lcom/jcraft/jsch/ConfigRepository$Config;Ljava/lang/String;)V

    .line 2640
    const-string v12, "mac.s2c"

    invoke-direct {p0, v0, v12}, Lcom/jcraft/jsch/Session;->checkConfig(Lcom/jcraft/jsch/ConfigRepository$Config;Ljava/lang/String;)V

    .line 2641
    const-string v12, "compression.c2s"

    invoke-direct {p0, v0, v12}, Lcom/jcraft/jsch/Session;->checkConfig(Lcom/jcraft/jsch/ConfigRepository$Config;Ljava/lang/String;)V

    .line 2642
    const-string v12, "compression.s2c"

    invoke-direct {p0, v0, v12}, Lcom/jcraft/jsch/Session;->checkConfig(Lcom/jcraft/jsch/ConfigRepository$Config;Ljava/lang/String;)V

    .line 2643
    const-string v12, "compression_level"

    invoke-direct {p0, v0, v12}, Lcom/jcraft/jsch/Session;->checkConfig(Lcom/jcraft/jsch/ConfigRepository$Config;Ljava/lang/String;)V

    .line 2645
    const-string v12, "StrictHostKeyChecking"

    invoke-direct {p0, v0, v12}, Lcom/jcraft/jsch/Session;->checkConfig(Lcom/jcraft/jsch/ConfigRepository$Config;Ljava/lang/String;)V

    .line 2646
    const-string v12, "HashKnownHosts"

    invoke-direct {p0, v0, v12}, Lcom/jcraft/jsch/Session;->checkConfig(Lcom/jcraft/jsch/ConfigRepository$Config;Ljava/lang/String;)V

    .line 2647
    const-string v12, "PreferredAuthentications"

    invoke-direct {p0, v0, v12}, Lcom/jcraft/jsch/Session;->checkConfig(Lcom/jcraft/jsch/ConfigRepository$Config;Ljava/lang/String;)V

    .line 2648
    const-string v12, "MaxAuthTries"

    invoke-direct {p0, v0, v12}, Lcom/jcraft/jsch/Session;->checkConfig(Lcom/jcraft/jsch/ConfigRepository$Config;Ljava/lang/String;)V

    .line 2649
    const-string v12, "ClearAllForwardings"

    invoke-direct {p0, v0, v12}, Lcom/jcraft/jsch/Session;->checkConfig(Lcom/jcraft/jsch/ConfigRepository$Config;Ljava/lang/String;)V

    .line 2651
    const-string v12, "HostKeyAlias"

    invoke-interface {v0, v12}, Lcom/jcraft/jsch/ConfigRepository$Config;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 2652
    if-eqz v10, :cond_7a

    .line 2653
    invoke-virtual {p0, v10}, Lcom/jcraft/jsch/Session;->setHostKeyAlias(Ljava/lang/String;)V

    .line 2655
    :cond_7a
    const-string v12, "UserKnownHostsFile"

    invoke-interface {v0, v12}, Lcom/jcraft/jsch/ConfigRepository$Config;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 2656
    if-eqz v10, :cond_8f

    .line 2657
    new-instance v8, Lcom/jcraft/jsch/KnownHosts;

    iget-object v12, p0, Lcom/jcraft/jsch/Session;->jsch:Lcom/jcraft/jsch/JSch;

    invoke-direct {v8, v12}, Lcom/jcraft/jsch/KnownHosts;-><init>(Lcom/jcraft/jsch/JSch;)V

    .line 2658
    .local v8, "kh":Lcom/jcraft/jsch/KnownHosts;
    invoke-virtual {v8, v10}, Lcom/jcraft/jsch/KnownHosts;->setKnownHosts(Ljava/lang/String;)V

    .line 2659
    invoke-virtual {p0, v8}, Lcom/jcraft/jsch/Session;->setHostKeyRepository(Lcom/jcraft/jsch/HostKeyRepository;)V

    .line 2662
    .end local v8    # "kh":Lcom/jcraft/jsch/KnownHosts;
    :cond_8f
    const-string v12, "IdentityFile"

    invoke-interface {v0, v12}, Lcom/jcraft/jsch/ConfigRepository$Config;->getValues(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v11

    .line 2663
    .local v11, "values":[Ljava/lang/String;
    if-eqz v11, :cond_f0

    .line 2664
    const-string v12, ""

    invoke-interface {v1, v12}, Lcom/jcraft/jsch/ConfigRepository;->getConfig(Ljava/lang/String;)Lcom/jcraft/jsch/ConfigRepository$Config;

    move-result-object v12

    const-string v13, "IdentityFile"

    invoke-interface {v12, v13}, Lcom/jcraft/jsch/ConfigRepository$Config;->getValues(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 2666
    .local v2, "global":[Ljava/lang/String;
    if-eqz v2, :cond_b3

    .line 2667
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_a6
    array-length v12, v2

    if-ge v3, v12, :cond_b6

    .line 2668
    iget-object v12, p0, Lcom/jcraft/jsch/Session;->jsch:Lcom/jcraft/jsch/JSch;

    aget-object v13, v2, v3

    invoke-virtual {v12, v13}, Lcom/jcraft/jsch/JSch;->addIdentity(Ljava/lang/String;)V

    .line 2667
    add-int/lit8 v3, v3, 0x1

    goto :goto_a6

    .line 2672
    .end local v3    # "i":I
    :cond_b3
    const/4 v12, 0x0

    new-array v2, v12, [Ljava/lang/String;

    .line 2674
    :cond_b6
    array-length v12, v11

    array-length v13, v2

    sub-int/2addr v12, v13

    if-lez v12, :cond_f0

    .line 2675
    new-instance v6, Lcom/jcraft/jsch/IdentityRepository$Wrapper;

    iget-object v12, p0, Lcom/jcraft/jsch/Session;->jsch:Lcom/jcraft/jsch/JSch;

    invoke-virtual {v12}, Lcom/jcraft/jsch/JSch;->getIdentityRepository()Lcom/jcraft/jsch/IdentityRepository;

    move-result-object v12

    const/4 v13, 0x1

    invoke-direct {v6, v12, v13}, Lcom/jcraft/jsch/IdentityRepository$Wrapper;-><init>(Lcom/jcraft/jsch/IdentityRepository;Z)V

    .line 2677
    .local v6, "ir":Lcom/jcraft/jsch/IdentityRepository$Wrapper;
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_c8
    array-length v12, v11

    if-ge v3, v12, :cond_ed

    .line 2678
    aget-object v5, v11, v3

    .line 2679
    .local v5, "ifile":Ljava/lang/String;
    const/4 v7, 0x0

    .local v7, "j":I
    :goto_ce
    array-length v12, v2

    if-ge v7, v12, :cond_dd

    .line 2680
    aget-object v12, v2, v7

    invoke-virtual {v5, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_dc

    .line 2679
    add-int/lit8 v7, v7, 0x1

    goto :goto_ce

    .line 2682
    :cond_dc
    const/4 v5, 0x0

    .line 2685
    :cond_dd
    if-nez v5, :cond_e2

    .line 2677
    :goto_df
    add-int/lit8 v3, v3, 0x1

    goto :goto_c8

    .line 2687
    :cond_e2
    const/4 v12, 0x0

    iget-object v13, p0, Lcom/jcraft/jsch/Session;->jsch:Lcom/jcraft/jsch/JSch;

    invoke-static {v5, v12, v13}, Lcom/jcraft/jsch/IdentityFile;->newInstance(Ljava/lang/String;Ljava/lang/String;Lcom/jcraft/jsch/JSch;)Lcom/jcraft/jsch/IdentityFile;

    move-result-object v4

    .line 2689
    .local v4, "identity":Lcom/jcraft/jsch/Identity;
    invoke-virtual {v6, v4}, Lcom/jcraft/jsch/IdentityRepository$Wrapper;->add(Lcom/jcraft/jsch/Identity;)V

    goto :goto_df

    .line 2691
    .end local v4    # "identity":Lcom/jcraft/jsch/Identity;
    .end local v5    # "ifile":Ljava/lang/String;
    .end local v7    # "j":I
    :cond_ed
    invoke-virtual {p0, v6}, Lcom/jcraft/jsch/Session;->setIdentityRepository(Lcom/jcraft/jsch/IdentityRepository;)V

    .line 2695
    .end local v2    # "global":[Ljava/lang/String;
    .end local v3    # "i":I
    .end local v6    # "ir":Lcom/jcraft/jsch/IdentityRepository$Wrapper;
    :cond_f0
    const-string v12, "ServerAliveInterval"

    invoke-interface {v0, v12}, Lcom/jcraft/jsch/ConfigRepository$Config;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 2696
    if-eqz v10, :cond_ff

    .line 2698
    :try_start_f8
    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    invoke-virtual {p0, v12}, Lcom/jcraft/jsch/Session;->setServerAliveInterval(I)V
    :try_end_ff
    .catch Ljava/lang/NumberFormatException; {:try_start_f8 .. :try_end_ff} :catch_12c

    .line 2704
    :cond_ff
    :goto_ff
    const-string v12, "ConnectTimeout"

    invoke-interface {v0, v12}, Lcom/jcraft/jsch/ConfigRepository$Config;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 2705
    if-eqz v10, :cond_10e

    .line 2707
    :try_start_107
    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    invoke-virtual {p0, v12}, Lcom/jcraft/jsch/Session;->setTimeout(I)V
    :try_end_10e
    .catch Ljava/lang/NumberFormatException; {:try_start_107 .. :try_end_10e} :catch_12a

    .line 2713
    :cond_10e
    :goto_10e
    const-string v12, "MaxAuthTries"

    invoke-interface {v0, v12}, Lcom/jcraft/jsch/ConfigRepository$Config;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 2714
    if-eqz v10, :cond_11b

    .line 2715
    const-string v12, "MaxAuthTries"

    invoke-virtual {p0, v12, v10}, Lcom/jcraft/jsch/Session;->setConfig(Ljava/lang/String;Ljava/lang/String;)V

    .line 2718
    :cond_11b
    const-string v12, "ClearAllForwardings"

    invoke-interface {v0, v12}, Lcom/jcraft/jsch/ConfigRepository$Config;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 2719
    if-eqz v10, :cond_8

    .line 2720
    const-string v12, "ClearAllForwardings"

    invoke-virtual {p0, v12, v10}, Lcom/jcraft/jsch/Session;->setConfig(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_8

    .line 2709
    :catch_12a
    move-exception v12

    goto :goto_10e

    .line 2700
    :catch_12c
    move-exception v12

    goto :goto_ff
.end method

.method private applyConfigChannel(Lcom/jcraft/jsch/ChannelSession;)V
    .registers 6
    .param p1, "channel"    # Lcom/jcraft/jsch/ChannelSession;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 2726
    iget-object v3, p0, Lcom/jcraft/jsch/Session;->jsch:Lcom/jcraft/jsch/JSch;

    invoke-virtual {v3}, Lcom/jcraft/jsch/JSch;->getConfigRepository()Lcom/jcraft/jsch/ConfigRepository;

    move-result-object v1

    .line 2727
    .local v1, "configRepository":Lcom/jcraft/jsch/ConfigRepository;
    if-nez v1, :cond_9

    .line 2745
    :cond_8
    :goto_8
    return-void

    .line 2731
    :cond_9
    iget-object v3, p0, Lcom/jcraft/jsch/Session;->org_host:Ljava/lang/String;

    invoke-interface {v1, v3}, Lcom/jcraft/jsch/ConfigRepository;->getConfig(Ljava/lang/String;)Lcom/jcraft/jsch/ConfigRepository$Config;

    move-result-object v0

    .line 2734
    .local v0, "config":Lcom/jcraft/jsch/ConfigRepository$Config;
    const/4 v2, 0x0

    .line 2736
    .local v2, "value":Ljava/lang/String;
    const-string v3, "ForwardAgent"

    invoke-interface {v0, v3}, Lcom/jcraft/jsch/ConfigRepository$Config;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 2737
    if-eqz v2, :cond_21

    .line 2738
    const-string v3, "yes"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    invoke-virtual {p1, v3}, Lcom/jcraft/jsch/ChannelSession;->setAgentForwarding(Z)V

    .line 2741
    :cond_21
    const-string v3, "RequestTTY"

    invoke-interface {v0, v3}, Lcom/jcraft/jsch/ConfigRepository$Config;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 2742
    if-eqz v2, :cond_8

    .line 2743
    const-string v3, "yes"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    invoke-virtual {p1, v3}, Lcom/jcraft/jsch/ChannelSession;->setPty(Z)V

    goto :goto_8
.end method

.method static checkCipher(Ljava/lang/String;)Z
    .registers 9
    .param p0, "cipher"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 2471
    :try_start_1
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 2472
    .local v2, "c":Ljava/lang/Class;
    invoke-virtual {v2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/jcraft/jsch/Cipher;

    move-object v0, v4

    check-cast v0, Lcom/jcraft/jsch/Cipher;

    move-object v1, v0

    .line 2473
    .local v1, "_c":Lcom/jcraft/jsch/Cipher;
    const/4 v4, 0x0

    invoke-interface {v1}, Lcom/jcraft/jsch/Cipher;->getBlockSize()I

    move-result v6

    new-array v6, v6, [B

    invoke-interface {v1}, Lcom/jcraft/jsch/Cipher;->getIVSize()I

    move-result v7

    new-array v7, v7, [B

    invoke-interface {v1, v4, v6, v7}, Lcom/jcraft/jsch/Cipher;->init(I[B[B)V
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1f} :catch_21

    .line 2476
    const/4 v4, 0x1

    .line 2479
    .end local v1    # "_c":Lcom/jcraft/jsch/Cipher;
    .end local v2    # "c":Ljava/lang/Class;
    :goto_20
    return v4

    .line 2478
    :catch_21
    move-exception v3

    .local v3, "e":Ljava/lang/Exception;
    move v4, v5

    .line 2479
    goto :goto_20
.end method

.method private checkCiphers(Ljava/lang/String;)[Ljava/lang/String;
    .registers 15
    .param p1, "ciphers"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    const/4 v12, 0x0

    const/4 v11, -0x1

    const/4 v10, 0x1

    .line 2433
    if-eqz p1, :cond_c

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_d

    .line 2466
    :cond_c
    return-object v4

    .line 2436
    :cond_d
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v7

    invoke-interface {v7, v10}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v7

    if-eqz v7, :cond_31

    .line 2437
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "CheckCiphers: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v10, v8}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 2441
    :cond_31
    const-string v7, "cipher.c2s"

    invoke-virtual {p0, v7}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 2442
    .local v2, "cipherc2s":Ljava/lang/String;
    const-string v7, "cipher.s2c"

    invoke-virtual {p0, v7}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 2444
    .local v3, "ciphers2c":Ljava/lang/String;
    new-instance v6, Ljava/util/Vector;

    invoke-direct {v6}, Ljava/util/Vector;-><init>()V

    .line 2445
    .local v6, "result":Ljava/util/Vector;
    const-string v7, ","

    invoke-static {p1, v7}, Lcom/jcraft/jsch/Util;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 2446
    .local v0, "_ciphers":[Ljava/lang/String;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_49
    array-length v7, v0

    if-ge v5, v7, :cond_6b

    .line 2447
    aget-object v1, v0, v5

    .line 2448
    .local v1, "cipher":Ljava/lang/String;
    invoke-virtual {v3, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    if-ne v7, v11, :cond_5d

    invoke-virtual {v2, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    if-ne v7, v11, :cond_5d

    .line 2446
    :cond_5a
    :goto_5a
    add-int/lit8 v5, v5, 0x1

    goto :goto_49

    .line 2450
    :cond_5d
    invoke-virtual {p0, v1}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/jcraft/jsch/Session;->checkCipher(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_5a

    .line 2451
    invoke-virtual {v6, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_5a

    .line 2454
    .end local v1    # "cipher":Ljava/lang/String;
    :cond_6b
    invoke-virtual {v6}, Ljava/util/Vector;->size()I

    move-result v7

    if-eqz v7, :cond_c

    .line 2456
    invoke-virtual {v6}, Ljava/util/Vector;->size()I

    move-result v7

    new-array v4, v7, [Ljava/lang/String;

    .line 2457
    .local v4, "foo":[Ljava/lang/String;
    invoke-virtual {v6}, Ljava/util/Vector;->toArray()[Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6}, Ljava/util/Vector;->size()I

    move-result v8

    invoke-static {v7, v12, v4, v12, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2459
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v7

    invoke-interface {v7, v10}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v7

    if-eqz v7, :cond_c

    .line 2460
    const/4 v5, 0x0

    :goto_8d
    array-length v7, v4

    if-ge v5, v7, :cond_c

    .line 2461
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v9, v4, v5

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " is not available."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v10, v8}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 2460
    add-int/lit8 v5, v5, 0x1

    goto :goto_8d
.end method

.method private checkConfig(Lcom/jcraft/jsch/ConfigRepository$Config;Ljava/lang/String;)V
    .registers 4
    .param p1, "config"    # Lcom/jcraft/jsch/ConfigRepository$Config;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 2776
    invoke-interface {p1, p2}, Lcom/jcraft/jsch/ConfigRepository$Config;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2777
    .local v0, "value":Ljava/lang/String;
    if-eqz v0, :cond_9

    .line 2778
    invoke-virtual {p0, p2, v0}, Lcom/jcraft/jsch/Session;->setConfig(Ljava/lang/String;Ljava/lang/String;)V

    .line 2779
    :cond_9
    return-void
.end method

.method private checkHost(Ljava/lang/String;ILcom/jcraft/jsch/KeyExchange;)V
    .registers 26
    .param p1, "chost"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "kex"    # Lcom/jcraft/jsch/KeyExchange;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 694
    const-string v18, "StrictHostKeyChecking"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 696
    .local v17, "shkc":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->hostKeyAlias:Ljava/lang/String;

    move-object/from16 v18, v0

    if-eqz v18, :cond_18

    .line 697
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->hostKeyAlias:Ljava/lang/String;

    move-object/from16 p1, v0

    .line 702
    :cond_18
    invoke-virtual/range {p3 .. p3}, Lcom/jcraft/jsch/KeyExchange;->getHostKey()[B

    move-result-object v3

    .line 703
    .local v3, "K_S":[B
    invoke-virtual/range {p3 .. p3}, Lcom/jcraft/jsch/KeyExchange;->getKeyType()Ljava/lang/String;

    move-result-object v14

    .line 704
    .local v14, "key_type":Ljava/lang/String;
    invoke-virtual/range {p3 .. p3}, Lcom/jcraft/jsch/KeyExchange;->getFingerPrint()Ljava/lang/String;

    move-result-object v13

    .line 706
    .local v13, "key_fprint":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->hostKeyAlias:Ljava/lang/String;

    move-object/from16 v18, v0

    if-nez v18, :cond_59

    const/16 v18, 0x16

    move/from16 v0, p2

    move/from16 v1, v18

    if-eq v0, v1, :cond_59

    .line 707
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "["

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "]:"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 710
    :cond_59
    invoke-virtual/range {p0 .. p0}, Lcom/jcraft/jsch/Session;->getHostKeyRepository()Lcom/jcraft/jsch/HostKeyRepository;

    move-result-object v9

    .line 712
    .local v9, "hkr":Lcom/jcraft/jsch/HostKeyRepository;
    const-string v18, "HashKnownHosts"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 713
    .local v8, "hkh":Ljava/lang/String;
    const-string v18, "yes"

    move-object/from16 v0, v18

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_156

    instance-of v0, v9, Lcom/jcraft/jsch/KnownHosts;

    move/from16 v18, v0

    if-eqz v18, :cond_156

    move-object/from16 v18, v9

    .line 714
    check-cast v18, Lcom/jcraft/jsch/KnownHosts;

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v3}, Lcom/jcraft/jsch/KnownHosts;->createHashedHostKey(Ljava/lang/String;[B)Lcom/jcraft/jsch/HostKey;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/Session;->hostkey:Lcom/jcraft/jsch/HostKey;

    .line 720
    :goto_89
    const/4 v10, 0x0

    .line 721
    .local v10, "i":I
    monitor-enter v9

    .line 722
    :try_start_8b
    move-object/from16 v0, p1

    invoke-interface {v9, v0, v3}, Lcom/jcraft/jsch/HostKeyRepository;->check(Ljava/lang/String;[B)I

    move-result v10

    .line 723
    monitor-exit v9
    :try_end_92
    .catchall {:try_start_8b .. :try_end_92} :catchall_167

    .line 725
    const/4 v11, 0x0

    .line 726
    .local v11, "insert":Z
    const-string v18, "ask"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_a3

    const-string v18, "yes"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_195

    :cond_a3
    const/16 v18, 0x2

    move/from16 v0, v18

    if-ne v10, v0, :cond_195

    .line 728
    const/4 v6, 0x0

    .line 729
    .local v6, "file":Ljava/lang/String;
    monitor-enter v9

    .line 730
    :try_start_ab
    invoke-interface {v9}, Lcom/jcraft/jsch/HostKeyRepository;->getKnownHostsRepositoryID()Ljava/lang/String;

    move-result-object v6

    .line 731
    monitor-exit v9
    :try_end_b0
    .catchall {:try_start_ab .. :try_end_b0} :catchall_16a

    .line 732
    if-nez v6, :cond_b4

    const-string v6, "known_hosts"

    .line 734
    :cond_b4
    const/4 v5, 0x0

    .line 736
    .local v5, "b":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->userinfo:Lcom/jcraft/jsch/UserInfo;

    move-object/from16 v18, v0

    if-eqz v18, :cond_137

    .line 737
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!\nIT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!\nSomeone could be eavesdropping on you right now (man-in-the-middle attack)!\nIt is also possible that the "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " host key has just been changed.\n"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "The fingerprint for the "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " key sent by the remote host is\n"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, ".\n"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "Please contact your system administrator.\n"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "Add correct host key in "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " to get rid of this message."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 747
    .local v16, "message":Ljava/lang/String;
    const-string v18, "ask"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_16d

    .line 748
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->userinfo:Lcom/jcraft/jsch/UserInfo;

    move-object/from16 v18, v0

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "\nDo you want to delete the old key and insert the new key?"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-interface/range {v18 .. v19}, Lcom/jcraft/jsch/UserInfo;->promptYesNo(Ljava/lang/String;)Z

    move-result v5

    .line 756
    .end local v16    # "message":Ljava/lang/String;
    :cond_137
    :goto_137
    if-nez v5, :cond_17b

    .line 757
    new-instance v18, Lcom/jcraft/jsch/JSchException;

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "HostKey has been changed: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 717
    .end local v5    # "b":Z
    .end local v6    # "file":Ljava/lang/String;
    .end local v10    # "i":I
    .end local v11    # "insert":Z
    :cond_156
    new-instance v18, Lcom/jcraft/jsch/HostKey;

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v3}, Lcom/jcraft/jsch/HostKey;-><init>(Ljava/lang/String;[B)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/Session;->hostkey:Lcom/jcraft/jsch/HostKey;

    goto/16 :goto_89

    .line 723
    .restart local v10    # "i":I
    :catchall_167
    move-exception v18

    :try_start_168
    monitor-exit v9
    :try_end_169
    .catchall {:try_start_168 .. :try_end_169} :catchall_167

    throw v18

    .line 731
    .restart local v6    # "file":Ljava/lang/String;
    .restart local v11    # "insert":Z
    :catchall_16a
    move-exception v18

    :try_start_16b
    monitor-exit v9
    :try_end_16c
    .catchall {:try_start_16b .. :try_end_16c} :catchall_16a

    throw v18

    .line 752
    .restart local v5    # "b":Z
    .restart local v16    # "message":Ljava/lang/String;
    :cond_16d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->userinfo:Lcom/jcraft/jsch/UserInfo;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Lcom/jcraft/jsch/UserInfo;->showMessage(Ljava/lang/String;)V

    goto :goto_137

    .line 760
    .end local v16    # "message":Ljava/lang/String;
    :cond_17b
    monitor-enter v9

    .line 761
    :try_start_17c
    const-string v18, "DSA"

    move-object/from16 v0, v18

    invoke-virtual {v14, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_1d0

    const-string v18, "ssh-dss"

    :goto_188
    const/16 v19, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-interface {v9, v0, v1, v2}, Lcom/jcraft/jsch/HostKeyRepository;->remove(Ljava/lang/String;Ljava/lang/String;[B)V

    .line 764
    const/4 v11, 0x1

    .line 765
    monitor-exit v9
    :try_end_195
    .catchall {:try_start_17c .. :try_end_195} :catchall_1d3

    .line 768
    .end local v5    # "b":Z
    .end local v6    # "file":Ljava/lang/String;
    :cond_195
    const-string v18, "ask"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_1a5

    const-string v18, "yes"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_247

    :cond_1a5
    if-eqz v10, :cond_247

    if-nez v11, :cond_247

    .line 770
    const-string v18, "yes"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_1d6

    .line 771
    new-instance v18, Lcom/jcraft/jsch/JSchException;

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "reject HostKey: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 761
    .restart local v5    # "b":Z
    .restart local v6    # "file":Ljava/lang/String;
    :cond_1d0
    :try_start_1d0
    const-string v18, "ssh-rsa"

    goto :goto_188

    .line 765
    :catchall_1d3
    move-exception v18

    monitor-exit v9
    :try_end_1d5
    .catchall {:try_start_1d0 .. :try_end_1d5} :catchall_1d3

    throw v18

    .line 774
    .end local v5    # "b":Z
    .end local v6    # "file":Ljava/lang/String;
    :cond_1d6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->userinfo:Lcom/jcraft/jsch/UserInfo;

    move-object/from16 v18, v0

    if-eqz v18, :cond_33c

    .line 775
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->userinfo:Lcom/jcraft/jsch/UserInfo;

    move-object/from16 v18, v0

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "The authenticity of host \'"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "\' can\'t be established.\n"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " key fingerprint is "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, ".\n"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "Are you sure you want to continue connecting?"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-interface/range {v18 .. v19}, Lcom/jcraft/jsch/UserInfo;->promptYesNo(Ljava/lang/String;)Z

    move-result v7

    .line 780
    .local v7, "foo":Z
    if-nez v7, :cond_246

    .line 781
    new-instance v18, Lcom/jcraft/jsch/JSchException;

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "reject HostKey: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 783
    :cond_246
    const/4 v11, 0x1

    .line 793
    .end local v7    # "foo":Z
    :cond_247
    const-string v18, "no"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_256

    const/16 v18, 0x1

    move/from16 v0, v18

    if-ne v0, v10, :cond_256

    .line 795
    const/4 v11, 0x1

    .line 798
    :cond_256
    if-nez v10, :cond_3a0

    .line 799
    const-string v18, "DSA"

    move-object/from16 v0, v18

    invoke-virtual {v14, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_398

    const-string v18, "ssh-dss"

    :goto_264
    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-interface {v9, v0, v1}, Lcom/jcraft/jsch/HostKeyRepository;->getHostKey(Ljava/lang/String;Ljava/lang/String;)[Lcom/jcraft/jsch/HostKey;

    move-result-object v15

    .line 802
    .local v15, "keys":[Lcom/jcraft/jsch/HostKey;
    const/16 v18, 0x0

    array-length v0, v3

    move/from16 v19, v0

    move/from16 v0, v18

    move/from16 v1, v19

    invoke-static {v3, v0, v1}, Lcom/jcraft/jsch/Util;->toBase64([BII)[B

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v4

    .line 803
    .local v4, "_key":Ljava/lang/String;
    const/4 v12, 0x0

    .local v12, "j":I
    :goto_27e
    array-length v0, v15

    move/from16 v18, v0

    move/from16 v0, v18

    if-ge v12, v0, :cond_3a0

    .line 804
    aget-object v18, v15, v10

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/HostKey;->getKey()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_39c

    aget-object v18, v15, v12

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/HostKey;->getMarker()Ljava/lang/String;

    move-result-object v18

    const-string v19, "@revoked"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_39c

    .line 806
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->userinfo:Lcom/jcraft/jsch/UserInfo;

    move-object/from16 v18, v0

    if-eqz v18, :cond_2e9

    .line 807
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->userinfo:Lcom/jcraft/jsch/UserInfo;

    move-object/from16 v18, v0

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "The "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " host key for "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " is marked as revoked.\n"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "This could mean that a stolen key is being used to "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "impersonate this host."

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-interface/range {v18 .. v19}, Lcom/jcraft/jsch/UserInfo;->showMessage(Ljava/lang/String;)V

    .line 812
    :cond_2e9
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v18

    const/16 v19, 0x1

    invoke-interface/range {v18 .. v19}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v18

    if-eqz v18, :cond_31d

    .line 813
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v18

    const/16 v19, 0x1

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Host \'"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "\' has provided revoked key."

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-interface/range {v18 .. v20}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 816
    :cond_31d
    new-instance v18, Lcom/jcraft/jsch/JSchException;

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "revoked HostKey: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 786
    .end local v4    # "_key":Ljava/lang/String;
    .end local v12    # "j":I
    .end local v15    # "keys":[Lcom/jcraft/jsch/HostKey;
    :cond_33c
    const/16 v18, 0x1

    move/from16 v0, v18

    if-ne v10, v0, :cond_379

    .line 787
    new-instance v18, Lcom/jcraft/jsch/JSchException;

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "UnknownHostKey: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, ". "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " key fingerprint is "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 789
    :cond_379
    new-instance v18, Lcom/jcraft/jsch/JSchException;

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "HostKey has been changed: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 799
    :cond_398
    const-string v18, "ssh-rsa"

    goto/16 :goto_264

    .line 803
    .restart local v4    # "_key":Ljava/lang/String;
    .restart local v12    # "j":I
    .restart local v15    # "keys":[Lcom/jcraft/jsch/HostKey;
    :cond_39c
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_27e

    .line 821
    .end local v4    # "_key":Ljava/lang/String;
    .end local v12    # "j":I
    .end local v15    # "keys":[Lcom/jcraft/jsch/HostKey;
    :cond_3a0
    if-nez v10, :cond_3e2

    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v18

    const/16 v19, 0x1

    invoke-interface/range {v18 .. v19}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v18

    if-eqz v18, :cond_3e2

    .line 823
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v18

    const/16 v19, 0x1

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Host \'"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "\' is known and mathces the "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, " host key"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-interface/range {v18 .. v20}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 827
    :cond_3e2
    if-eqz v11, :cond_424

    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v18

    const/16 v19, 0x2

    invoke-interface/range {v18 .. v19}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v18

    if-eqz v18, :cond_424

    .line 829
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v18

    const/16 v19, 0x2

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Permanently added \'"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "\' ("

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ") to the list of known hosts."

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-interface/range {v18 .. v20}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 833
    :cond_424
    if-eqz v11, :cond_43b

    .line 834
    monitor-enter v9

    .line 835
    :try_start_427
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->hostkey:Lcom/jcraft/jsch/HostKey;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->userinfo:Lcom/jcraft/jsch/UserInfo;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-interface {v9, v0, v1}, Lcom/jcraft/jsch/HostKeyRepository;->add(Lcom/jcraft/jsch/HostKey;Lcom/jcraft/jsch/UserInfo;)V

    .line 836
    monitor-exit v9

    .line 838
    :cond_43b
    return-void

    .line 836
    :catchall_43c
    move-exception v18

    monitor-exit v9
    :try_end_43e
    .catchall {:try_start_427 .. :try_end_43e} :catchall_43c

    throw v18
.end method

.method static checkKex(Lcom/jcraft/jsch/Session;Ljava/lang/String;)Z
    .registers 11
    .param p0, "s"    # Lcom/jcraft/jsch/Session;
    .param p1, "kex"    # Ljava/lang/String;

    .prologue
    .line 2516
    :try_start_0
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    .line 2517
    .local v7, "c":Ljava/lang/Class;
    invoke-virtual {v7}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/jcraft/jsch/KeyExchange;

    move-object v0, v2

    check-cast v0, Lcom/jcraft/jsch/KeyExchange;

    move-object v1, v0

    .line 2518
    .local v1, "_c":Lcom/jcraft/jsch/KeyExchange;
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v2, p0

    invoke-virtual/range {v1 .. v6}, Lcom/jcraft/jsch/KeyExchange;->init(Lcom/jcraft/jsch/Session;[B[B[B[B)V
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_16} :catch_18

    .line 2519
    const/4 v2, 0x1

    .line 2521
    .end local v1    # "_c":Lcom/jcraft/jsch/KeyExchange;
    .end local v7    # "c":Ljava/lang/Class;
    :goto_17
    return v2

    :catch_18
    move-exception v8

    .local v8, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    goto :goto_17
.end method

.method private checkKexes(Ljava/lang/String;)[Ljava/lang/String;
    .registers 11
    .param p1, "kexes"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 2484
    if-eqz p1, :cond_b

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_c

    .line 2511
    :cond_b
    return-object v1

    .line 2487
    :cond_c
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v4

    invoke-interface {v4, v7}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_30

    .line 2488
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "CheckKexes: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v7, v5}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 2492
    :cond_30
    new-instance v3, Ljava/util/Vector;

    invoke-direct {v3}, Ljava/util/Vector;-><init>()V

    .line 2493
    .local v3, "result":Ljava/util/Vector;
    const-string v4, ","

    invoke-static {p1, v4}, Lcom/jcraft/jsch/Util;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 2494
    .local v0, "_kexes":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_3c
    array-length v4, v0

    if-ge v2, v4, :cond_53

    .line 2495
    aget-object v4, v0, v2

    invoke-virtual {p0, v4}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v4}, Lcom/jcraft/jsch/Session;->checkKex(Lcom/jcraft/jsch/Session;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_50

    .line 2496
    aget-object v4, v0, v2

    invoke-virtual {v3, v4}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 2494
    :cond_50
    add-int/lit8 v2, v2, 0x1

    goto :goto_3c

    .line 2499
    :cond_53
    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v4

    if-eqz v4, :cond_b

    .line 2501
    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v4

    new-array v1, v4, [Ljava/lang/String;

    .line 2502
    .local v1, "foo":[Ljava/lang/String;
    invoke-virtual {v3}, Ljava/util/Vector;->toArray()[Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v5

    invoke-static {v4, v8, v1, v8, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2504
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v4

    invoke-interface {v4, v7}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 2505
    const/4 v2, 0x0

    :goto_75
    array-length v4, v1

    if-ge v2, v4, :cond_b

    .line 2506
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v6, v1, v2

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " is not available."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v7, v5}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 2505
    add-int/lit8 v2, v2, 0x1

    goto :goto_75
.end method

.method private expandKey(Lcom/jcraft/jsch/Buffer;[B[B[BLcom/jcraft/jsch/HASH;I)[B
    .registers 13
    .param p1, "buf"    # Lcom/jcraft/jsch/Buffer;
    .param p2, "K"    # [B
    .param p3, "H"    # [B
    .param p4, "key"    # [B
    .param p5, "hash"    # Lcom/jcraft/jsch/HASH;
    .param p6, "required_length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 1219
    move-object v0, p4

    .line 1220
    .local v0, "result":[B
    invoke-interface {p5}, Lcom/jcraft/jsch/HASH;->getBlockSize()I

    move-result v1

    .line 1221
    .local v1, "size":I
    :goto_6
    array-length v3, v0

    if-ge v3, p6, :cond_31

    .line 1222
    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->reset()V

    .line 1223
    invoke-virtual {p1, p2}, Lcom/jcraft/jsch/Buffer;->putMPInt([B)V

    .line 1224
    invoke-virtual {p1, p3}, Lcom/jcraft/jsch/Buffer;->putByte([B)V

    .line 1225
    invoke-virtual {p1, v0}, Lcom/jcraft/jsch/Buffer;->putByte([B)V

    .line 1226
    iget-object v3, p1, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget v4, p1, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-interface {p5, v3, v5, v4}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 1227
    array-length v3, v0

    add-int/2addr v3, v1

    new-array v2, v3, [B

    .line 1228
    .local v2, "tmp":[B
    array-length v3, v0

    invoke-static {v0, v5, v2, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1229
    invoke-interface {p5}, Lcom/jcraft/jsch/HASH;->digest()[B

    move-result-object v3

    array-length v4, v0

    invoke-static {v3, v5, v2, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1230
    invoke-static {v0}, Lcom/jcraft/jsch/Util;->bzero([B)V

    .line 1231
    move-object v0, v2

    .line 1232
    goto :goto_6

    .line 1233
    .end local v2    # "tmp":[B
    :cond_31
    return-object v0
.end method

.method private initDeflater(Ljava/lang/String;)V
    .registers 8
    .param p1, "method"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 2200
    const-string v4, "none"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c

    .line 2201
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/jcraft/jsch/Session;->deflater:Lcom/jcraft/jsch/Compression;

    .line 2225
    :cond_b
    :goto_b
    return-void

    .line 2204
    :cond_c
    invoke-virtual {p0, p1}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 2205
    .local v2, "foo":Ljava/lang/String;
    if-eqz v2, :cond_b

    .line 2206
    const-string v4, "zlib"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_26

    iget-boolean v4, p0, Lcom/jcraft/jsch/Session;->isAuthed:Z

    if-eqz v4, :cond_b

    const-string v4, "zlib@openssh.com"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 2209
    :cond_26
    :try_start_26
    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 2210
    .local v0, "c":Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/jcraft/jsch/Compression;

    check-cast v4, Lcom/jcraft/jsch/Compression;

    iput-object v4, p0, Lcom/jcraft/jsch/Session;->deflater:Lcom/jcraft/jsch/Compression;
    :try_end_34
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_26 .. :try_end_34} :catch_46
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_34} :catch_51

    .line 2211
    const/4 v3, 0x6

    .line 2212
    .local v3, "level":I
    :try_start_35
    const-string v4, "compression_level"

    invoke-virtual {p0, v4}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_35 .. :try_end_3e} :catch_5c
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_35 .. :try_end_3e} :catch_46

    move-result v3

    .line 2214
    :goto_3f
    :try_start_3f
    iget-object v4, p0, Lcom/jcraft/jsch/Session;->deflater:Lcom/jcraft/jsch/Compression;

    const/4 v5, 0x1

    invoke-interface {v4, v5, v3}, Lcom/jcraft/jsch/Compression;->init(II)V
    :try_end_45
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_3f .. :try_end_45} :catch_46
    .catch Ljava/lang/Exception; {:try_start_3f .. :try_end_45} :catch_51

    goto :goto_b

    .line 2216
    .end local v0    # "c":Ljava/lang/Class;
    .end local v3    # "level":I
    :catch_46
    move-exception v1

    .line 2217
    .local v1, "ee":Ljava/lang/NoClassDefFoundError;
    new-instance v4, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v1}, Ljava/lang/NoClassDefFoundError;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v1}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 2219
    .end local v1    # "ee":Ljava/lang/NoClassDefFoundError;
    :catch_51
    move-exception v1

    .line 2220
    .local v1, "ee":Ljava/lang/Exception;
    new-instance v4, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v1}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 2213
    .end local v1    # "ee":Ljava/lang/Exception;
    .restart local v0    # "c":Ljava/lang/Class;
    .restart local v3    # "level":I
    :catch_5c
    move-exception v4

    goto :goto_3f
.end method

.method private initInflater(Ljava/lang/String;)V
    .registers 8
    .param p1, "method"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 2227
    const-string v3, "none"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 2228
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/jcraft/jsch/Session;->inflater:Lcom/jcraft/jsch/Compression;

    .line 2246
    :cond_b
    :goto_b
    return-void

    .line 2231
    :cond_c
    invoke-virtual {p0, p1}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 2232
    .local v2, "foo":Ljava/lang/String;
    if-eqz v2, :cond_b

    .line 2233
    const-string v3, "zlib"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_26

    iget-boolean v3, p0, Lcom/jcraft/jsch/Session;->isAuthed:Z

    if-eqz v3, :cond_b

    const-string v3, "zlib@openssh.com"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 2236
    :cond_26
    :try_start_26
    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 2237
    .local v0, "c":Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/jcraft/jsch/Compression;

    check-cast v3, Lcom/jcraft/jsch/Compression;

    iput-object v3, p0, Lcom/jcraft/jsch/Session;->inflater:Lcom/jcraft/jsch/Compression;

    .line 2238
    iget-object v3, p0, Lcom/jcraft/jsch/Session;->inflater:Lcom/jcraft/jsch/Compression;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-interface {v3, v4, v5}, Lcom/jcraft/jsch/Compression;->init(II)V
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_3b} :catch_3c

    goto :goto_b

    .line 2240
    .end local v0    # "c":Ljava/lang/Class;
    :catch_3c
    move-exception v1

    .line 2241
    .local v1, "ee":Ljava/lang/Exception;
    new-instance v3, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method private parseForwarding(Ljava/lang/String;)Lcom/jcraft/jsch/Session$Forwarding;
    .registers 12
    .param p1, "conf"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    const/4 v9, -0x1

    .line 2013
    const-string v7, " "

    invoke-virtual {p1, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 2014
    .local v6, "tmp":[Ljava/lang/String;
    array-length v7, v6

    const/4 v8, 0x1

    if-le v7, v8, :cond_54

    .line 2015
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    .line 2016
    .local v2, "foo":Ljava/util/Vector;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_11
    array-length v7, v6

    if-ge v3, v7, :cond_29

    .line 2017
    aget-object v7, v6, v3

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_1f

    .line 2016
    :goto_1c
    add-int/lit8 v3, v3, 0x1

    goto :goto_11

    .line 2018
    :cond_1f
    aget-object v7, v6, v3

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_1c

    .line 2020
    :cond_29
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    .line 2021
    .local v5, "sb":Ljava/lang/StringBuffer;
    const/4 v3, 0x0

    :goto_2f
    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v7

    if-ge v3, v7, :cond_50

    .line 2022
    invoke-virtual {v2, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2023
    add-int/lit8 v7, v3, 0x1

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v8

    if-ge v7, v8, :cond_4d

    .line 2024
    const-string v7, ":"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2021
    :cond_4d
    add-int/lit8 v3, v3, 0x1

    goto :goto_2f

    .line 2026
    :cond_50
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 2029
    .end local v2    # "foo":Ljava/util/Vector;
    .end local v3    # "i":I
    .end local v5    # "sb":Ljava/lang/StringBuffer;
    :cond_54
    move-object v4, p1

    .line 2030
    .local v4, "org":Ljava/lang/String;
    new-instance v1, Lcom/jcraft/jsch/Session$Forwarding;

    const/4 v7, 0x0

    invoke-direct {v1, p0, v7}, Lcom/jcraft/jsch/Session$Forwarding;-><init>(Lcom/jcraft/jsch/Session;Lcom/jcraft/jsch/Session$1;)V

    .line 2032
    .local v1, "f":Lcom/jcraft/jsch/Session$Forwarding;
    :try_start_5b
    const-string v7, ":"

    invoke-virtual {p1, v7}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v7

    if-ne v7, v9, :cond_9a

    .line 2033
    new-instance v7, Lcom/jcraft/jsch/JSchException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "parseForwarding: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_7c
    .catch Ljava/lang/NumberFormatException; {:try_start_5b .. :try_end_7c} :catch_7c

    .line 2052
    :catch_7c
    move-exception v0

    .line 2053
    .local v0, "e":Ljava/lang/NumberFormatException;
    new-instance v7, Lcom/jcraft/jsch/JSchException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "parseForwarding: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 2034
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :cond_9a
    :try_start_9a
    const-string v7, ":"

    invoke-virtual {p1, v7}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {p1, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    iput v7, v1, Lcom/jcraft/jsch/Session$Forwarding;->hostport:I

    .line 2035
    const/4 v7, 0x0

    const-string v8, ":"

    invoke-virtual {p1, v8}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {p1, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 2036
    const-string v7, ":"

    invoke-virtual {p1, v7}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v7

    if-ne v7, v9, :cond_d8

    .line 2037
    new-instance v7, Lcom/jcraft/jsch/JSchException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "parseForwarding: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 2038
    :cond_d8
    const-string v7, ":"

    invoke-virtual {p1, v7}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {p1, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v1, Lcom/jcraft/jsch/Session$Forwarding;->host:Ljava/lang/String;

    .line 2039
    const/4 v7, 0x0

    const-string v8, ":"

    invoke-virtual {p1, v8}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {p1, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 2040
    const-string v7, ":"

    invoke-virtual {p1, v7}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v7

    if-eq v7, v9, :cond_133

    .line 2041
    const-string v7, ":"

    invoke-virtual {p1, v7}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {p1, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    iput v7, v1, Lcom/jcraft/jsch/Session$Forwarding;->port:I

    .line 2042
    const/4 v7, 0x0

    const-string v8, ":"

    invoke-virtual {p1, v8}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {p1, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 2043
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v7

    if-eqz v7, :cond_124

    const-string v7, "*"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_126

    :cond_124
    const-string p1, "0.0.0.0"

    .line 2044
    :cond_126
    const-string v7, "localhost"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_130

    const-string p1, "127.0.0.1"

    .line 2045
    :cond_130
    iput-object p1, v1, Lcom/jcraft/jsch/Session$Forwarding;->bind_address:Ljava/lang/String;

    .line 2055
    :goto_132
    return-object v1

    .line 2048
    :cond_133
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    iput v7, v1, Lcom/jcraft/jsch/Session$Forwarding;->port:I

    .line 2049
    const-string v7, "127.0.0.1"

    iput-object v7, v1, Lcom/jcraft/jsch/Session$Forwarding;->bind_address:Ljava/lang/String;
    :try_end_13d
    .catch Ljava/lang/NumberFormatException; {:try_start_9a .. :try_end_13d} :catch_7c

    goto :goto_132
.end method

.method private receive_kexinit(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/KeyExchange;
    .registers 12
    .param p1, "buf"    # Lcom/jcraft/jsch/Buffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 567
    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v9

    .line 568
    .local v9, "j":I
    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->getLength()I

    move-result v2

    if-eq v9, v2, :cond_3f

    .line 569
    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->getByte()I

    .line 570
    iget v2, p1, Lcom/jcraft/jsch/Buffer;->index:I

    add-int/lit8 v2, v2, -0x5

    new-array v2, v2, [B

    iput-object v2, p0, Lcom/jcraft/jsch/Session;->I_S:[B

    .line 575
    :goto_16
    iget-object v2, p1, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget v3, p1, Lcom/jcraft/jsch/Buffer;->s:I

    iget-object v4, p0, Lcom/jcraft/jsch/Session;->I_S:[B

    iget-object v5, p0, Lcom/jcraft/jsch/Session;->I_S:[B

    array-length v5, v5

    invoke-static {v2, v3, v4, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 577
    iget-boolean v2, p0, Lcom/jcraft/jsch/Session;->in_kex:Z

    if-nez v2, :cond_29

    .line 578
    invoke-direct {p0}, Lcom/jcraft/jsch/Session;->send_kexinit()V

    .line 581
    :cond_29
    iget-object v2, p0, Lcom/jcraft/jsch/Session;->I_S:[B

    iget-object v3, p0, Lcom/jcraft/jsch/Session;->I_C:[B

    invoke-static {v2, v3}, Lcom/jcraft/jsch/KeyExchange;->guess([B[B)[Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/jcraft/jsch/Session;->guess:[Ljava/lang/String;

    .line 582
    iget-object v2, p0, Lcom/jcraft/jsch/Session;->guess:[Ljava/lang/String;

    if-nez v2, :cond_4b

    .line 583
    new-instance v2, Lcom/jcraft/jsch/JSchException;

    const-string v3, "Algorithm negotiation fail"

    invoke-direct {v2, v3}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 573
    :cond_3f
    add-int/lit8 v2, v9, -0x1

    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-result v3

    sub-int/2addr v2, v3

    new-array v2, v2, [B

    iput-object v2, p0, Lcom/jcraft/jsch/Session;->I_S:[B

    goto :goto_16

    .line 586
    :cond_4b
    iget-boolean v2, p0, Lcom/jcraft/jsch/Session;->isAuthed:Z

    if-nez v2, :cond_71

    iget-object v2, p0, Lcom/jcraft/jsch/Session;->guess:[Ljava/lang/String;

    const/4 v3, 0x2

    aget-object v2, v2, v3

    const-string v3, "none"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_69

    iget-object v2, p0, Lcom/jcraft/jsch/Session;->guess:[Ljava/lang/String;

    const/4 v3, 0x3

    aget-object v2, v2, v3

    const-string v3, "none"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_71

    .line 589
    :cond_69
    new-instance v2, Lcom/jcraft/jsch/JSchException;

    const-string v3, "NONE Cipher should not be chosen before authentification is successed."

    invoke-direct {v2, v3}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 592
    :cond_71
    const/4 v1, 0x0

    .line 594
    .local v1, "kex":Lcom/jcraft/jsch/KeyExchange;
    :try_start_72
    iget-object v2, p0, Lcom/jcraft/jsch/Session;->guess:[Ljava/lang/String;

    const/4 v3, 0x0

    aget-object v2, v2, v3

    invoke-virtual {p0, v2}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    .line 595
    .local v7, "c":Ljava/lang/Class;
    invoke-virtual {v7}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/jcraft/jsch/KeyExchange;

    move-object v0, v2

    check-cast v0, Lcom/jcraft/jsch/KeyExchange;

    move-object v1, v0
    :try_end_89
    .catch Ljava/lang/Exception; {:try_start_72 .. :try_end_89} :catch_96

    .line 601
    iget-object v3, p0, Lcom/jcraft/jsch/Session;->V_S:[B

    iget-object v4, p0, Lcom/jcraft/jsch/Session;->V_C:[B

    iget-object v5, p0, Lcom/jcraft/jsch/Session;->I_S:[B

    iget-object v6, p0, Lcom/jcraft/jsch/Session;->I_C:[B

    move-object v2, p0

    invoke-virtual/range {v1 .. v6}, Lcom/jcraft/jsch/KeyExchange;->init(Lcom/jcraft/jsch/Session;[B[B[B[B)V

    .line 602
    return-object v1

    .line 597
    .end local v7    # "c":Ljava/lang/Class;
    :catch_96
    move-exception v8

    .line 598
    .local v8, "e":Ljava/lang/Exception;
    new-instance v2, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v8}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v8}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method private receive_newkeys(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/KeyExchange;)V
    .registers 4
    .param p1, "buf"    # Lcom/jcraft/jsch/Buffer;
    .param p2, "kex"    # Lcom/jcraft/jsch/KeyExchange;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1081
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/Session;->updateKeys(Lcom/jcraft/jsch/KeyExchange;)V

    .line 1082
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/jcraft/jsch/Session;->in_kex:Z

    .line 1083
    return-void
.end method

.method private requestPortForwarding()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 2749
    const-string v4, "ClearAllForwardings"

    invoke-virtual {p0, v4}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "yes"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_f

    .line 2773
    :cond_e
    return-void

    .line 2752
    :cond_f
    iget-object v4, p0, Lcom/jcraft/jsch/Session;->jsch:Lcom/jcraft/jsch/JSch;

    invoke-virtual {v4}, Lcom/jcraft/jsch/JSch;->getConfigRepository()Lcom/jcraft/jsch/ConfigRepository;

    move-result-object v1

    .line 2753
    .local v1, "configRepository":Lcom/jcraft/jsch/ConfigRepository;
    if-eqz v1, :cond_e

    .line 2757
    iget-object v4, p0, Lcom/jcraft/jsch/Session;->org_host:Ljava/lang/String;

    invoke-interface {v1, v4}, Lcom/jcraft/jsch/ConfigRepository;->getConfig(Ljava/lang/String;)Lcom/jcraft/jsch/ConfigRepository$Config;

    move-result-object v0

    .line 2760
    .local v0, "config":Lcom/jcraft/jsch/ConfigRepository$Config;
    const-string v4, "LocalForward"

    invoke-interface {v0, v4}, Lcom/jcraft/jsch/ConfigRepository$Config;->getValues(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 2761
    .local v3, "values":[Ljava/lang/String;
    if-eqz v3, :cond_31

    .line 2762
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_26
    array-length v4, v3

    if-ge v2, v4, :cond_31

    .line 2763
    aget-object v4, v3, v2

    invoke-virtual {p0, v4}, Lcom/jcraft/jsch/Session;->setPortForwardingL(Ljava/lang/String;)I

    .line 2762
    add-int/lit8 v2, v2, 0x1

    goto :goto_26

    .line 2767
    .end local v2    # "i":I
    :cond_31
    const-string v4, "RemoteForward"

    invoke-interface {v0, v4}, Lcom/jcraft/jsch/ConfigRepository$Config;->getValues(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 2768
    if-eqz v3, :cond_e

    .line 2769
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_3a
    array-length v4, v3

    if-ge v2, v4, :cond_e

    .line 2770
    aget-object v4, v3, v2

    invoke-virtual {p0, v4}, Lcom/jcraft/jsch/Session;->setPortForwardingR(Ljava/lang/String;)I

    .line 2769
    add-int/lit8 v2, v2, 0x1

    goto :goto_3a
.end method

.method private send_kexinit()V
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v13, 0x0

    const/4 v12, 0x1

    .line 610
    iget-boolean v7, p0, Lcom/jcraft/jsch/Session;->in_kex:Z

    if-eqz v7, :cond_7

    .line 679
    :cond_6
    :goto_6
    return-void

    .line 613
    :cond_7
    const-string v7, "cipher.c2s"

    invoke-virtual {p0, v7}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 614
    .local v1, "cipherc2s":Ljava/lang/String;
    const-string v7, "cipher.s2c"

    invoke-virtual {p0, v7}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 616
    .local v2, "ciphers2c":Ljava/lang/String;
    const-string v7, "CheckCiphers"

    invoke-virtual {p0, v7}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/jcraft/jsch/Session;->checkCiphers(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 617
    .local v4, "not_available_ciphers":[Ljava/lang/String;
    if-eqz v4, :cond_36

    array-length v7, v4

    if-lez v7, :cond_36

    .line 618
    invoke-static {v1, v4}, Lcom/jcraft/jsch/Util;->diffString(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 619
    invoke-static {v2, v4}, Lcom/jcraft/jsch/Util;->diffString(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 620
    if-eqz v1, :cond_2e

    if-nez v2, :cond_36

    .line 621
    :cond_2e
    new-instance v7, Lcom/jcraft/jsch/JSchException;

    const-string v8, "There are not any available ciphers."

    invoke-direct {v7, v8}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 625
    :cond_36
    const-string v7, "kex"

    invoke-virtual {p0, v7}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 626
    .local v3, "kex":Ljava/lang/String;
    const-string v7, "CheckKexes"

    invoke-virtual {p0, v7}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/jcraft/jsch/Session;->checkKexes(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 627
    .local v5, "not_available_kexes":[Ljava/lang/String;
    if-eqz v5, :cond_59

    array-length v7, v5

    if-lez v7, :cond_59

    .line 628
    invoke-static {v3, v5}, Lcom/jcraft/jsch/Util;->diffString(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 629
    if-nez v3, :cond_59

    .line 630
    new-instance v7, Lcom/jcraft/jsch/JSchException;

    const-string v8, "There are not any available kexes."

    invoke-direct {v7, v8}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 634
    :cond_59
    iput-boolean v12, p0, Lcom/jcraft/jsch/Session;->in_kex:Z

    .line 635
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    iput-wide v7, p0, Lcom/jcraft/jsch/Session;->kex_start_time:J

    .line 649
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    invoke-direct {v0}, Lcom/jcraft/jsch/Buffer;-><init>()V

    .line 650
    .local v0, "buf":Lcom/jcraft/jsch/Buffer;
    new-instance v6, Lcom/jcraft/jsch/Packet;

    invoke-direct {v6, v0}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    .line 651
    .local v6, "packet":Lcom/jcraft/jsch/Packet;
    invoke-virtual {v6}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 652
    const/16 v7, 0x14

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 653
    sget-object v8, Lcom/jcraft/jsch/Session;->random:Lcom/jcraft/jsch/Random;

    monitor-enter v8

    .line 654
    :try_start_76
    sget-object v7, Lcom/jcraft/jsch/Session;->random:Lcom/jcraft/jsch/Random;

    iget-object v9, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget v10, v0, Lcom/jcraft/jsch/Buffer;->index:I

    const/16 v11, 0x10

    invoke-interface {v7, v9, v10, v11}, Lcom/jcraft/jsch/Random;->fill([BII)V

    const/16 v7, 0x10

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->skip(I)V

    .line 655
    monitor-exit v8
    :try_end_87
    .catchall {:try_start_76 .. :try_end_87} :catchall_126

    .line 656
    invoke-static {v3}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 657
    const-string v7, "server_host_key"

    invoke-virtual {p0, v7}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 658
    invoke-static {v1}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 659
    invoke-static {v2}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 660
    const-string v7, "mac.c2s"

    invoke-virtual {p0, v7}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 661
    const-string v7, "mac.s2c"

    invoke-virtual {p0, v7}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 662
    const-string v7, "compression.c2s"

    invoke-virtual {p0, v7}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 663
    const-string v7, "compression.s2c"

    invoke-virtual {p0, v7}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 664
    const-string v7, "lang.c2s"

    invoke-virtual {p0, v7}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 665
    const-string v7, "lang.s2c"

    invoke-virtual {p0, v7}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 666
    invoke-virtual {v0, v13}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 667
    invoke-virtual {v0, v13}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 669
    const/4 v7, 0x5

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->setOffSet(I)V

    .line 670
    invoke-virtual {v0}, Lcom/jcraft/jsch/Buffer;->getLength()I

    move-result v7

    new-array v7, v7, [B

    iput-object v7, p0, Lcom/jcraft/jsch/Session;->I_C:[B

    .line 671
    iget-object v7, p0, Lcom/jcraft/jsch/Session;->I_C:[B

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->getByte([B)V

    .line 673
    invoke-virtual {p0, v6}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 675
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v7

    invoke-interface {v7, v12}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 676
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v7

    const-string v8, "SSH_MSG_KEXINIT sent"

    invoke-interface {v7, v12, v8}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    goto/16 :goto_6

    .line 655
    :catchall_126
    move-exception v7

    :try_start_127
    monitor-exit v8
    :try_end_128
    .catchall {:try_start_127 .. :try_end_128} :catchall_126

    throw v7
.end method

.method private send_newkeys()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 683
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {v0}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 684
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    const/16 v1, 0x15

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 685
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 687
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v0

    invoke-interface {v0, v2}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_25

    .line 688
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v0

    const-string v1, "SSH_MSG_NEWKEYS sent"

    invoke-interface {v0, v2, v1}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 691
    :cond_25
    return-void
.end method

.method private start_discard(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/Cipher;Lcom/jcraft/jsch/MAC;II)V
    .registers 11
    .param p1, "buf"    # Lcom/jcraft/jsch/Buffer;
    .param p2, "cipher"    # Lcom/jcraft/jsch/Cipher;
    .param p3, "mac"    # Lcom/jcraft/jsch/MAC;
    .param p4, "packet_length"    # I
    .param p5, "discard"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 1047
    const/4 v0, 0x0

    .line 1049
    .local v0, "discard_mac":Lcom/jcraft/jsch/MAC;
    invoke-interface {p2}, Lcom/jcraft/jsch/Cipher;->isCBC()Z

    move-result v2

    if-nez v2, :cond_10

    .line 1050
    new-instance v2, Lcom/jcraft/jsch/JSchException;

    const-string v3, "Packet corrupt"

    invoke-direct {v2, v3}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1053
    :cond_10
    const/high16 v2, 0x40000

    if-eq p4, v2, :cond_17

    if-eqz p3, :cond_17

    .line 1054
    move-object v0, p3

    .line 1057
    :cond_17
    iget v2, p1, Lcom/jcraft/jsch/Buffer;->index:I

    sub-int/2addr p5, v2

    .line 1059
    :goto_1a
    if-lez p5, :cond_39

    .line 1060
    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->reset()V

    .line 1061
    iget-object v2, p1, Lcom/jcraft/jsch/Buffer;->buffer:[B

    array-length v2, v2

    if-le p5, v2, :cond_37

    iget-object v2, p1, Lcom/jcraft/jsch/Buffer;->buffer:[B

    array-length v1, v2

    .line 1062
    .local v1, "len":I
    :goto_27
    iget-object v2, p0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    iget-object v3, p1, Lcom/jcraft/jsch/Buffer;->buffer:[B

    invoke-virtual {v2, v3, v4, v1}, Lcom/jcraft/jsch/IO;->getByte([BII)V

    .line 1063
    if-eqz v0, :cond_35

    .line 1064
    iget-object v2, p1, Lcom/jcraft/jsch/Buffer;->buffer:[B

    invoke-interface {v0, v2, v4, v1}, Lcom/jcraft/jsch/MAC;->update([BII)V

    .line 1066
    :cond_35
    sub-int/2addr p5, v1

    .line 1067
    goto :goto_1a

    .end local v1    # "len":I
    :cond_37
    move v1, p5

    .line 1061
    goto :goto_27

    .line 1069
    :cond_39
    if-eqz v0, :cond_40

    .line 1070
    iget-object v2, p1, Lcom/jcraft/jsch/Buffer;->buffer:[B

    invoke-interface {v0, v2, v4}, Lcom/jcraft/jsch/MAC;->doFinal([BI)V

    .line 1073
    :cond_40
    new-instance v2, Lcom/jcraft/jsch/JSchException;

    const-string v3, "Packet corrupt"

    invoke-direct {v2, v3}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private updateKeys(Lcom/jcraft/jsch/KeyExchange;)V
    .registers 15
    .param p1, "kex"    # Lcom/jcraft/jsch/KeyExchange;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 1085
    invoke-virtual {p1}, Lcom/jcraft/jsch/KeyExchange;->getK()[B

    move-result-object v2

    .line 1086
    .local v2, "K":[B
    invoke-virtual {p1}, Lcom/jcraft/jsch/KeyExchange;->getH()[B

    move-result-object v3

    .line 1087
    .local v3, "H":[B
    invoke-virtual {p1}, Lcom/jcraft/jsch/KeyExchange;->getHash()Lcom/jcraft/jsch/HASH;

    move-result-object v5

    .line 1089
    .local v5, "hash":Lcom/jcraft/jsch/HASH;
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->session_id:[B

    if-nez v0, :cond_1c

    .line 1090
    array-length v0, v3

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->session_id:[B

    .line 1091
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->session_id:[B

    array-length v1, v3

    invoke-static {v3, v4, v0, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1103
    :cond_1c
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0}, Lcom/jcraft/jsch/Buffer;->reset()V

    .line 1104
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putMPInt([B)V

    .line 1105
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0, v3}, Lcom/jcraft/jsch/Buffer;->putByte([B)V

    .line 1106
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    const/16 v1, 0x41

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 1107
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->session_id:[B

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Buffer;->putByte([B)V

    .line 1108
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget v1, v1, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-interface {v5, v0, v4, v1}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 1109
    invoke-interface {v5}, Lcom/jcraft/jsch/HASH;->digest()[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->IVc2s:[B

    .line 1111
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget v0, v0, Lcom/jcraft/jsch/Buffer;->index:I

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->session_id:[B

    array-length v1, v1

    sub-int/2addr v0, v1

    add-int/lit8 v11, v0, -0x1

    .line 1113
    .local v11, "j":I
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    aget-byte v1, v0, v11

    add-int/lit8 v1, v1, 0x1

    int-to-byte v1, v1

    aput-byte v1, v0, v11

    .line 1114
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget v1, v1, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-interface {v5, v0, v4, v1}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 1115
    invoke-interface {v5}, Lcom/jcraft/jsch/HASH;->digest()[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->IVs2c:[B

    .line 1117
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    aget-byte v1, v0, v11

    add-int/lit8 v1, v1, 0x1

    int-to-byte v1, v1

    aput-byte v1, v0, v11

    .line 1118
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget v1, v1, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-interface {v5, v0, v4, v1}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 1119
    invoke-interface {v5}, Lcom/jcraft/jsch/HASH;->digest()[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->Ec2s:[B

    .line 1121
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    aget-byte v1, v0, v11

    add-int/lit8 v1, v1, 0x1

    int-to-byte v1, v1

    aput-byte v1, v0, v11

    .line 1122
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget v1, v1, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-interface {v5, v0, v4, v1}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 1123
    invoke-interface {v5}, Lcom/jcraft/jsch/HASH;->digest()[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->Es2c:[B

    .line 1125
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    aget-byte v1, v0, v11

    add-int/lit8 v1, v1, 0x1

    int-to-byte v1, v1

    aput-byte v1, v0, v11

    .line 1126
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget v1, v1, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-interface {v5, v0, v4, v1}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 1127
    invoke-interface {v5}, Lcom/jcraft/jsch/HASH;->digest()[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->MACc2s:[B

    .line 1129
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    aget-byte v1, v0, v11

    add-int/lit8 v1, v1, 0x1

    int-to-byte v1, v1

    aput-byte v1, v0, v11

    .line 1130
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget v1, v1, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-interface {v5, v0, v4, v1}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 1131
    invoke-interface {v5}, Lcom/jcraft/jsch/HASH;->digest()[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->MACs2c:[B

    .line 1137
    :try_start_e0
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->guess:[Ljava/lang/String;

    const/4 v1, 0x3

    aget-object v12, v0, v1

    .line 1138
    .local v12, "method":Ljava/lang/String;
    invoke-virtual {p0, v12}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    .line 1139
    .local v8, "c":Ljava/lang/Class;
    invoke-virtual {v8}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jcraft/jsch/Cipher;

    check-cast v0, Lcom/jcraft/jsch/Cipher;

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->s2ccipher:Lcom/jcraft/jsch/Cipher;

    .line 1140
    :goto_f7
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->s2ccipher:Lcom/jcraft/jsch/Cipher;

    invoke-interface {v0}, Lcom/jcraft/jsch/Cipher;->getBlockSize()I

    move-result v0

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->Es2c:[B

    array-length v1, v1

    if-le v0, v1, :cond_14a

    .line 1141
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0}, Lcom/jcraft/jsch/Buffer;->reset()V

    .line 1142
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putMPInt([B)V

    .line 1143
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0, v3}, Lcom/jcraft/jsch/Buffer;->putByte([B)V

    .line 1144
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->Es2c:[B

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Buffer;->putByte([B)V

    .line 1145
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v1, 0x0

    iget-object v4, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget v4, v4, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-interface {v5, v0, v1, v4}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 1146
    invoke-interface {v5}, Lcom/jcraft/jsch/HASH;->digest()[B

    move-result-object v10

    .line 1147
    .local v10, "foo":[B
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->Es2c:[B

    array-length v0, v0

    array-length v1, v10

    add-int/2addr v0, v1

    new-array v7, v0, [B

    .line 1148
    .local v7, "bar":[B
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->Es2c:[B

    const/4 v1, 0x0

    const/4 v4, 0x0

    iget-object v6, p0, Lcom/jcraft/jsch/Session;->Es2c:[B

    array-length v6, v6

    invoke-static {v0, v1, v7, v4, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1149
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->Es2c:[B

    array-length v1, v1

    array-length v4, v10

    invoke-static {v10, v0, v7, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1150
    iput-object v7, p0, Lcom/jcraft/jsch/Session;->Es2c:[B
    :try_end_143
    .catch Ljava/lang/Exception; {:try_start_e0 .. :try_end_143} :catch_144

    goto :goto_f7

    .line 1194
    .end local v7    # "bar":[B
    .end local v8    # "c":Ljava/lang/Class;
    .end local v10    # "foo":[B
    .end local v12    # "method":Ljava/lang/String;
    :catch_144
    move-exception v9

    .line 1195
    .local v9, "e":Ljava/lang/Exception;
    instance-of v0, v9, Lcom/jcraft/jsch/JSchException;

    if-eqz v0, :cond_255

    .line 1196
    throw v9

    .line 1152
    .end local v9    # "e":Ljava/lang/Exception;
    .restart local v8    # "c":Ljava/lang/Class;
    .restart local v12    # "method":Ljava/lang/String;
    :cond_14a
    :try_start_14a
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->s2ccipher:Lcom/jcraft/jsch/Cipher;

    const/4 v1, 0x1

    iget-object v4, p0, Lcom/jcraft/jsch/Session;->Es2c:[B

    iget-object v6, p0, Lcom/jcraft/jsch/Session;->IVs2c:[B

    invoke-interface {v0, v1, v4, v6}, Lcom/jcraft/jsch/Cipher;->init(I[B[B)V

    .line 1153
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->s2ccipher:Lcom/jcraft/jsch/Cipher;

    invoke-interface {v0}, Lcom/jcraft/jsch/Cipher;->getIVSize()I

    move-result v0

    iput v0, p0, Lcom/jcraft/jsch/Session;->s2ccipher_size:I

    .line 1155
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->guess:[Ljava/lang/String;

    const/4 v1, 0x5

    aget-object v12, v0, v1

    .line 1156
    invoke-virtual {p0, v12}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    .line 1157
    invoke-virtual {v8}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jcraft/jsch/MAC;

    check-cast v0, Lcom/jcraft/jsch/MAC;

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->s2cmac:Lcom/jcraft/jsch/MAC;

    .line 1158
    iget-object v1, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v4, p0, Lcom/jcraft/jsch/Session;->MACs2c:[B

    iget-object v0, p0, Lcom/jcraft/jsch/Session;->s2cmac:Lcom/jcraft/jsch/MAC;

    invoke-interface {v0}, Lcom/jcraft/jsch/MAC;->getBlockSize()I

    move-result v6

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/jcraft/jsch/Session;->expandKey(Lcom/jcraft/jsch/Buffer;[B[B[BLcom/jcraft/jsch/HASH;I)[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->MACs2c:[B

    .line 1159
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->s2cmac:Lcom/jcraft/jsch/MAC;

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->MACs2c:[B

    invoke-interface {v0, v1}, Lcom/jcraft/jsch/MAC;->init([B)V

    .line 1161
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->s2cmac:Lcom/jcraft/jsch/MAC;

    invoke-interface {v0}, Lcom/jcraft/jsch/MAC;->getBlockSize()I

    move-result v0

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->s2cmac_result1:[B

    .line 1162
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->s2cmac:Lcom/jcraft/jsch/MAC;

    invoke-interface {v0}, Lcom/jcraft/jsch/MAC;->getBlockSize()I

    move-result v0

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->s2cmac_result2:[B

    .line 1164
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->guess:[Ljava/lang/String;

    const/4 v1, 0x2

    aget-object v12, v0, v1

    .line 1165
    invoke-virtual {p0, v12}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    .line 1166
    invoke-virtual {v8}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jcraft/jsch/Cipher;

    check-cast v0, Lcom/jcraft/jsch/Cipher;

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->c2scipher:Lcom/jcraft/jsch/Cipher;

    .line 1167
    :goto_1b6
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->c2scipher:Lcom/jcraft/jsch/Cipher;

    invoke-interface {v0}, Lcom/jcraft/jsch/Cipher;->getBlockSize()I

    move-result v0

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->Ec2s:[B

    array-length v1, v1

    if-le v0, v1, :cond_203

    .line 1168
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0}, Lcom/jcraft/jsch/Buffer;->reset()V

    .line 1169
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putMPInt([B)V

    .line 1170
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0, v3}, Lcom/jcraft/jsch/Buffer;->putByte([B)V

    .line 1171
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->Ec2s:[B

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Buffer;->putByte([B)V

    .line 1172
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v1, 0x0

    iget-object v4, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget v4, v4, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-interface {v5, v0, v1, v4}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 1173
    invoke-interface {v5}, Lcom/jcraft/jsch/HASH;->digest()[B

    move-result-object v10

    .line 1174
    .restart local v10    # "foo":[B
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->Ec2s:[B

    array-length v0, v0

    array-length v1, v10

    add-int/2addr v0, v1

    new-array v7, v0, [B

    .line 1175
    .restart local v7    # "bar":[B
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->Ec2s:[B

    const/4 v1, 0x0

    const/4 v4, 0x0

    iget-object v6, p0, Lcom/jcraft/jsch/Session;->Ec2s:[B

    array-length v6, v6

    invoke-static {v0, v1, v7, v4, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1176
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->Ec2s:[B

    array-length v1, v1

    array-length v4, v10

    invoke-static {v10, v0, v7, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1177
    iput-object v7, p0, Lcom/jcraft/jsch/Session;->Ec2s:[B

    goto :goto_1b6

    .line 1179
    .end local v7    # "bar":[B
    .end local v10    # "foo":[B
    :cond_203
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->c2scipher:Lcom/jcraft/jsch/Cipher;

    const/4 v1, 0x0

    iget-object v4, p0, Lcom/jcraft/jsch/Session;->Ec2s:[B

    iget-object v6, p0, Lcom/jcraft/jsch/Session;->IVc2s:[B

    invoke-interface {v0, v1, v4, v6}, Lcom/jcraft/jsch/Cipher;->init(I[B[B)V

    .line 1180
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->c2scipher:Lcom/jcraft/jsch/Cipher;

    invoke-interface {v0}, Lcom/jcraft/jsch/Cipher;->getIVSize()I

    move-result v0

    iput v0, p0, Lcom/jcraft/jsch/Session;->c2scipher_size:I

    .line 1182
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->guess:[Ljava/lang/String;

    const/4 v1, 0x4

    aget-object v12, v0, v1

    .line 1183
    invoke-virtual {p0, v12}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    .line 1184
    invoke-virtual {v8}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jcraft/jsch/MAC;

    check-cast v0, Lcom/jcraft/jsch/MAC;

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->c2smac:Lcom/jcraft/jsch/MAC;

    .line 1185
    iget-object v1, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v4, p0, Lcom/jcraft/jsch/Session;->MACc2s:[B

    iget-object v0, p0, Lcom/jcraft/jsch/Session;->c2smac:Lcom/jcraft/jsch/MAC;

    invoke-interface {v0}, Lcom/jcraft/jsch/MAC;->getBlockSize()I

    move-result v6

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/jcraft/jsch/Session;->expandKey(Lcom/jcraft/jsch/Buffer;[B[B[BLcom/jcraft/jsch/HASH;I)[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->MACc2s:[B

    .line 1186
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->c2smac:Lcom/jcraft/jsch/MAC;

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->MACc2s:[B

    invoke-interface {v0, v1}, Lcom/jcraft/jsch/MAC;->init([B)V

    .line 1188
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->guess:[Ljava/lang/String;

    const/4 v1, 0x6

    aget-object v12, v0, v1

    .line 1189
    invoke-direct {p0, v12}, Lcom/jcraft/jsch/Session;->initDeflater(Ljava/lang/String;)V

    .line 1191
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->guess:[Ljava/lang/String;

    const/4 v1, 0x7

    aget-object v12, v0, v1

    .line 1192
    invoke-direct {p0, v12}, Lcom/jcraft/jsch/Session;->initInflater(Ljava/lang/String;)V
    :try_end_254
    .catch Ljava/lang/Exception; {:try_start_14a .. :try_end_254} :catch_144

    .line 1200
    return-void

    .line 1197
    .end local v8    # "c":Ljava/lang/Class;
    .end local v12    # "method":Ljava/lang/String;
    .restart local v9    # "e":Ljava/lang/Exception;
    :cond_255
    new-instance v0, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v9}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, v9}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method


# virtual methods
.method addChannel(Lcom/jcraft/jsch/Channel;)V
    .registers 2
    .param p1, "channel"    # Lcom/jcraft/jsch/Channel;

    .prologue
    .line 2249
    invoke-virtual {p1, p0}, Lcom/jcraft/jsch/Channel;->setSession(Lcom/jcraft/jsch/Session;)V

    .line 2250
    return-void
.end method

.method public connect()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 183
    iget v0, p0, Lcom/jcraft/jsch/Session;->timeout:I

    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/Session;->connect(I)V

    .line 184
    return-void
.end method

.method public connect(I)V
    .registers 38
    .param p1, "connectTimeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 187
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jcraft/jsch/Session;->isConnected:Z

    move/from16 v31, v0

    if-eqz v31, :cond_10

    .line 188
    new-instance v31, Lcom/jcraft/jsch/JSchException;

    const-string v32, "session is already connected"

    invoke-direct/range {v31 .. v32}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v31

    .line 191
    :cond_10
    new-instance v31, Lcom/jcraft/jsch/IO;

    invoke-direct/range {v31 .. v31}, Lcom/jcraft/jsch/IO;-><init>()V

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    .line 192
    sget-object v31, Lcom/jcraft/jsch/Session;->random:Lcom/jcraft/jsch/Random;

    if-nez v31, :cond_37

    .line 194
    :try_start_1f
    const-string v31, "random"

    move-object/from16 v0, p0

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v31

    invoke-static/range {v31 .. v31}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    .line 195
    .local v8, "c":Ljava/lang/Class;
    invoke-virtual {v8}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v31

    check-cast v31, Lcom/jcraft/jsch/Random;

    check-cast v31, Lcom/jcraft/jsch/Random;

    sput-object v31, Lcom/jcraft/jsch/Session;->random:Lcom/jcraft/jsch/Random;
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_37} :catch_233

    .line 201
    .end local v8    # "c":Ljava/lang/Class;
    :cond_37
    sget-object v31, Lcom/jcraft/jsch/Session;->random:Lcom/jcraft/jsch/Random;

    invoke-static/range {v31 .. v31}, Lcom/jcraft/jsch/Packet;->setRandom(Lcom/jcraft/jsch/Random;)V

    .line 203
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v31

    const/16 v32, 0x1

    invoke-interface/range {v31 .. v32}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v31

    if-eqz v31, :cond_7a

    .line 204
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v31

    const/16 v32, 0x1

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "Connecting to "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v34, v0

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    const-string v34, " port "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/Session;->port:I

    move/from16 v34, v0

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-interface/range {v31 .. v33}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 211
    :cond_7a
    :try_start_7a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->proxy:Lcom/jcraft/jsch/Proxy;

    move-object/from16 v31, v0

    if-nez v31, :cond_280

    .line 214
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->socket_factory:Lcom/jcraft/jsch/SocketFactory;

    move-object/from16 v31, v0

    if-nez v31, :cond_242

    .line 215
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v31, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/Session;->port:I

    move/from16 v32, v0

    move-object/from16 v0, v31

    move/from16 v1, v32

    move/from16 v2, p1

    invoke-static {v0, v1, v2}, Lcom/jcraft/jsch/Util;->createSocket(Ljava/lang/String;II)Ljava/net/Socket;

    move-result-object v31

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    .line 216
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v15

    .line 217
    .local v15, "in":Ljava/io/InputStream;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v23

    .line 225
    .local v23, "out":Ljava/io/OutputStream;
    :goto_ba
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    move-object/from16 v31, v0

    const/16 v32, 0x1

    invoke-virtual/range {v31 .. v32}, Ljava/net/Socket;->setTcpNoDelay(Z)V

    .line 226
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    invoke-virtual {v0, v15}, Lcom/jcraft/jsch/IO;->setInputStream(Ljava/io/InputStream;)V

    .line 227
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/IO;->setOutputStream(Ljava/io/OutputStream;)V

    .line 238
    .end local v15    # "in":Ljava/io/InputStream;
    .end local v23    # "out":Ljava/io/OutputStream;
    :goto_dd
    if-lez p1, :cond_f4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    move-object/from16 v31, v0

    if-eqz v31, :cond_f4

    .line 239
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 242
    :cond_f4
    const/16 v31, 0x1

    move/from16 v0, v31

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/jcraft/jsch/Session;->isConnected:Z

    .line 244
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v31

    const/16 v32, 0x1

    invoke-interface/range {v31 .. v32}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v31

    if-eqz v31, :cond_113

    .line 245
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v31

    const/16 v32, 0x1

    const-string v33, "Connection established"

    invoke-interface/range {v31 .. v33}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 249
    :cond_113
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->jsch:Lcom/jcraft/jsch/JSch;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/JSch;->addSession(Lcom/jcraft/jsch/Session;)V

    .line 253
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->V_C:[B

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    array-length v0, v0

    move/from16 v31, v0

    add-int/lit8 v31, v31, 0x1

    move/from16 v0, v31

    new-array v13, v0, [B

    .line 254
    .local v13, "foo":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->V_C:[B

    move-object/from16 v31, v0

    const/16 v32, 0x0

    const/16 v33, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->V_C:[B

    move-object/from16 v34, v0

    move-object/from16 v0, v34

    array-length v0, v0

    move/from16 v34, v0

    move-object/from16 v0, v31

    move/from16 v1, v32

    move/from16 v2, v33

    move/from16 v3, v34

    invoke-static {v0, v1, v13, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 255
    array-length v0, v13

    move/from16 v31, v0

    add-int/lit8 v31, v31, -0x1

    const/16 v32, 0xa

    aput-byte v32, v13, v31

    .line 256
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    move-object/from16 v31, v0

    const/16 v32, 0x0

    array-length v0, v13

    move/from16 v33, v0

    move-object/from16 v0, v31

    move/from16 v1, v32

    move/from16 v2, v33

    invoke-virtual {v0, v13, v1, v2}, Lcom/jcraft/jsch/IO;->put([BII)V

    .line 260
    :cond_16e
    const/4 v14, 0x0

    .line 261
    .local v14, "i":I
    const/16 v16, 0x0

    .line 262
    .local v16, "j":I
    :cond_171
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    array-length v0, v0

    move/from16 v31, v0

    move/from16 v0, v31

    if-ge v14, v0, :cond_192

    .line 263
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lcom/jcraft/jsch/IO;->getByte()I

    move-result v16

    .line 264
    if-gez v16, :cond_2f0

    .line 268
    :cond_192
    :goto_192
    if-gez v16, :cond_30f

    .line 269
    new-instance v31, Lcom/jcraft/jsch/JSchException;

    const-string v32, "connection is closed by foreign host"

    invoke-direct/range {v31 .. v32}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v31
    :try_end_19c
    .catch Ljava/lang/Exception; {:try_start_7a .. :try_end_19c} :catch_19c
    .catchall {:try_start_7a .. :try_end_19c} :catchall_220

    .line 538
    .end local v13    # "foo":[B
    .end local v14    # "i":I
    .end local v16    # "j":I
    :catch_19c
    move-exception v11

    .line 539
    .local v11, "e":Ljava/lang/Exception;
    const/16 v31, 0x0

    :try_start_19f
    move/from16 v0, v31

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/jcraft/jsch/Session;->in_kex:Z
    :try_end_1a5
    .catchall {:try_start_19f .. :try_end_1a5} :catchall_220

    .line 541
    :try_start_1a5
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jcraft/jsch/Session;->isConnected:Z

    move/from16 v31, v0

    if-eqz v31, :cond_20c

    .line 542
    invoke-virtual {v11}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v19

    .line 543
    .local v19, "message":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->packet:Lcom/jcraft/jsch/Packet;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 544
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v31, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v32

    add-int/lit8 v32, v32, 0xd

    add-int/lit8 v32, v32, 0x2

    add-int/lit8 v32, v32, 0x54

    invoke-virtual/range {v31 .. v32}, Lcom/jcraft/jsch/Buffer;->checkFreeSize(I)V

    .line 545
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v31, v0

    const/16 v32, 0x1

    invoke-virtual/range {v31 .. v32}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 546
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v31, v0

    const/16 v32, 0x3

    invoke-virtual/range {v31 .. v32}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 547
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v31, v0

    invoke-static/range {v19 .. v19}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v32

    invoke-virtual/range {v31 .. v32}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 548
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v31, v0

    const-string v32, "en"

    invoke-static/range {v32 .. v32}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v32

    invoke-virtual/range {v31 .. v32}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 549
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->packet:Lcom/jcraft/jsch/Packet;

    move-object/from16 v31, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V
    :try_end_20c
    .catch Ljava/lang/Exception; {:try_start_1a5 .. :try_end_20c} :catch_9f1
    .catchall {:try_start_1a5 .. :try_end_20c} :catchall_220

    .line 553
    .end local v19    # "message":Ljava/lang/String;
    :cond_20c
    :goto_20c
    :try_start_20c
    invoke-virtual/range {p0 .. p0}, Lcom/jcraft/jsch/Session;->disconnect()V
    :try_end_20f
    .catch Ljava/lang/Exception; {:try_start_20c .. :try_end_20f} :catch_9ee
    .catchall {:try_start_20c .. :try_end_20f} :catchall_220

    .line 554
    :goto_20f
    const/16 v31, 0x0

    :try_start_211
    move/from16 v0, v31

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/jcraft/jsch/Session;->isConnected:Z

    .line 556
    instance-of v0, v11, Ljava/lang/RuntimeException;

    move/from16 v31, v0

    if-eqz v31, :cond_9ca

    check-cast v11, Ljava/lang/RuntimeException;

    .end local v11    # "e":Ljava/lang/Exception;
    throw v11
    :try_end_220
    .catchall {:try_start_211 .. :try_end_220} :catchall_220

    .line 561
    :catchall_220
    move-exception v31

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->password:[B

    move-object/from16 v32, v0

    invoke-static/range {v32 .. v32}, Lcom/jcraft/jsch/Util;->bzero([B)V

    .line 562
    const/16 v32, 0x0

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/Session;->password:[B

    throw v31

    .line 197
    :catch_233
    move-exception v11

    .line 198
    .restart local v11    # "e":Ljava/lang/Exception;
    new-instance v31, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v11}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    invoke-direct {v0, v1, v11}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v31

    .line 220
    .end local v11    # "e":Ljava/lang/Exception;
    :cond_242
    :try_start_242
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->socket_factory:Lcom/jcraft/jsch/SocketFactory;

    move-object/from16 v31, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v32, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/Session;->port:I

    move/from16 v33, v0

    invoke-interface/range {v31 .. v33}, Lcom/jcraft/jsch/SocketFactory;->createSocket(Ljava/lang/String;I)Ljava/net/Socket;

    move-result-object v31

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    .line 221
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->socket_factory:Lcom/jcraft/jsch/SocketFactory;

    move-object/from16 v31, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    move-object/from16 v32, v0

    invoke-interface/range {v31 .. v32}, Lcom/jcraft/jsch/SocketFactory;->getInputStream(Ljava/net/Socket;)Ljava/io/InputStream;

    move-result-object v15

    .line 222
    .restart local v15    # "in":Ljava/io/InputStream;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->socket_factory:Lcom/jcraft/jsch/SocketFactory;

    move-object/from16 v31, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    move-object/from16 v32, v0

    invoke-interface/range {v31 .. v32}, Lcom/jcraft/jsch/SocketFactory;->getOutputStream(Ljava/net/Socket;)Ljava/io/OutputStream;

    move-result-object v23

    .restart local v23    # "out":Ljava/io/OutputStream;
    goto/16 :goto_ba

    .line 230
    .end local v15    # "in":Ljava/io/InputStream;
    .end local v23    # "out":Ljava/io/OutputStream;
    :cond_280
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->proxy:Lcom/jcraft/jsch/Proxy;

    move-object/from16 v32, v0

    monitor-enter v32
    :try_end_287
    .catch Ljava/lang/Exception; {:try_start_242 .. :try_end_287} :catch_19c
    .catchall {:try_start_242 .. :try_end_287} :catchall_220

    .line 231
    :try_start_287
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->proxy:Lcom/jcraft/jsch/Proxy;

    move-object/from16 v31, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->socket_factory:Lcom/jcraft/jsch/SocketFactory;

    move-object/from16 v33, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v34, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/Session;->port:I

    move/from16 v35, v0

    move-object/from16 v0, v31

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    move/from16 v3, v35

    move/from16 v4, p1

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/jcraft/jsch/Proxy;->connect(Lcom/jcraft/jsch/SocketFactory;Ljava/lang/String;II)V

    .line 232
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    move-object/from16 v31, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->proxy:Lcom/jcraft/jsch/Proxy;

    move-object/from16 v33, v0

    invoke-interface/range {v33 .. v33}, Lcom/jcraft/jsch/Proxy;->getInputStream()Ljava/io/InputStream;

    move-result-object v33

    move-object/from16 v0, v31

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/IO;->setInputStream(Ljava/io/InputStream;)V

    .line 233
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    move-object/from16 v31, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->proxy:Lcom/jcraft/jsch/Proxy;

    move-object/from16 v33, v0

    invoke-interface/range {v33 .. v33}, Lcom/jcraft/jsch/Proxy;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v33

    move-object/from16 v0, v31

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/IO;->setOutputStream(Ljava/io/OutputStream;)V

    .line 234
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->proxy:Lcom/jcraft/jsch/Proxy;

    move-object/from16 v31, v0

    invoke-interface/range {v31 .. v31}, Lcom/jcraft/jsch/Proxy;->getSocket()Ljava/net/Socket;

    move-result-object v31

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    .line 235
    monitor-exit v32

    goto/16 :goto_dd

    :catchall_2ed
    move-exception v31

    monitor-exit v32
    :try_end_2ef
    .catchall {:try_start_287 .. :try_end_2ef} :catchall_2ed

    :try_start_2ef
    throw v31

    .line 265
    .restart local v13    # "foo":[B
    .restart local v14    # "i":I
    .restart local v16    # "j":I
    :cond_2f0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v31, v0

    move/from16 v0, v16

    int-to-byte v0, v0

    move/from16 v32, v0

    aput-byte v32, v31, v14

    add-int/lit8 v14, v14, 0x1

    .line 266
    const/16 v31, 0xa

    move/from16 v0, v16

    move/from16 v1, v31

    if-ne v0, v1, :cond_171

    goto/16 :goto_192

    .line 272
    :cond_30f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v31, v0

    add-int/lit8 v32, v14, -0x1

    aget-byte v31, v31, v32

    const/16 v32, 0xa

    move/from16 v0, v31

    move/from16 v1, v32

    if-ne v0, v1, :cond_345

    .line 273
    add-int/lit8 v14, v14, -0x1

    .line 274
    if-lez v14, :cond_345

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v31, v0

    add-int/lit8 v32, v14, -0x1

    aget-byte v31, v31, v32

    const/16 v32, 0xd

    move/from16 v0, v31

    move/from16 v1, v32

    if-ne v0, v1, :cond_345

    .line 275
    add-int/lit8 v14, v14, -0x1

    .line 279
    :cond_345
    const/16 v31, 0x3

    move/from16 v0, v31

    if-le v14, v0, :cond_16e

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    array-length v0, v0

    move/from16 v31, v0

    move/from16 v0, v31

    if-eq v14, v0, :cond_3c0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v31, v0

    const/16 v32, 0x0

    aget-byte v31, v31, v32

    const/16 v32, 0x53

    move/from16 v0, v31

    move/from16 v1, v32

    if-ne v0, v1, :cond_16e

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v31, v0

    const/16 v32, 0x1

    aget-byte v31, v31, v32

    const/16 v32, 0x53

    move/from16 v0, v31

    move/from16 v1, v32

    if-ne v0, v1, :cond_16e

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v31, v0

    const/16 v32, 0x2

    aget-byte v31, v31, v32

    const/16 v32, 0x48

    move/from16 v0, v31

    move/from16 v1, v32

    if-ne v0, v1, :cond_16e

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v31, v0

    const/16 v32, 0x3

    aget-byte v31, v31, v32

    const/16 v32, 0x2d

    move/from16 v0, v31

    move/from16 v1, v32

    if-ne v0, v1, :cond_16e

    .line 288
    :cond_3c0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    array-length v0, v0

    move/from16 v31, v0

    move/from16 v0, v31

    if-eq v14, v0, :cond_40b

    const/16 v31, 0x7

    move/from16 v0, v31

    if-lt v14, v0, :cond_40b

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v31, v0

    const/16 v32, 0x4

    aget-byte v31, v31, v32

    const/16 v32, 0x31

    move/from16 v0, v31

    move/from16 v1, v32

    if-ne v0, v1, :cond_413

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v31, v0

    const/16 v32, 0x6

    aget-byte v31, v31, v32

    const/16 v32, 0x39

    move/from16 v0, v31

    move/from16 v1, v32

    if-eq v0, v1, :cond_413

    .line 292
    :cond_40b
    new-instance v31, Lcom/jcraft/jsch/JSchException;

    const-string v32, "invalid server\'s version string"

    invoke-direct/range {v31 .. v32}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v31

    .line 297
    :cond_413
    new-array v0, v14, [B

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/Session;->V_S:[B

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v31, v0

    const/16 v32, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->V_S:[B

    move-object/from16 v33, v0

    const/16 v34, 0x0

    move-object/from16 v0, v31

    move/from16 v1, v32

    move-object/from16 v2, v33

    move/from16 v3, v34

    invoke-static {v0, v1, v2, v3, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 300
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v31

    const/16 v32, 0x1

    invoke-interface/range {v31 .. v32}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v31

    if-eqz v31, :cond_496

    .line 301
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v31

    const/16 v32, 0x1

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "Remote version string: "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->V_S:[B

    move-object/from16 v34, v0

    invoke-static/range {v34 .. v34}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-interface/range {v31 .. v33}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 303
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v31

    const/16 v32, 0x1

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "Local version string: "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->V_C:[B

    move-object/from16 v34, v0

    invoke-static/range {v34 .. v34}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-interface/range {v31 .. v33}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 307
    :cond_496
    invoke-direct/range {p0 .. p0}, Lcom/jcraft/jsch/Session;->send_kexinit()V

    .line 309
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v31, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->read(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/Buffer;

    move-result-object v31

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    .line 310
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lcom/jcraft/jsch/Buffer;->getCommand()B

    move-result v31

    const/16 v32, 0x14

    move/from16 v0, v31

    move/from16 v1, v32

    if-eq v0, v1, :cond_4ea

    .line 311
    const/16 v31, 0x0

    move/from16 v0, v31

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/jcraft/jsch/Session;->in_kex:Z

    .line 312
    new-instance v31, Lcom/jcraft/jsch/JSchException;

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "invalid protocol: "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/jcraft/jsch/Buffer;->getCommand()B

    move-result v33

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-direct/range {v31 .. v32}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v31

    .line 315
    :cond_4ea
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v31

    const/16 v32, 0x1

    invoke-interface/range {v31 .. v32}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v31

    if-eqz v31, :cond_501

    .line 316
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v31

    const/16 v32, 0x1

    const-string v33, "SSH_MSG_KEXINIT received"

    invoke-interface/range {v31 .. v33}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 320
    :cond_501
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v31, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v31

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/Session;->receive_kexinit(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/KeyExchange;

    move-result-object v18

    .line 323
    .local v18, "kex":Lcom/jcraft/jsch/KeyExchange;
    :cond_50f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v31, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->read(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/Buffer;

    move-result-object v31

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    .line 324
    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/KeyExchange;->getState()I

    move-result v31

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v32, v0

    invoke-virtual/range {v32 .. v32}, Lcom/jcraft/jsch/Buffer;->getCommand()B

    move-result v32

    move/from16 v0, v31

    move/from16 v1, v32

    if-ne v0, v1, :cond_576

    .line 325
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v31

    move-wide/from16 v0, v31

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/jcraft/jsch/Session;->kex_start_time:J

    .line 326
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v31, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/KeyExchange;->next(Lcom/jcraft/jsch/Buffer;)Z

    move-result v24

    .line 327
    .local v24, "result":Z
    if-nez v24, :cond_5a1

    .line 329
    const/16 v31, 0x0

    move/from16 v0, v31

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/jcraft/jsch/Session;->in_kex:Z

    .line 330
    new-instance v31, Lcom/jcraft/jsch/JSchException;

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "verify: "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, v32

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-direct/range {v31 .. v32}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v31

    .line 334
    .end local v24    # "result":Z
    :cond_576
    const/16 v31, 0x0

    move/from16 v0, v31

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/jcraft/jsch/Session;->in_kex:Z

    .line 335
    new-instance v31, Lcom/jcraft/jsch/JSchException;

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "invalid protocol(kex): "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/jcraft/jsch/Buffer;->getCommand()B

    move-result v33

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-direct/range {v31 .. v32}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v31

    .line 337
    .restart local v24    # "result":Z
    :cond_5a1
    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/KeyExchange;->getState()I
    :try_end_5a4
    .catch Ljava/lang/Exception; {:try_start_2ef .. :try_end_5a4} :catch_19c
    .catchall {:try_start_2ef .. :try_end_5a4} :catchall_220

    move-result v31

    if-nez v31, :cond_50f

    .line 342
    :try_start_5a7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v31, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/Session;->port:I

    move/from16 v32, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v31

    move/from16 v2, v32

    move-object/from16 v3, v18

    invoke-direct {v0, v1, v2, v3}, Lcom/jcraft/jsch/Session;->checkHost(Ljava/lang/String;ILcom/jcraft/jsch/KeyExchange;)V
    :try_end_5be
    .catch Lcom/jcraft/jsch/JSchException; {:try_start_5a7 .. :try_end_5be} :catch_6ae
    .catch Ljava/lang/Exception; {:try_start_5a7 .. :try_end_5be} :catch_19c
    .catchall {:try_start_5a7 .. :try_end_5be} :catchall_220

    .line 348
    :try_start_5be
    invoke-direct/range {p0 .. p0}, Lcom/jcraft/jsch/Session;->send_newkeys()V

    .line 351
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v31, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->read(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/Buffer;

    move-result-object v31

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    .line 353
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lcom/jcraft/jsch/Buffer;->getCommand()B

    move-result v31

    const/16 v32, 0x15

    move/from16 v0, v31

    move/from16 v1, v32

    if-ne v0, v1, :cond_6b8

    .line 355
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v31

    const/16 v32, 0x1

    invoke-interface/range {v31 .. v32}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v31

    if-eqz v31, :cond_5fe

    .line 356
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v31

    const/16 v32, 0x1

    const-string v33, "SSH_MSG_NEWKEYS received"

    invoke-interface/range {v31 .. v33}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 360
    :cond_5fe
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v31, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v31

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lcom/jcraft/jsch/Session;->receive_newkeys(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/KeyExchange;)V
    :try_end_60d
    .catch Ljava/lang/Exception; {:try_start_5be .. :try_end_60d} :catch_19c
    .catchall {:try_start_5be .. :try_end_60d} :catchall_220

    .line 368
    :try_start_60d
    const-string v31, "MaxAuthTries"

    move-object/from16 v0, p0

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    .line 369
    .local v25, "s":Ljava/lang/String;
    if-eqz v25, :cond_623

    .line 370
    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v31

    move/from16 v0, v31

    move-object/from16 v1, p0

    iput v0, v1, Lcom/jcraft/jsch/Session;->max_auth_tries:I
    :try_end_623
    .catch Ljava/lang/NumberFormatException; {:try_start_60d .. :try_end_623} :catch_6e3
    .catch Ljava/lang/Exception; {:try_start_60d .. :try_end_623} :catch_19c
    .catchall {:try_start_60d .. :try_end_623} :catchall_220

    .line 377
    :cond_623
    const/4 v6, 0x0

    .line 378
    .local v6, "auth":Z
    const/4 v7, 0x0

    .line 380
    .local v7, "auth_cancel":Z
    const/16 v30, 0x0

    .line 382
    .local v30, "ua":Lcom/jcraft/jsch/UserAuth;
    :try_start_627
    const-string v31, "userauth.none"

    move-object/from16 v0, p0

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v31

    invoke-static/range {v31 .. v31}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    .line 383
    .restart local v8    # "c":Ljava/lang/Class;
    invoke-virtual {v8}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v31

    check-cast v31, Lcom/jcraft/jsch/UserAuth;

    move-object/from16 v0, v31

    check-cast v0, Lcom/jcraft/jsch/UserAuth;

    move-object/from16 v30, v0
    :try_end_641
    .catch Ljava/lang/Exception; {:try_start_627 .. :try_end_641} :catch_70b
    .catchall {:try_start_627 .. :try_end_641} :catchall_220

    .line 389
    :try_start_641
    move-object/from16 v0, v30

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/UserAuth;->start(Lcom/jcraft/jsch/Session;)Z

    move-result v6

    .line 391
    const-string v31, "PreferredAuthentications"

    move-object/from16 v0, p0

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 393
    .local v10, "cmethods":Ljava/lang/String;
    const-string v31, ","

    move-object/from16 v0, v31

    invoke-static {v10, v0}, Lcom/jcraft/jsch/Util;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v9

    .line 395
    .local v9, "cmethoda":[Ljava/lang/String;
    const/16 v27, 0x0

    .line 396
    .local v27, "smethods":Ljava/lang/String;
    if-nez v6, :cond_66f

    .line 397
    move-object/from16 v0, v30

    check-cast v0, Lcom/jcraft/jsch/UserAuthNone;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lcom/jcraft/jsch/UserAuthNone;->getMethods()Ljava/lang/String;

    move-result-object v27

    .line 398
    if-eqz v27, :cond_71a

    .line 399
    invoke-virtual/range {v27 .. v27}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v27

    .line 408
    :cond_66f
    :goto_66f
    const-string v31, ","

    move-object/from16 v0, v27

    move-object/from16 v1, v31

    invoke-static {v0, v1}, Lcom/jcraft/jsch/Util;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v26

    .line 410
    .local v26, "smethoda":[Ljava/lang/String;
    const/16 v21, 0x0

    .local v21, "methodi":I
    move/from16 v22, v21

    .line 416
    .end local v21    # "methodi":I
    .local v22, "methodi":I
    :goto_67d
    if-nez v6, :cond_9f4

    if-eqz v9, :cond_9f4

    array-length v0, v9

    move/from16 v31, v0

    move/from16 v0, v22

    move/from16 v1, v31

    if-ge v0, v1, :cond_9f4

    .line 418
    add-int/lit8 v21, v22, 0x1

    .end local v22    # "methodi":I
    .restart local v21    # "methodi":I
    aget-object v20, v9, v22

    .line 419
    .local v20, "method":Ljava/lang/String;
    const/4 v5, 0x0

    .line 420
    .local v5, "acceptable":Z
    const/16 v17, 0x0

    .local v17, "k":I
    :goto_691
    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v31, v0

    move/from16 v0, v17

    move/from16 v1, v31

    if-ge v0, v1, :cond_6a9

    .line 421
    aget-object v31, v26, v17

    move-object/from16 v0, v31

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v31

    if-eqz v31, :cond_71e

    .line 422
    const/4 v5, 0x1

    .line 426
    :cond_6a9
    if-nez v5, :cond_722

    move/from16 v22, v21

    .line 427
    .end local v21    # "methodi":I
    .restart local v22    # "methodi":I
    goto :goto_67d

    .line 343
    .end local v5    # "acceptable":Z
    .end local v6    # "auth":Z
    .end local v7    # "auth_cancel":Z
    .end local v8    # "c":Ljava/lang/Class;
    .end local v9    # "cmethoda":[Ljava/lang/String;
    .end local v10    # "cmethods":Ljava/lang/String;
    .end local v17    # "k":I
    .end local v20    # "method":Ljava/lang/String;
    .end local v22    # "methodi":I
    .end local v25    # "s":Ljava/lang/String;
    .end local v26    # "smethoda":[Ljava/lang/String;
    .end local v27    # "smethods":Ljava/lang/String;
    .end local v30    # "ua":Lcom/jcraft/jsch/UserAuth;
    :catch_6ae
    move-exception v12

    .line 344
    .local v12, "ee":Lcom/jcraft/jsch/JSchException;
    const/16 v31, 0x0

    move/from16 v0, v31

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/jcraft/jsch/Session;->in_kex:Z

    .line 345
    throw v12

    .line 363
    .end local v12    # "ee":Lcom/jcraft/jsch/JSchException;
    :cond_6b8
    const/16 v31, 0x0

    move/from16 v0, v31

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/jcraft/jsch/Session;->in_kex:Z

    .line 364
    new-instance v31, Lcom/jcraft/jsch/JSchException;

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "invalid protocol(newkyes): "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lcom/jcraft/jsch/Buffer;->getCommand()B

    move-result v33

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-direct/range {v31 .. v32}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v31

    .line 373
    :catch_6e3
    move-exception v11

    .line 374
    .local v11, "e":Ljava/lang/NumberFormatException;
    new-instance v31, Lcom/jcraft/jsch/JSchException;

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "MaxAuthTries: "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    const-string v33, "MaxAuthTries"

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    invoke-direct {v0, v1, v11}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v31

    .line 385
    .end local v11    # "e":Ljava/lang/NumberFormatException;
    .restart local v6    # "auth":Z
    .restart local v7    # "auth_cancel":Z
    .restart local v25    # "s":Ljava/lang/String;
    .restart local v30    # "ua":Lcom/jcraft/jsch/UserAuth;
    :catch_70b
    move-exception v11

    .line 386
    .local v11, "e":Ljava/lang/Exception;
    new-instance v31, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v11}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    invoke-direct {v0, v1, v11}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v31

    .line 404
    .end local v11    # "e":Ljava/lang/Exception;
    .restart local v8    # "c":Ljava/lang/Class;
    .restart local v9    # "cmethoda":[Ljava/lang/String;
    .restart local v10    # "cmethods":Ljava/lang/String;
    .restart local v27    # "smethods":Ljava/lang/String;
    :cond_71a
    move-object/from16 v27, v10

    goto/16 :goto_66f

    .line 420
    .restart local v5    # "acceptable":Z
    .restart local v17    # "k":I
    .restart local v20    # "method":Ljava/lang/String;
    .restart local v21    # "methodi":I
    .restart local v26    # "smethoda":[Ljava/lang/String;
    :cond_71e
    add-int/lit8 v17, v17, 0x1

    goto/16 :goto_691

    .line 432
    :cond_722
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v31

    const/16 v32, 0x1

    invoke-interface/range {v31 .. v32}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v31

    if-eqz v31, :cond_7a6

    .line 433
    const-string v28, "Authentications that can continue: "

    .line 434
    .local v28, "str":Ljava/lang/String;
    add-int/lit8 v17, v21, -0x1

    :goto_732
    array-length v0, v9

    move/from16 v31, v0

    move/from16 v0, v17

    move/from16 v1, v31

    if-ge v0, v1, :cond_777

    .line 435
    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v31

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    aget-object v32, v9, v17

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    .line 436
    add-int/lit8 v31, v17, 0x1

    array-length v0, v9

    move/from16 v32, v0

    move/from16 v0, v31

    move/from16 v1, v32

    if-ge v0, v1, :cond_774

    .line 437
    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v31

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    const-string v32, ","

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    .line 434
    :cond_774
    add-int/lit8 v17, v17, 0x1

    goto :goto_732

    .line 439
    :cond_777
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v31

    const/16 v32, 0x1

    move-object/from16 v0, v31

    move/from16 v1, v32

    move-object/from16 v2, v28

    invoke-interface {v0, v1, v2}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 441
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v31

    const/16 v32, 0x1

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "Next authentication method: "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-interface/range {v31 .. v33}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V
    :try_end_7a6
    .catch Ljava/lang/Exception; {:try_start_641 .. :try_end_7a6} :catch_19c
    .catchall {:try_start_641 .. :try_end_7a6} :catchall_220

    .line 445
    .end local v28    # "str":Ljava/lang/String;
    :cond_7a6
    const/16 v30, 0x0

    .line 447
    const/4 v8, 0x0

    .line 448
    :try_start_7a9
    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    const-string v32, "userauth."

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    move-object/from16 v0, v31

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p0

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v31

    if-eqz v31, :cond_7f9

    .line 449
    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    const-string v32, "userauth."

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    move-object/from16 v0, v31

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p0

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v31

    invoke-static/range {v31 .. v31}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    .line 450
    invoke-virtual {v8}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v31

    check-cast v31, Lcom/jcraft/jsch/UserAuth;

    move-object/from16 v0, v31

    check-cast v0, Lcom/jcraft/jsch/UserAuth;

    move-object/from16 v30, v0
    :try_end_7f9
    .catch Ljava/lang/Exception; {:try_start_7a9 .. :try_end_7f9} :catch_83c
    .catchall {:try_start_7a9 .. :try_end_7f9} :catchall_220

    .line 460
    :cond_7f9
    :goto_7f9
    if-eqz v30, :cond_838

    .line 461
    const/4 v7, 0x0

    .line 463
    :try_start_7fc
    move-object/from16 v0, v30

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/UserAuth;->start(Lcom/jcraft/jsch/Session;)Z

    move-result v6

    .line 464
    if-eqz v6, :cond_838

    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v31

    const/16 v32, 0x1

    invoke-interface/range {v31 .. v32}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v31

    if-eqz v31, :cond_838

    .line 466
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v31

    const/16 v32, 0x1

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "Authentication succeeded ("

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    const-string v34, ")."

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-interface/range {v31 .. v33}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V
    :try_end_838
    .catch Lcom/jcraft/jsch/JSchAuthCancelException; {:try_start_7fc .. :try_end_838} :catch_870
    .catch Lcom/jcraft/jsch/JSchPartialAuthException; {:try_start_7fc .. :try_end_838} :catch_873
    .catch Ljava/lang/RuntimeException; {:try_start_7fc .. :try_end_838} :catch_895
    .catch Lcom/jcraft/jsch/JSchException; {:try_start_7fc .. :try_end_838} :catch_897
    .catch Ljava/lang/Exception; {:try_start_7fc .. :try_end_838} :catch_899
    .catchall {:try_start_7fc .. :try_end_838} :catchall_220

    :cond_838
    :goto_838
    move/from16 v22, v21

    .line 499
    .end local v21    # "methodi":I
    .restart local v22    # "methodi":I
    goto/16 :goto_67d

    .line 453
    .end local v22    # "methodi":I
    .restart local v21    # "methodi":I
    :catch_83c
    move-exception v11

    .line 454
    .restart local v11    # "e":Ljava/lang/Exception;
    :try_start_83d
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v31

    const/16 v32, 0x2

    invoke-interface/range {v31 .. v32}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v31

    if-eqz v31, :cond_7f9

    .line 455
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v31

    const/16 v32, 0x2

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "failed to load "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    const-string v34, " method"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-interface/range {v31 .. v33}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    goto :goto_7f9

    .line 470
    .end local v11    # "e":Ljava/lang/Exception;
    :catch_870
    move-exception v12

    .line 471
    .local v12, "ee":Lcom/jcraft/jsch/JSchAuthCancelException;
    const/4 v7, 0x1

    .line 497
    goto :goto_838

    .line 473
    .end local v12    # "ee":Lcom/jcraft/jsch/JSchAuthCancelException;
    :catch_873
    move-exception v12

    .line 474
    .local v12, "ee":Lcom/jcraft/jsch/JSchPartialAuthException;
    move-object/from16 v29, v27

    .line 475
    .local v29, "tmp":Ljava/lang/String;
    invoke-virtual {v12}, Lcom/jcraft/jsch/JSchPartialAuthException;->getMethods()Ljava/lang/String;

    move-result-object v27

    .line 476
    const-string v31, ","

    move-object/from16 v0, v27

    move-object/from16 v1, v31

    invoke-static {v0, v1}, Lcom/jcraft/jsch/Util;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v26

    .line 477
    move-object/from16 v0, v29

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v31

    if-nez v31, :cond_890

    .line 478
    const/16 v21, 0x0

    .line 481
    :cond_890
    const/4 v7, 0x0

    move/from16 v22, v21

    .line 482
    .end local v21    # "methodi":I
    .restart local v22    # "methodi":I
    goto/16 :goto_67d

    .line 484
    .end local v12    # "ee":Lcom/jcraft/jsch/JSchPartialAuthException;
    .end local v22    # "methodi":I
    .end local v29    # "tmp":Ljava/lang/String;
    .restart local v21    # "methodi":I
    :catch_895
    move-exception v12

    .line 485
    .local v12, "ee":Ljava/lang/RuntimeException;
    throw v12

    .line 487
    .end local v12    # "ee":Ljava/lang/RuntimeException;
    :catch_897
    move-exception v12

    .line 488
    .local v12, "ee":Lcom/jcraft/jsch/JSchException;
    throw v12

    .line 490
    .end local v12    # "ee":Lcom/jcraft/jsch/JSchException;
    :catch_899
    move-exception v12

    .line 492
    .local v12, "ee":Ljava/lang/Exception;
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v31

    const/16 v32, 0x2

    invoke-interface/range {v31 .. v32}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v31

    if-eqz v31, :cond_8c6

    .line 493
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v31

    const/16 v32, 0x2

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "an exception during authentication\n"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual {v12}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-interface/range {v31 .. v33}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 503
    .end local v5    # "acceptable":Z
    .end local v12    # "ee":Ljava/lang/Exception;
    .end local v17    # "k":I
    .end local v20    # "method":Ljava/lang/String;
    :cond_8c6
    :goto_8c6
    if-nez v6, :cond_91a

    .line 504
    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/Session;->auth_failures:I

    move/from16 v31, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/Session;->max_auth_tries:I

    move/from16 v32, v0

    move/from16 v0, v31

    move/from16 v1, v32

    if-lt v0, v1, :cond_908

    .line 505
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v31

    const/16 v32, 0x1

    invoke-interface/range {v31 .. v32}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v31

    if-eqz v31, :cond_908

    .line 506
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v31

    const/16 v32, 0x1

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "Login trials exceeds "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/Session;->max_auth_tries:I

    move/from16 v34, v0

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-interface/range {v31 .. v33}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 510
    :cond_908
    if-eqz v7, :cond_912

    .line 511
    new-instance v31, Lcom/jcraft/jsch/JSchException;

    const-string v32, "Auth cancel"

    invoke-direct/range {v31 .. v32}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v31

    .line 512
    :cond_912
    new-instance v31, Lcom/jcraft/jsch/JSchException;

    const-string v32, "Auth fail"

    invoke-direct/range {v31 .. v32}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v31

    .line 515
    :cond_91a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    move-object/from16 v31, v0

    if-eqz v31, :cond_93b

    if-gtz p1, :cond_92c

    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/Session;->timeout:I

    move/from16 v31, v0

    if-lez v31, :cond_93b

    .line 516
    :cond_92c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    move-object/from16 v31, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/Session;->timeout:I

    move/from16 v32, v0

    invoke-virtual/range {v31 .. v32}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 519
    :cond_93b
    const/16 v31, 0x1

    move/from16 v0, v31

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/jcraft/jsch/Session;->isAuthed:Z

    .line 521
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->lock:Ljava/lang/Object;

    move-object/from16 v32, v0

    monitor-enter v32
    :try_end_94a
    .catch Ljava/lang/Exception; {:try_start_83d .. :try_end_94a} :catch_19c
    .catchall {:try_start_83d .. :try_end_94a} :catchall_220

    .line 522
    :try_start_94a
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jcraft/jsch/Session;->isConnected:Z

    move/from16 v31, v0

    if-eqz v31, :cond_9b4

    .line 523
    new-instance v31, Ljava/lang/Thread;

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/Session;->connectThread:Ljava/lang/Thread;

    .line 524
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->connectThread:Ljava/lang/Thread;

    move-object/from16 v31, v0

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "Connect thread "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v34, v0

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    const-string v34, " session"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v31

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 525
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jcraft/jsch/Session;->daemon_thread:Z

    move/from16 v31, v0

    if-eqz v31, :cond_9a8

    .line 526
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->connectThread:Ljava/lang/Thread;

    move-object/from16 v31, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jcraft/jsch/Session;->daemon_thread:Z

    move/from16 v33, v0

    move-object/from16 v0, v31

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 528
    :cond_9a8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->connectThread:Ljava/lang/Thread;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Ljava/lang/Thread;->start()V

    .line 530
    invoke-direct/range {p0 .. p0}, Lcom/jcraft/jsch/Session;->requestPortForwarding()V

    .line 536
    :cond_9b4
    monitor-exit v32
    :try_end_9b5
    .catchall {:try_start_94a .. :try_end_9b5} :catchall_9c7

    .line 561
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->password:[B

    move-object/from16 v31, v0

    invoke-static/range {v31 .. v31}, Lcom/jcraft/jsch/Util;->bzero([B)V

    .line 562
    const/16 v31, 0x0

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/Session;->password:[B

    .line 564
    return-void

    .line 536
    :catchall_9c7
    move-exception v31

    :try_start_9c8
    monitor-exit v32
    :try_end_9c9
    .catchall {:try_start_9c8 .. :try_end_9c9} :catchall_9c7

    :try_start_9c9
    throw v31
    :try_end_9ca
    .catch Ljava/lang/Exception; {:try_start_9c9 .. :try_end_9ca} :catch_19c
    .catchall {:try_start_9c9 .. :try_end_9ca} :catchall_220

    .line 557
    .end local v6    # "auth":Z
    .end local v7    # "auth_cancel":Z
    .end local v8    # "c":Ljava/lang/Class;
    .end local v9    # "cmethoda":[Ljava/lang/String;
    .end local v10    # "cmethods":Ljava/lang/String;
    .end local v13    # "foo":[B
    .end local v14    # "i":I
    .end local v16    # "j":I
    .end local v18    # "kex":Lcom/jcraft/jsch/KeyExchange;
    .end local v21    # "methodi":I
    .end local v24    # "result":Z
    .end local v25    # "s":Ljava/lang/String;
    .end local v26    # "smethoda":[Ljava/lang/String;
    .end local v27    # "smethods":Ljava/lang/String;
    .end local v30    # "ua":Lcom/jcraft/jsch/UserAuth;
    .restart local v11    # "e":Ljava/lang/Exception;
    :cond_9ca
    :try_start_9ca
    instance-of v0, v11, Lcom/jcraft/jsch/JSchException;

    move/from16 v31, v0

    if-eqz v31, :cond_9d3

    check-cast v11, Lcom/jcraft/jsch/JSchException;

    .end local v11    # "e":Ljava/lang/Exception;
    throw v11

    .line 558
    .restart local v11    # "e":Ljava/lang/Exception;
    :cond_9d3
    new-instance v31, Lcom/jcraft/jsch/JSchException;

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "Session.connect: "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, v32

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-direct/range {v31 .. v32}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v31
    :try_end_9ee
    .catchall {:try_start_9ca .. :try_end_9ee} :catchall_220

    .line 553
    :catch_9ee
    move-exception v31

    goto/16 :goto_20f

    .line 552
    :catch_9f1
    move-exception v31

    goto/16 :goto_20c

    .end local v11    # "e":Ljava/lang/Exception;
    .restart local v6    # "auth":Z
    .restart local v7    # "auth_cancel":Z
    .restart local v8    # "c":Ljava/lang/Class;
    .restart local v9    # "cmethoda":[Ljava/lang/String;
    .restart local v10    # "cmethods":Ljava/lang/String;
    .restart local v13    # "foo":[B
    .restart local v14    # "i":I
    .restart local v16    # "j":I
    .restart local v18    # "kex":Lcom/jcraft/jsch/KeyExchange;
    .restart local v22    # "methodi":I
    .restart local v24    # "result":Z
    .restart local v25    # "s":Ljava/lang/String;
    .restart local v26    # "smethoda":[Ljava/lang/String;
    .restart local v27    # "smethods":Ljava/lang/String;
    .restart local v30    # "ua":Lcom/jcraft/jsch/UserAuth;
    :cond_9f4
    move/from16 v21, v22

    .end local v22    # "methodi":I
    .restart local v21    # "methodi":I
    goto/16 :goto_8c6
.end method

.method public delPortForwardingL(I)V
    .registers 3
    .param p1, "lport"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 1841
    const-string v0, "127.0.0.1"

    invoke-virtual {p0, v0, p1}, Lcom/jcraft/jsch/Session;->delPortForwardingL(Ljava/lang/String;I)V

    .line 1842
    return-void
.end method

.method public delPortForwardingL(Ljava/lang/String;I)V
    .registers 3
    .param p1, "bind_address"    # Ljava/lang/String;
    .param p2, "lport"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 1852
    invoke-static {p0, p1, p2}, Lcom/jcraft/jsch/PortWatcher;->delPort(Lcom/jcraft/jsch/Session;Ljava/lang/String;I)V

    .line 1853
    return-void
.end method

.method public delPortForwardingR(I)V
    .registers 3
    .param p1, "rport"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 2184
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/jcraft/jsch/Session;->delPortForwardingR(Ljava/lang/String;I)V

    .line 2185
    return-void
.end method

.method public delPortForwardingR(Ljava/lang/String;I)V
    .registers 3
    .param p1, "bind_address"    # Ljava/lang/String;
    .param p2, "rport"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 2196
    invoke-static {p0, p1, p2}, Lcom/jcraft/jsch/ChannelForwardedTCPIP;->delPort(Lcom/jcraft/jsch/Session;Ljava/lang/String;I)V

    .line 2197
    return-void
.end method

.method public disconnect()V
    .registers 6

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 1693
    iget-boolean v0, p0, Lcom/jcraft/jsch/Session;->isConnected:Z

    if-nez v0, :cond_7

    .line 1756
    :goto_6
    return-void

    .line 1696
    :cond_7
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v0

    invoke-interface {v0, v4}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_39

    .line 1697
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Disconnecting from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " port "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/jcraft/jsch/Session;->port:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v4, v1}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 1711
    :cond_39
    invoke-static {p0}, Lcom/jcraft/jsch/Channel;->disconnect(Lcom/jcraft/jsch/Session;)V

    .line 1713
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/jcraft/jsch/Session;->isConnected:Z

    .line 1715
    invoke-static {p0}, Lcom/jcraft/jsch/PortWatcher;->delPort(Lcom/jcraft/jsch/Session;)V

    .line 1716
    invoke-static {p0}, Lcom/jcraft/jsch/ChannelForwardedTCPIP;->delPort(Lcom/jcraft/jsch/Session;)V

    .line 1717
    invoke-static {p0}, Lcom/jcraft/jsch/ChannelX11;->removeFakedCookie(Lcom/jcraft/jsch/Session;)V

    .line 1719
    iget-object v1, p0, Lcom/jcraft/jsch/Session;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 1720
    :try_start_4b
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->connectThread:Ljava/lang/Thread;

    if-eqz v0, :cond_5a

    .line 1721
    invoke-static {}, Ljava/lang/Thread;->yield()V

    .line 1722
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->connectThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 1723
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->connectThread:Ljava/lang/Thread;

    .line 1725
    :cond_5a
    monitor-exit v1
    :try_end_5b
    .catchall {:try_start_4b .. :try_end_5b} :catchall_a0

    .line 1726
    iput-object v3, p0, Lcom/jcraft/jsch/Session;->thread:Ljava/lang/Runnable;

    .line 1728
    :try_start_5d
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    if-eqz v0, :cond_88

    .line 1729
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    iget-object v0, v0, Lcom/jcraft/jsch/IO;->in:Ljava/io/InputStream;

    if-eqz v0, :cond_6e

    iget-object v0, p0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    iget-object v0, v0, Lcom/jcraft/jsch/IO;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 1730
    :cond_6e
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    iget-object v0, v0, Lcom/jcraft/jsch/IO;->out:Ljava/io/OutputStream;

    if-eqz v0, :cond_7b

    iget-object v0, p0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    iget-object v0, v0, Lcom/jcraft/jsch/IO;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 1731
    :cond_7b
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    iget-object v0, v0, Lcom/jcraft/jsch/IO;->out_ext:Ljava/io/OutputStream;

    if-eqz v0, :cond_88

    iget-object v0, p0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    iget-object v0, v0, Lcom/jcraft/jsch/IO;->out_ext:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 1733
    :cond_88
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->proxy:Lcom/jcraft/jsch/Proxy;

    if-nez v0, :cond_a3

    .line 1734
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    if-eqz v0, :cond_95

    .line 1735
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_95
    .catch Ljava/lang/Exception; {:try_start_5d .. :try_end_95} :catch_b0

    .line 1747
    :cond_95
    :goto_95
    iput-object v3, p0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    .line 1748
    iput-object v3, p0, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    .line 1753
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->jsch:Lcom/jcraft/jsch/JSch;

    invoke-virtual {v0, p0}, Lcom/jcraft/jsch/JSch;->removeSession(Lcom/jcraft/jsch/Session;)Z

    goto/16 :goto_6

    .line 1725
    :catchall_a0
    move-exception v0

    :try_start_a1
    monitor-exit v1
    :try_end_a2
    .catchall {:try_start_a1 .. :try_end_a2} :catchall_a0

    throw v0

    .line 1738
    :cond_a3
    :try_start_a3
    iget-object v1, p0, Lcom/jcraft/jsch/Session;->proxy:Lcom/jcraft/jsch/Proxy;

    monitor-enter v1
    :try_end_a6
    .catch Ljava/lang/Exception; {:try_start_a3 .. :try_end_a6} :catch_b0

    .line 1739
    :try_start_a6
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->proxy:Lcom/jcraft/jsch/Proxy;

    invoke-interface {v0}, Lcom/jcraft/jsch/Proxy;->close()V

    .line 1740
    monitor-exit v1
    :try_end_ac
    .catchall {:try_start_a6 .. :try_end_ac} :catchall_b2

    .line 1741
    const/4 v0, 0x0

    :try_start_ad
    iput-object v0, p0, Lcom/jcraft/jsch/Session;->proxy:Lcom/jcraft/jsch/Proxy;
    :try_end_af
    .catch Ljava/lang/Exception; {:try_start_ad .. :try_end_af} :catch_b0

    goto :goto_95

    .line 1744
    :catch_b0
    move-exception v0

    goto :goto_95

    .line 1740
    :catchall_b2
    move-exception v0

    :try_start_b3
    monitor-exit v1
    :try_end_b4
    .catchall {:try_start_b3 .. :try_end_b4} :catchall_b2

    :try_start_b4
    throw v0
    :try_end_b5
    .catch Ljava/lang/Exception; {:try_start_b4 .. :try_end_b5} :catch_b0
.end method

.method public encode(Lcom/jcraft/jsch/Packet;)V
    .registers 10
    .param p1, "packet"    # Lcom/jcraft/jsch/Packet;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 868
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->deflater:Lcom/jcraft/jsch/Compression;

    if-eqz v0, :cond_26

    .line 869
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->compress_len:[I

    iget-object v3, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    iget v3, v3, Lcom/jcraft/jsch/Buffer;->index:I

    aput v3, v0, v2

    .line 870
    iget-object v0, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    iget-object v3, p0, Lcom/jcraft/jsch/Session;->deflater:Lcom/jcraft/jsch/Compression;

    iget-object v4, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    iget-object v4, v4, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v5, 0x5

    iget-object v7, p0, Lcom/jcraft/jsch/Session;->compress_len:[I

    invoke-interface {v3, v4, v5, v7}, Lcom/jcraft/jsch/Compression;->compress([BI[I)[B

    move-result-object v3

    iput-object v3, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    .line 872
    iget-object v0, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    iget-object v3, p0, Lcom/jcraft/jsch/Session;->compress_len:[I

    aget v3, v3, v2

    iput v3, v0, Lcom/jcraft/jsch/Buffer;->index:I

    .line 874
    :cond_26
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->c2scipher:Lcom/jcraft/jsch/Cipher;

    if-eqz v0, :cond_93

    .line 876
    iget v0, p0, Lcom/jcraft/jsch/Session;->c2scipher_size:I

    invoke-virtual {p1, v0}, Lcom/jcraft/jsch/Packet;->padding(I)V

    .line 877
    iget-object v0, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v3, 0x4

    aget-byte v6, v0, v3

    .line 878
    .local v6, "pad":I
    sget-object v3, Lcom/jcraft/jsch/Session;->random:Lcom/jcraft/jsch/Random;

    monitor-enter v3

    .line 879
    :try_start_39
    sget-object v0, Lcom/jcraft/jsch/Session;->random:Lcom/jcraft/jsch/Random;

    iget-object v4, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    iget-object v4, v4, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget-object v5, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    iget v5, v5, Lcom/jcraft/jsch/Buffer;->index:I

    sub-int/2addr v5, v6

    invoke-interface {v0, v4, v5, v6}, Lcom/jcraft/jsch/Random;->fill([BII)V

    .line 880
    monitor-exit v3
    :try_end_48
    .catchall {:try_start_39 .. :try_end_48} :catchall_90

    .line 886
    .end local v6    # "pad":I
    :goto_48
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->c2smac:Lcom/jcraft/jsch/MAC;

    if-eqz v0, :cond_6d

    .line 887
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->c2smac:Lcom/jcraft/jsch/MAC;

    iget v3, p0, Lcom/jcraft/jsch/Session;->seqo:I

    invoke-interface {v0, v3}, Lcom/jcraft/jsch/MAC;->update(I)V

    .line 888
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->c2smac:Lcom/jcraft/jsch/MAC;

    iget-object v3, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    iget-object v3, v3, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget-object v4, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    iget v4, v4, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-interface {v0, v3, v2, v4}, Lcom/jcraft/jsch/MAC;->update([BII)V

    .line 889
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->c2smac:Lcom/jcraft/jsch/MAC;

    iget-object v3, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    iget-object v3, v3, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget-object v4, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    iget v4, v4, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-interface {v0, v3, v4}, Lcom/jcraft/jsch/MAC;->doFinal([BI)V

    .line 891
    :cond_6d
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->c2scipher:Lcom/jcraft/jsch/Cipher;

    if-eqz v0, :cond_80

    .line 892
    iget-object v0, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    iget-object v1, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    .line 893
    .local v1, "buf":[B
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->c2scipher:Lcom/jcraft/jsch/Cipher;

    iget-object v3, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    iget v3, v3, Lcom/jcraft/jsch/Buffer;->index:I

    move-object v4, v1

    move v5, v2

    invoke-interface/range {v0 .. v5}, Lcom/jcraft/jsch/Cipher;->update([BII[BI)V

    .line 895
    .end local v1    # "buf":[B
    :cond_80
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->c2smac:Lcom/jcraft/jsch/MAC;

    if-eqz v0, :cond_8f

    .line 896
    iget-object v0, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    iget-object v2, p0, Lcom/jcraft/jsch/Session;->c2smac:Lcom/jcraft/jsch/MAC;

    invoke-interface {v2}, Lcom/jcraft/jsch/MAC;->getBlockSize()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->skip(I)V

    .line 898
    :cond_8f
    return-void

    .line 880
    .restart local v6    # "pad":I
    :catchall_90
    move-exception v0

    :try_start_91
    monitor-exit v3
    :try_end_92
    .catchall {:try_start_91 .. :try_end_92} :catchall_90

    throw v0

    .line 883
    .end local v6    # "pad":I
    :cond_93
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Lcom/jcraft/jsch/Packet;->padding(I)V

    goto :goto_48
.end method

.method public getClientVersion()Ljava/lang/String;
    .registers 2

    .prologue
    .line 2336
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->V_C:[B

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getConfig(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 2299
    const/4 v0, 0x0

    .line 2300
    .local v0, "foo":Ljava/lang/Object;
    iget-object v1, p0, Lcom/jcraft/jsch/Session;->config:Ljava/util/Hashtable;

    if-eqz v1, :cond_12

    .line 2301
    iget-object v1, p0, Lcom/jcraft/jsch/Session;->config:Ljava/util/Hashtable;

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 2302
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_12

    check-cast v0, Ljava/lang/String;

    .line 2306
    .end local v0    # "foo":Ljava/lang/Object;
    :goto_11
    return-object v0

    .line 2304
    :cond_12
    iget-object v1, p0, Lcom/jcraft/jsch/Session;->jsch:Lcom/jcraft/jsch/JSch;

    invoke-static {p1}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2305
    .local v0, "foo":Ljava/lang/String;
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_1f

    check-cast v0, Ljava/lang/String;

    goto :goto_11

    .line 2306
    :cond_1f
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public getHost()Ljava/lang/String;
    .registers 2

    .prologue
    .line 2374
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    return-object v0
.end method

.method public getHostKey()Lcom/jcraft/jsch/HostKey;
    .registers 2

    .prologue
    .line 2373
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->hostkey:Lcom/jcraft/jsch/HostKey;

    return-object v0
.end method

.method public getHostKeyAlias()Ljava/lang/String;
    .registers 2

    .prologue
    .line 2381
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->hostKeyAlias:Ljava/lang/String;

    return-object v0
.end method

.method public getHostKeyRepository()Lcom/jcraft/jsch/HostKeyRepository;
    .registers 2

    .prologue
    .line 2566
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->hostkeyRepository:Lcom/jcraft/jsch/HostKeyRepository;

    if-nez v0, :cond_b

    .line 2567
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->jsch:Lcom/jcraft/jsch/JSch;

    invoke-virtual {v0}, Lcom/jcraft/jsch/JSch;->getHostKeyRepository()Lcom/jcraft/jsch/HostKeyRepository;

    move-result-object v0

    .line 2568
    :goto_a
    return-object v0

    :cond_b
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->hostkeyRepository:Lcom/jcraft/jsch/HostKeyRepository;

    goto :goto_a
.end method

.method getIdentityRepository()Lcom/jcraft/jsch/IdentityRepository;
    .registers 2

    .prologue
    .line 2543
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->identityRepository:Lcom/jcraft/jsch/IdentityRepository;

    if-nez v0, :cond_b

    .line 2544
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->jsch:Lcom/jcraft/jsch/JSch;

    invoke-virtual {v0}, Lcom/jcraft/jsch/JSch;->getIdentityRepository()Lcom/jcraft/jsch/IdentityRepository;

    move-result-object v0

    .line 2545
    :goto_a
    return-object v0

    :cond_b
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->identityRepository:Lcom/jcraft/jsch/IdentityRepository;

    goto :goto_a
.end method

.method public getPort()I
    .registers 2

    .prologue
    .line 2376
    iget v0, p0, Lcom/jcraft/jsch/Session;->port:I

    return v0
.end method

.method public getPortForwardingL()[Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 1861
    invoke-static {p0}, Lcom/jcraft/jsch/PortWatcher;->getPortForwarding(Lcom/jcraft/jsch/Session;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPortForwardingR()[Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 1997
    invoke-static {p0}, Lcom/jcraft/jsch/ChannelForwardedTCPIP;->getPortForwarding(Lcom/jcraft/jsch/Session;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getServerAliveCountMax()I
    .registers 2

    .prologue
    .line 2425
    iget v0, p0, Lcom/jcraft/jsch/Session;->serverAliveCountMax:I

    return v0
.end method

.method public getServerAliveInterval()I
    .registers 2

    .prologue
    .line 2403
    iget v0, p0, Lcom/jcraft/jsch/Session;->serverAliveInterval:I

    return v0
.end method

.method public getServerVersion()Ljava/lang/String;
    .registers 2

    .prologue
    .line 2333
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->V_S:[B

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getSessionId()[B
    .registers 2

    .prologue
    .line 1077
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->session_id:[B

    return-object v0
.end method

.method public getStreamForwarder(Ljava/lang/String;I)Lcom/jcraft/jsch/Channel;
    .registers 4
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 2106
    new-instance v0, Lcom/jcraft/jsch/ChannelDirectTCPIP;

    invoke-direct {v0}, Lcom/jcraft/jsch/ChannelDirectTCPIP;-><init>()V

    .line 2107
    .local v0, "channel":Lcom/jcraft/jsch/ChannelDirectTCPIP;
    invoke-virtual {v0}, Lcom/jcraft/jsch/ChannelDirectTCPIP;->init()V

    .line 2108
    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/Session;->addChannel(Lcom/jcraft/jsch/Channel;)V

    .line 2109
    invoke-virtual {v0, p1}, Lcom/jcraft/jsch/ChannelDirectTCPIP;->setHost(Ljava/lang/String;)V

    .line 2110
    invoke-virtual {v0, p2}, Lcom/jcraft/jsch/ChannelDirectTCPIP;->setPort(I)V

    .line 2111
    return-object v0
.end method

.method public getTimeout()I
    .registers 2

    .prologue
    .line 2313
    iget v0, p0, Lcom/jcraft/jsch/Session;->timeout:I

    return v0
.end method

.method public getUserInfo()Lcom/jcraft/jsch/UserInfo;
    .registers 2

    .prologue
    .line 2257
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->userinfo:Lcom/jcraft/jsch/UserInfo;

    return-object v0
.end method

.method public getUserName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 2375
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->username:Ljava/lang/String;

    return-object v0
.end method

.method public isConnected()Z
    .registers 2

    .prologue
    .line 2312
    iget-boolean v0, p0, Lcom/jcraft/jsch/Session;->isConnected:Z

    return v0
.end method

.method public noMoreSessionChannels()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2363
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    invoke-direct {v0}, Lcom/jcraft/jsch/Buffer;-><init>()V

    .line 2364
    .local v0, "buf":Lcom/jcraft/jsch/Buffer;
    new-instance v1, Lcom/jcraft/jsch/Packet;

    invoke-direct {v1, v0}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    .line 2365
    .local v1, "packet":Lcom/jcraft/jsch/Packet;
    invoke-virtual {v1}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 2366
    const/16 v2, 0x50

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 2367
    sget-object v2, Lcom/jcraft/jsch/Session;->nomoresessions:[B

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 2368
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 2369
    invoke-virtual {p0, v1}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 2370
    return-void
.end method

.method public openChannel(Ljava/lang/String;)Lcom/jcraft/jsch/Channel;
    .registers 6
    .param p1, "type"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 843
    iget-boolean v2, p0, Lcom/jcraft/jsch/Session;->isConnected:Z

    if-nez v2, :cond_c

    .line 844
    new-instance v2, Lcom/jcraft/jsch/JSchException;

    const-string v3, "session is down"

    invoke-direct {v2, v3}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 847
    :cond_c
    :try_start_c
    invoke-static {p1}, Lcom/jcraft/jsch/Channel;->getChannel(Ljava/lang/String;)Lcom/jcraft/jsch/Channel;

    move-result-object v1

    .line 848
    .local v1, "channel":Lcom/jcraft/jsch/Channel;
    invoke-virtual {p0, v1}, Lcom/jcraft/jsch/Session;->addChannel(Lcom/jcraft/jsch/Channel;)V

    .line 849
    invoke-virtual {v1}, Lcom/jcraft/jsch/Channel;->init()V

    .line 850
    instance-of v2, v1, Lcom/jcraft/jsch/ChannelSession;

    if-eqz v2, :cond_21

    .line 851
    move-object v0, v1

    check-cast v0, Lcom/jcraft/jsch/ChannelSession;

    move-object v2, v0

    invoke-direct {p0, v2}, Lcom/jcraft/jsch/Session;->applyConfigChannel(Lcom/jcraft/jsch/ChannelSession;)V
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_21} :catch_22

    .line 858
    .end local v1    # "channel":Lcom/jcraft/jsch/Channel;
    :cond_21
    :goto_21
    return-object v1

    .line 855
    :catch_22
    move-exception v2

    .line 858
    const/4 v1, 0x0

    goto :goto_21
.end method

.method public read(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/Buffer;
    .registers 25
    .param p1, "buf"    # Lcom/jcraft/jsch/Buffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 906
    const/4 v6, 0x0

    .line 908
    .local v6, "j":I
    :cond_1
    :goto_1
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->reset()V

    .line 909
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v0, p1

    iget v4, v0, Lcom/jcraft/jsch/Buffer;->index:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/jcraft/jsch/Session;->s2ccipher_size:I

    invoke-virtual {v2, v3, v4, v5}, Lcom/jcraft/jsch/IO;->getByte([BII)V

    .line 910
    move-object/from16 v0, p1

    iget v2, v0, Lcom/jcraft/jsch/Buffer;->index:I

    move-object/from16 v0, p0

    iget v3, v0, Lcom/jcraft/jsch/Session;->s2ccipher_size:I

    add-int/2addr v2, v3

    move-object/from16 v0, p1

    iput v2, v0, Lcom/jcraft/jsch/Buffer;->index:I

    .line 911
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->s2ccipher:Lcom/jcraft/jsch/Cipher;

    if-eqz v2, :cond_3f

    .line 912
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->s2ccipher:Lcom/jcraft/jsch/Cipher;

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget v5, v0, Lcom/jcraft/jsch/Session;->s2ccipher_size:I

    move-object/from16 v0, p1

    iget-object v6, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    .end local v6    # "j":I
    const/4 v7, 0x0

    invoke-interface/range {v2 .. v7}, Lcom/jcraft/jsch/Cipher;->update([BII[BI)V

    .line 914
    :cond_3f
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v3, 0x0

    aget-byte v2, v2, v3

    shl-int/lit8 v2, v2, 0x18

    const/high16 v3, -0x1000000

    and-int/2addr v2, v3

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v4, 0x1

    aget-byte v3, v3, v4

    shl-int/lit8 v3, v3, 0x10

    const/high16 v4, 0xff0000

    and-int/2addr v3, v4

    or-int/2addr v2, v3

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v4, 0x2

    aget-byte v3, v3, v4

    shl-int/lit8 v3, v3, 0x8

    const v4, 0xff00

    and-int/2addr v3, v4

    or-int/2addr v2, v3

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v4, 0x3

    aget-byte v3, v3, v4

    and-int/lit16 v3, v3, 0xff

    or-int v6, v2, v3

    .line 919
    .restart local v6    # "j":I
    const/4 v2, 0x5

    if-lt v6, v2, :cond_78

    const/high16 v2, 0x40000

    if-le v6, v2, :cond_89

    .line 920
    :cond_78
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/Session;->s2ccipher:Lcom/jcraft/jsch/Cipher;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jcraft/jsch/Session;->s2cmac:Lcom/jcraft/jsch/MAC;

    const/high16 v7, 0x40000

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    invoke-direct/range {v2 .. v7}, Lcom/jcraft/jsch/Session;->start_discard(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/Cipher;Lcom/jcraft/jsch/MAC;II)V

    .line 922
    :cond_89
    add-int/lit8 v2, v6, 0x4

    move-object/from16 v0, p0

    iget v3, v0, Lcom/jcraft/jsch/Session;->s2ccipher_size:I

    sub-int v10, v2, v3

    .line 926
    .local v10, "need":I
    move-object/from16 v0, p1

    iget v2, v0, Lcom/jcraft/jsch/Buffer;->index:I

    add-int/2addr v2, v10

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    array-length v3, v3

    if-le v2, v3, :cond_b5

    .line 927
    move-object/from16 v0, p1

    iget v2, v0, Lcom/jcraft/jsch/Buffer;->index:I

    add-int/2addr v2, v10

    new-array v15, v2, [B

    .line 928
    .local v15, "foo":[B
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object/from16 v0, p1

    iget v5, v0, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-static {v2, v3, v15, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 929
    move-object/from16 v0, p1

    iput-object v15, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    .line 932
    .end local v15    # "foo":[B
    :cond_b5
    move-object/from16 v0, p0

    iget v2, v0, Lcom/jcraft/jsch/Session;->s2ccipher_size:I

    rem-int v2, v10, v2

    if-eqz v2, :cond_fc

    .line 933
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Bad packet length "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 934
    .local v17, "message":Ljava/lang/String;
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v2

    const/4 v3, 0x4

    invoke-interface {v2, v3}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_e5

    .line 935
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v2

    const/4 v3, 0x4

    move-object/from16 v0, v17

    invoke-interface {v2, v3, v0}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 937
    :cond_e5
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/Session;->s2ccipher:Lcom/jcraft/jsch/Cipher;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jcraft/jsch/Session;->s2cmac:Lcom/jcraft/jsch/MAC;

    const/high16 v2, 0x40000

    move-object/from16 v0, p0

    iget v3, v0, Lcom/jcraft/jsch/Session;->s2ccipher_size:I

    sub-int v7, v2, v3

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    invoke-direct/range {v2 .. v7}, Lcom/jcraft/jsch/Session;->start_discard(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/Cipher;Lcom/jcraft/jsch/MAC;II)V

    .line 940
    .end local v17    # "message":Ljava/lang/String;
    :cond_fc
    if-lez v10, :cond_133

    .line 941
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v0, p1

    iget v4, v0, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-virtual {v2, v3, v4, v10}, Lcom/jcraft/jsch/IO;->getByte([BII)V

    move-object/from16 v0, p1

    iget v2, v0, Lcom/jcraft/jsch/Buffer;->index:I

    add-int/2addr v2, v10

    move-object/from16 v0, p1

    iput v2, v0, Lcom/jcraft/jsch/Buffer;->index:I

    .line 942
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->s2ccipher:Lcom/jcraft/jsch/Cipher;

    if-eqz v2, :cond_133

    .line 943
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/jcraft/jsch/Session;->s2ccipher:Lcom/jcraft/jsch/Cipher;

    move-object/from16 v0, p1

    iget-object v8, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v0, p0

    iget v9, v0, Lcom/jcraft/jsch/Session;->s2ccipher_size:I

    move-object/from16 v0, p1

    iget-object v11, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v0, p0

    iget v12, v0, Lcom/jcraft/jsch/Session;->s2ccipher_size:I

    invoke-interface/range {v7 .. v12}, Lcom/jcraft/jsch/Cipher;->update([BII[BI)V

    .line 947
    :cond_133
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->s2cmac:Lcom/jcraft/jsch/MAC;

    if-eqz v2, :cond_1a0

    .line 948
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->s2cmac:Lcom/jcraft/jsch/MAC;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/jcraft/jsch/Session;->seqi:I

    invoke-interface {v2, v3}, Lcom/jcraft/jsch/MAC;->update(I)V

    .line 949
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->s2cmac:Lcom/jcraft/jsch/MAC;

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v4, 0x0

    move-object/from16 v0, p1

    iget v5, v0, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-interface {v2, v3, v4, v5}, Lcom/jcraft/jsch/MAC;->update([BII)V

    .line 951
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->s2cmac:Lcom/jcraft/jsch/MAC;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/Session;->s2cmac_result1:[B

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Lcom/jcraft/jsch/MAC;->doFinal([BI)V

    .line 952
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/Session;->s2cmac_result2:[B

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jcraft/jsch/Session;->s2cmac_result2:[B

    array-length v5, v5

    invoke-virtual {v2, v3, v4, v5}, Lcom/jcraft/jsch/IO;->getByte([BII)V

    .line 953
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->s2cmac_result1:[B

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/Session;->s2cmac_result2:[B

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v2

    if-nez v2, :cond_1a0

    .line 954
    const/high16 v2, 0x40000

    if-le v10, v2, :cond_18b

    .line 955
    new-instance v2, Ljava/io/IOException;

    const-string v3, "MAC Error"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 957
    :cond_18b
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/Session;->s2ccipher:Lcom/jcraft/jsch/Cipher;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jcraft/jsch/Session;->s2cmac:Lcom/jcraft/jsch/MAC;

    const/high16 v2, 0x40000

    sub-int v7, v2, v10

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    invoke-direct/range {v2 .. v7}, Lcom/jcraft/jsch/Session;->start_discard(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/Cipher;Lcom/jcraft/jsch/MAC;II)V

    goto/16 :goto_1

    .line 962
    :cond_1a0
    move-object/from16 v0, p0

    iget v2, v0, Lcom/jcraft/jsch/Session;->seqi:I

    add-int/lit8 v2, v2, 0x1

    move-object/from16 v0, p0

    iput v2, v0, Lcom/jcraft/jsch/Session;->seqi:I

    .line 964
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->inflater:Lcom/jcraft/jsch/Compression;

    if-eqz v2, :cond_1ea

    .line 966
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v3, 0x4

    aget-byte v19, v2, v3

    .line 967
    .local v19, "pad":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->uncompress_len:[I

    const/4 v3, 0x0

    move-object/from16 v0, p1

    iget v4, v0, Lcom/jcraft/jsch/Buffer;->index:I

    add-int/lit8 v4, v4, -0x5

    sub-int v4, v4, v19

    aput v4, v2, v3

    .line 968
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->inflater:Lcom/jcraft/jsch/Compression;

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v4, 0x5

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jcraft/jsch/Session;->uncompress_len:[I

    invoke-interface {v2, v3, v4, v5}, Lcom/jcraft/jsch/Compression;->uncompress([BI[I)[B

    move-result-object v15

    .line 969
    .restart local v15    # "foo":[B
    if-eqz v15, :cond_243

    .line 970
    move-object/from16 v0, p1

    iput-object v15, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    .line 971
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->uncompress_len:[I

    const/4 v3, 0x0

    aget v2, v2, v3

    add-int/lit8 v2, v2, 0x5

    move-object/from16 v0, p1

    iput v2, v0, Lcom/jcraft/jsch/Buffer;->index:I

    .line 979
    .end local v15    # "foo":[B
    .end local v19    # "pad":I
    :cond_1ea
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getCommand()B

    move-result v2

    and-int/lit16 v0, v2, 0xff

    move/from16 v22, v0

    .line 981
    .local v22, "type":I
    const/4 v2, 0x1

    move/from16 v0, v22

    if-ne v0, v2, :cond_24e

    .line 982
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->rewind()V

    .line 983
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getInt()I

    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getShort()I

    .line 984
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v20

    .line 985
    .local v20, "reason_code":I
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v14

    .line 986
    .local v14, "description":[B
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v16

    .line 987
    .local v16, "language_tag":[B
    new-instance v2, Lcom/jcraft/jsch/JSchException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "SSH_MSG_DISCONNECT: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {v14}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static/range {v16 .. v16}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 974
    .end local v14    # "description":[B
    .end local v16    # "language_tag":[B
    .end local v20    # "reason_code":I
    .end local v22    # "type":I
    .restart local v15    # "foo":[B
    .restart local v19    # "pad":I
    :cond_243
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v3, "fail in inflater"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1041
    .end local v15    # "foo":[B
    .end local v19    # "pad":I
    :cond_24a
    :goto_24a
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->rewind()V

    .line 1042
    return-object p1

    .line 993
    .restart local v22    # "type":I
    :cond_24e
    const/4 v2, 0x2

    move/from16 v0, v22

    if-eq v0, v2, :cond_1

    .line 995
    const/4 v2, 0x3

    move/from16 v0, v22

    if-ne v0, v2, :cond_28f

    .line 996
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->rewind()V

    .line 997
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getInt()I

    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getShort()I

    .line 998
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v21

    .line 999
    .local v21, "reason_id":I
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v2

    const/4 v3, 0x1

    invoke-interface {v2, v3}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1000
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v2

    const/4 v3, 0x1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Received SSH_MSG_UNIMPLEMENTED for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    goto/16 :goto_1

    .line 1004
    .end local v21    # "reason_id":I
    :cond_28f
    const/4 v2, 0x4

    move/from16 v0, v22

    if-ne v0, v2, :cond_29f

    .line 1005
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->rewind()V

    .line 1006
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getInt()I

    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getShort()I

    goto/16 :goto_1

    .line 1016
    :cond_29f
    const/16 v2, 0x5d

    move/from16 v0, v22

    if-ne v0, v2, :cond_2c3

    .line 1017
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->rewind()V

    .line 1018
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getInt()I

    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getShort()I

    .line 1019
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v2

    move-object/from16 v0, p0

    invoke-static {v2, v0}, Lcom/jcraft/jsch/Channel;->getChannel(ILcom/jcraft/jsch/Session;)Lcom/jcraft/jsch/Channel;

    move-result-object v13

    .line 1020
    .local v13, "c":Lcom/jcraft/jsch/Channel;
    if-eqz v13, :cond_1

    .line 1023
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getUInt()J

    move-result-wide v2

    invoke-virtual {v13, v2, v3}, Lcom/jcraft/jsch/Channel;->addRemoteWindowSize(J)V

    goto/16 :goto_1

    .line 1026
    .end local v13    # "c":Lcom/jcraft/jsch/Channel;
    :cond_2c3
    const/16 v2, 0x34

    move/from16 v0, v22

    if-ne v0, v2, :cond_24a

    .line 1027
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/jcraft/jsch/Session;->isAuthed:Z

    .line 1028
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->inflater:Lcom/jcraft/jsch/Compression;

    if-nez v2, :cond_24a

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->deflater:Lcom/jcraft/jsch/Compression;

    if-nez v2, :cond_24a

    .line 1030
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->guess:[Ljava/lang/String;

    const/4 v3, 0x6

    aget-object v18, v2, v3

    .line 1031
    .local v18, "method":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/Session;->initDeflater(Ljava/lang/String;)V

    .line 1032
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->guess:[Ljava/lang/String;

    const/4 v3, 0x7

    aget-object v18, v2, v3

    .line 1033
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/Session;->initInflater(Ljava/lang/String;)V

    goto/16 :goto_24a
.end method

.method public rekey()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 607
    invoke-direct {p0}, Lcom/jcraft/jsch/Session;->send_kexinit()V

    .line 608
    return-void
.end method

.method public run()V
    .registers 32

    .prologue
    .line 1363
    move-object/from16 v0, p0

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/Session;->thread:Ljava/lang/Runnable;

    .line 1366
    new-instance v3, Lcom/jcraft/jsch/Buffer;

    invoke-direct {v3}, Lcom/jcraft/jsch/Buffer;-><init>()V

    .line 1367
    .local v3, "buf":Lcom/jcraft/jsch/Buffer;
    new-instance v14, Lcom/jcraft/jsch/Packet;

    invoke-direct {v14, v3}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    .line 1368
    .local v14, "packet":Lcom/jcraft/jsch/Packet;
    const/4 v9, 0x0

    .line 1370
    .local v9, "i":I
    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v0, v0, [I

    move-object/from16 v23, v0

    .line 1371
    .local v23, "start":[I
    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v12, v0, [I

    .line 1372
    .local v12, "length":[I
    const/4 v10, 0x0

    .line 1374
    .local v10, "kex":Lcom/jcraft/jsch/KeyExchange;
    const/16 v24, 0x0

    .line 1377
    .local v24, "stimeout":I
    :cond_22
    :goto_22
    :try_start_22
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jcraft/jsch/Session;->isConnected:Z

    move/from16 v27, v0

    if-eqz v27, :cond_ae

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->thread:Ljava/lang/Runnable;

    move-object/from16 v27, v0
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_30} :catch_79

    if-eqz v27, :cond_ae

    .line 1379
    :try_start_32
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/jcraft/jsch/Session;->read(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/Buffer;
    :try_end_37
    .catch Ljava/io/InterruptedIOException; {:try_start_32 .. :try_end_37} :catch_ba
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_37} :catch_79

    move-result-object v3

    .line 1380
    const/16 v24, 0x0

    .line 1395
    :try_start_3a
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getCommand()B

    move-result v27

    move/from16 v0, v27

    and-int/lit16 v13, v0, 0xff

    .line 1397
    .local v13, "msgType":I
    if-eqz v10, :cond_ef

    invoke-virtual {v10}, Lcom/jcraft/jsch/KeyExchange;->getState()I

    move-result v27

    move/from16 v0, v27

    if-ne v0, v13, :cond_ef

    .line 1398
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v27

    move-wide/from16 v0, v27

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/jcraft/jsch/Session;->kex_start_time:J

    .line 1399
    invoke-virtual {v10, v3}, Lcom/jcraft/jsch/KeyExchange;->next(Lcom/jcraft/jsch/Buffer;)Z

    move-result v19

    .line 1400
    .local v19, "result":Z
    if-nez v19, :cond_22

    .line 1401
    new-instance v27, Lcom/jcraft/jsch/JSchException;

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "verify: "

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-direct/range {v27 .. v28}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v27
    :try_end_79
    .catch Ljava/lang/Exception; {:try_start_3a .. :try_end_79} :catch_79

    .line 1669
    .end local v13    # "msgType":I
    .end local v19    # "result":Z
    :catch_79
    move-exception v6

    .line 1670
    .local v6, "e":Ljava/lang/Exception;
    const/16 v27, 0x0

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/jcraft/jsch/Session;->in_kex:Z

    .line 1671
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v27

    const/16 v28, 0x1

    invoke-interface/range {v27 .. v28}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v27

    if-eqz v27, :cond_ae

    .line 1672
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v27

    const/16 v28, 0x1

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "Caught an exception, leaving main loop due to "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual {v6}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-interface/range {v27 .. v29}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 1679
    .end local v6    # "e":Ljava/lang/Exception;
    :cond_ae
    :try_start_ae
    invoke-virtual/range {p0 .. p0}, Lcom/jcraft/jsch/Session;->disconnect()V
    :try_end_b1
    .catch Ljava/lang/NullPointerException; {:try_start_ae .. :try_end_b1} :catch_4aa
    .catch Ljava/lang/Exception; {:try_start_ae .. :try_end_b1} :catch_4ad

    .line 1689
    :goto_b1
    const/16 v27, 0x0

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/jcraft/jsch/Session;->isConnected:Z

    .line 1690
    return-void

    .line 1382
    :catch_ba
    move-exception v7

    .line 1383
    .local v7, "ee":Ljava/io/InterruptedIOException;
    :try_start_bb
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jcraft/jsch/Session;->in_kex:Z

    move/from16 v27, v0

    if-nez v27, :cond_d6

    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/Session;->serverAliveCountMax:I

    move/from16 v27, v0

    move/from16 v0, v24

    move/from16 v1, v27

    if-ge v0, v1, :cond_d6

    .line 1384
    invoke-virtual/range {p0 .. p0}, Lcom/jcraft/jsch/Session;->sendKeepAliveMsg()V

    .line 1385
    add-int/lit8 v24, v24, 0x1

    .line 1386
    goto/16 :goto_22

    .line 1388
    :cond_d6
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jcraft/jsch/Session;->in_kex:Z

    move/from16 v27, v0

    if-eqz v27, :cond_ee

    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/Session;->serverAliveCountMax:I

    move/from16 v27, v0

    move/from16 v0, v24

    move/from16 v1, v27

    if-ge v0, v1, :cond_ee

    .line 1389
    add-int/lit8 v24, v24, 0x1

    .line 1390
    goto/16 :goto_22

    .line 1392
    :cond_ee
    throw v7

    .line 1406
    .end local v7    # "ee":Ljava/io/InterruptedIOException;
    .restart local v13    # "msgType":I
    :cond_ef
    sparse-switch v13, :sswitch_data_4b0

    .line 1665
    new-instance v27, Ljava/io/IOException;

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "Unknown SSH message type "

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-direct/range {v27 .. v28}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v27

    .line 1409
    :sswitch_10d
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/jcraft/jsch/Session;->receive_kexinit(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/KeyExchange;

    move-result-object v10

    .line 1410
    goto/16 :goto_22

    .line 1414
    :sswitch_115
    invoke-direct/range {p0 .. p0}, Lcom/jcraft/jsch/Session;->send_newkeys()V

    .line 1415
    move-object/from16 v0, p0

    invoke-direct {v0, v3, v10}, Lcom/jcraft/jsch/Session;->receive_newkeys(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/KeyExchange;)V

    .line 1416
    const/4 v10, 0x0

    .line 1417
    goto/16 :goto_22

    .line 1420
    :sswitch_120
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 1421
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getByte()I

    .line 1422
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getByte()I

    .line 1423
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v9

    .line 1424
    move-object/from16 v0, p0

    invoke-static {v9, v0}, Lcom/jcraft/jsch/Channel;->getChannel(ILcom/jcraft/jsch/Session;)Lcom/jcraft/jsch/Channel;

    move-result-object v4

    .line 1425
    .local v4, "channel":Lcom/jcraft/jsch/Channel;
    move-object/from16 v0, v23

    invoke-virtual {v3, v0, v12}, Lcom/jcraft/jsch/Buffer;->getString([I[I)[B

    move-result-object v8

    .line 1426
    .local v8, "foo":[B
    if-eqz v4, :cond_22

    .line 1430
    const/16 v27, 0x0

    aget v27, v12, v27
    :try_end_13f
    .catch Ljava/lang/Exception; {:try_start_bb .. :try_end_13f} :catch_79

    if-eqz v27, :cond_22

    .line 1435
    const/16 v27, 0x0

    :try_start_143
    aget v27, v23, v27

    const/16 v28, 0x0

    aget v28, v12, v28

    move/from16 v0, v27

    move/from16 v1, v28

    invoke-virtual {v4, v8, v0, v1}, Lcom/jcraft/jsch/Channel;->write([BII)V
    :try_end_150
    .catch Ljava/lang/Exception; {:try_start_143 .. :try_end_150} :catch_1a9

    .line 1442
    const/16 v27, 0x0

    :try_start_152
    aget v11, v12, v27

    .line 1443
    .local v11, "len":I
    iget v0, v4, Lcom/jcraft/jsch/Channel;->lwsize:I

    move/from16 v27, v0

    sub-int v27, v27, v11

    move/from16 v0, v27

    invoke-virtual {v4, v0}, Lcom/jcraft/jsch/Channel;->setLocalWindowSize(I)V

    .line 1444
    iget v0, v4, Lcom/jcraft/jsch/Channel;->lwsize:I

    move/from16 v27, v0

    iget v0, v4, Lcom/jcraft/jsch/Channel;->lwsize_max:I

    move/from16 v28, v0

    div-int/lit8 v28, v28, 0x2

    move/from16 v0, v27

    move/from16 v1, v28

    if-ge v0, v1, :cond_22

    .line 1445
    invoke-virtual {v14}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 1446
    const/16 v27, 0x5d

    move/from16 v0, v27

    invoke-virtual {v3, v0}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 1447
    invoke-virtual {v4}, Lcom/jcraft/jsch/Channel;->getRecipient()I

    move-result v27

    move/from16 v0, v27

    invoke-virtual {v3, v0}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 1448
    iget v0, v4, Lcom/jcraft/jsch/Channel;->lwsize_max:I

    move/from16 v27, v0

    iget v0, v4, Lcom/jcraft/jsch/Channel;->lwsize:I

    move/from16 v28, v0

    sub-int v27, v27, v28

    move/from16 v0, v27

    invoke-virtual {v3, v0}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 1449
    monitor-enter v4
    :try_end_192
    .catch Ljava/lang/Exception; {:try_start_152 .. :try_end_192} :catch_79

    .line 1450
    :try_start_192
    iget-boolean v0, v4, Lcom/jcraft/jsch/Channel;->close:Z

    move/from16 v27, v0

    if-nez v27, :cond_19d

    .line 1451
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 1452
    :cond_19d
    monitor-exit v4
    :try_end_19e
    .catchall {:try_start_192 .. :try_end_19e} :catchall_1b2

    .line 1453
    :try_start_19e
    iget v0, v4, Lcom/jcraft/jsch/Channel;->lwsize_max:I

    move/from16 v27, v0

    move/from16 v0, v27

    invoke-virtual {v4, v0}, Lcom/jcraft/jsch/Channel;->setLocalWindowSize(I)V
    :try_end_1a7
    .catch Ljava/lang/Exception; {:try_start_19e .. :try_end_1a7} :catch_79

    goto/16 :goto_22

    .line 1437
    .end local v11    # "len":I
    :catch_1a9
    move-exception v6

    .line 1439
    .restart local v6    # "e":Ljava/lang/Exception;
    :try_start_1aa
    invoke-virtual {v4}, Lcom/jcraft/jsch/Channel;->disconnect()V
    :try_end_1ad
    .catch Ljava/lang/Exception; {:try_start_1aa .. :try_end_1ad} :catch_1af

    goto/16 :goto_22

    :catch_1af
    move-exception v27

    goto/16 :goto_22

    .line 1452
    .end local v6    # "e":Ljava/lang/Exception;
    .restart local v11    # "len":I
    :catchall_1b2
    move-exception v27

    :try_start_1b3
    monitor-exit v4
    :try_end_1b4
    .catchall {:try_start_1b3 .. :try_end_1b4} :catchall_1b2

    :try_start_1b4
    throw v27

    .line 1458
    .end local v4    # "channel":Lcom/jcraft/jsch/Channel;
    .end local v8    # "foo":[B
    .end local v11    # "len":I
    :sswitch_1b5
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 1459
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getShort()I

    .line 1460
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v9

    .line 1461
    move-object/from16 v0, p0

    invoke-static {v9, v0}, Lcom/jcraft/jsch/Channel;->getChannel(ILcom/jcraft/jsch/Session;)Lcom/jcraft/jsch/Channel;

    move-result-object v4

    .line 1462
    .restart local v4    # "channel":Lcom/jcraft/jsch/Channel;
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 1463
    move-object/from16 v0, v23

    invoke-virtual {v3, v0, v12}, Lcom/jcraft/jsch/Buffer;->getString([I[I)[B

    move-result-object v8

    .line 1465
    .restart local v8    # "foo":[B
    if-eqz v4, :cond_22

    .line 1469
    const/16 v27, 0x0

    aget v27, v12, v27

    if-eqz v27, :cond_22

    .line 1473
    const/16 v27, 0x0

    aget v27, v23, v27

    const/16 v28, 0x0

    aget v28, v12, v28

    move/from16 v0, v27

    move/from16 v1, v28

    invoke-virtual {v4, v8, v0, v1}, Lcom/jcraft/jsch/Channel;->write_ext([BII)V

    .line 1475
    const/16 v27, 0x0

    aget v11, v12, v27

    .line 1476
    .restart local v11    # "len":I
    iget v0, v4, Lcom/jcraft/jsch/Channel;->lwsize:I

    move/from16 v27, v0

    sub-int v27, v27, v11

    move/from16 v0, v27

    invoke-virtual {v4, v0}, Lcom/jcraft/jsch/Channel;->setLocalWindowSize(I)V

    .line 1477
    iget v0, v4, Lcom/jcraft/jsch/Channel;->lwsize:I

    move/from16 v27, v0

    iget v0, v4, Lcom/jcraft/jsch/Channel;->lwsize_max:I

    move/from16 v28, v0

    div-int/lit8 v28, v28, 0x2

    move/from16 v0, v27

    move/from16 v1, v28

    if-ge v0, v1, :cond_22

    .line 1478
    invoke-virtual {v14}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 1479
    const/16 v27, 0x5d

    move/from16 v0, v27

    invoke-virtual {v3, v0}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 1480
    invoke-virtual {v4}, Lcom/jcraft/jsch/Channel;->getRecipient()I

    move-result v27

    move/from16 v0, v27

    invoke-virtual {v3, v0}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 1481
    iget v0, v4, Lcom/jcraft/jsch/Channel;->lwsize_max:I

    move/from16 v27, v0

    iget v0, v4, Lcom/jcraft/jsch/Channel;->lwsize:I

    move/from16 v28, v0

    sub-int v27, v27, v28

    move/from16 v0, v27

    invoke-virtual {v3, v0}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 1482
    monitor-enter v4
    :try_end_227
    .catch Ljava/lang/Exception; {:try_start_1b4 .. :try_end_227} :catch_79

    .line 1483
    :try_start_227
    iget-boolean v0, v4, Lcom/jcraft/jsch/Channel;->close:Z

    move/from16 v27, v0

    if-nez v27, :cond_232

    .line 1484
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 1485
    :cond_232
    monitor-exit v4
    :try_end_233
    .catchall {:try_start_227 .. :try_end_233} :catchall_23e

    .line 1486
    :try_start_233
    iget v0, v4, Lcom/jcraft/jsch/Channel;->lwsize_max:I

    move/from16 v27, v0

    move/from16 v0, v27

    invoke-virtual {v4, v0}, Lcom/jcraft/jsch/Channel;->setLocalWindowSize(I)V
    :try_end_23c
    .catch Ljava/lang/Exception; {:try_start_233 .. :try_end_23c} :catch_79

    goto/16 :goto_22

    .line 1485
    :catchall_23e
    move-exception v27

    :try_start_23f
    monitor-exit v4
    :try_end_240
    .catchall {:try_start_23f .. :try_end_240} :catchall_23e

    :try_start_240
    throw v27

    .line 1491
    .end local v4    # "channel":Lcom/jcraft/jsch/Channel;
    .end local v8    # "foo":[B
    .end local v11    # "len":I
    :sswitch_241
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 1492
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getShort()I

    .line 1493
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v9

    .line 1494
    move-object/from16 v0, p0

    invoke-static {v9, v0}, Lcom/jcraft/jsch/Channel;->getChannel(ILcom/jcraft/jsch/Session;)Lcom/jcraft/jsch/Channel;

    move-result-object v4

    .line 1495
    .restart local v4    # "channel":Lcom/jcraft/jsch/Channel;
    if-eqz v4, :cond_22

    .line 1498
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getUInt()J

    move-result-wide v27

    move-wide/from16 v0, v27

    invoke-virtual {v4, v0, v1}, Lcom/jcraft/jsch/Channel;->addRemoteWindowSize(J)V

    goto/16 :goto_22

    .line 1502
    .end local v4    # "channel":Lcom/jcraft/jsch/Channel;
    :sswitch_25e
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 1503
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getShort()I

    .line 1504
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v9

    .line 1505
    move-object/from16 v0, p0

    invoke-static {v9, v0}, Lcom/jcraft/jsch/Channel;->getChannel(ILcom/jcraft/jsch/Session;)Lcom/jcraft/jsch/Channel;

    move-result-object v4

    .line 1506
    .restart local v4    # "channel":Lcom/jcraft/jsch/Channel;
    if-eqz v4, :cond_22

    .line 1509
    invoke-virtual {v4}, Lcom/jcraft/jsch/Channel;->eof_remote()V

    goto/16 :goto_22

    .line 1519
    .end local v4    # "channel":Lcom/jcraft/jsch/Channel;
    :sswitch_275
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 1520
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getShort()I

    .line 1521
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v9

    .line 1522
    move-object/from16 v0, p0

    invoke-static {v9, v0}, Lcom/jcraft/jsch/Channel;->getChannel(ILcom/jcraft/jsch/Session;)Lcom/jcraft/jsch/Channel;

    move-result-object v4

    .line 1523
    .restart local v4    # "channel":Lcom/jcraft/jsch/Channel;
    if-eqz v4, :cond_22

    .line 1525
    invoke-virtual {v4}, Lcom/jcraft/jsch/Channel;->disconnect()V

    goto/16 :goto_22

    .line 1534
    .end local v4    # "channel":Lcom/jcraft/jsch/Channel;
    :sswitch_28c
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 1535
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getShort()I

    .line 1536
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v9

    .line 1537
    move-object/from16 v0, p0

    invoke-static {v9, v0}, Lcom/jcraft/jsch/Channel;->getChannel(ILcom/jcraft/jsch/Session;)Lcom/jcraft/jsch/Channel;

    move-result-object v4

    .line 1538
    .restart local v4    # "channel":Lcom/jcraft/jsch/Channel;
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v15

    .line 1539
    .local v15, "r":I
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getUInt()J

    move-result-wide v21

    .line 1540
    .local v21, "rws":J
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v20

    .line 1541
    .local v20, "rps":I
    if-eqz v4, :cond_22

    .line 1542
    move-wide/from16 v0, v21

    invoke-virtual {v4, v0, v1}, Lcom/jcraft/jsch/Channel;->setRemoteWindowSize(J)V

    .line 1543
    move/from16 v0, v20

    invoke-virtual {v4, v0}, Lcom/jcraft/jsch/Channel;->setRemotePacketSize(I)V

    .line 1544
    const/16 v27, 0x1

    move/from16 v0, v27

    iput-boolean v0, v4, Lcom/jcraft/jsch/Channel;->open_confirmation:Z

    .line 1545
    invoke-virtual {v4, v15}, Lcom/jcraft/jsch/Channel;->setRecipient(I)V

    goto/16 :goto_22

    .line 1549
    .end local v4    # "channel":Lcom/jcraft/jsch/Channel;
    .end local v15    # "r":I
    .end local v20    # "rps":I
    .end local v21    # "rws":J
    :sswitch_2bf
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 1550
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getShort()I

    .line 1551
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v9

    .line 1552
    move-object/from16 v0, p0

    invoke-static {v9, v0}, Lcom/jcraft/jsch/Channel;->getChannel(ILcom/jcraft/jsch/Session;)Lcom/jcraft/jsch/Channel;

    move-result-object v4

    .line 1553
    .restart local v4    # "channel":Lcom/jcraft/jsch/Channel;
    if-eqz v4, :cond_22

    .line 1554
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v16

    .line 1557
    .local v16, "reason_code":I
    move/from16 v0, v16

    invoke-virtual {v4, v0}, Lcom/jcraft/jsch/Channel;->setExitStatus(I)V

    .line 1558
    const/16 v27, 0x1

    move/from16 v0, v27

    iput-boolean v0, v4, Lcom/jcraft/jsch/Channel;->close:Z

    .line 1559
    const/16 v27, 0x1

    move/from16 v0, v27

    iput-boolean v0, v4, Lcom/jcraft/jsch/Channel;->eof_remote:Z

    .line 1560
    const/16 v27, 0x0

    move/from16 v0, v27

    invoke-virtual {v4, v0}, Lcom/jcraft/jsch/Channel;->setRecipient(I)V

    goto/16 :goto_22

    .line 1564
    .end local v4    # "channel":Lcom/jcraft/jsch/Channel;
    .end local v16    # "reason_code":I
    :sswitch_2ef
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 1565
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getShort()I

    .line 1566
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v9

    .line 1567
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v8

    .line 1568
    .restart local v8    # "foo":[B
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-result v27

    if-eqz v27, :cond_33e

    const/16 v17, 0x1

    .line 1569
    .local v17, "reply":Z
    :goto_305
    move-object/from16 v0, p0

    invoke-static {v9, v0}, Lcom/jcraft/jsch/Channel;->getChannel(ILcom/jcraft/jsch/Session;)Lcom/jcraft/jsch/Channel;

    move-result-object v4

    .line 1570
    .restart local v4    # "channel":Lcom/jcraft/jsch/Channel;
    if-eqz v4, :cond_22

    .line 1571
    const/16 v18, 0x64

    .line 1572
    .local v18, "reply_type":B
    invoke-static {v8}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v27

    const-string v28, "exit-status"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_324

    .line 1573
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v9

    .line 1574
    invoke-virtual {v4, v9}, Lcom/jcraft/jsch/Channel;->setExitStatus(I)V

    .line 1575
    const/16 v18, 0x63

    .line 1577
    :cond_324
    if-eqz v17, :cond_22

    .line 1578
    invoke-virtual {v14}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 1579
    move/from16 v0, v18

    invoke-virtual {v3, v0}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 1580
    invoke-virtual {v4}, Lcom/jcraft/jsch/Channel;->getRecipient()I

    move-result v27

    move/from16 v0, v27

    invoke-virtual {v3, v0}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 1581
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    goto/16 :goto_22

    .line 1568
    .end local v4    # "channel":Lcom/jcraft/jsch/Channel;
    .end local v17    # "reply":Z
    .end local v18    # "reply_type":B
    :cond_33e
    const/16 v17, 0x0

    goto :goto_305

    .line 1588
    .end local v8    # "foo":[B
    :sswitch_341
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 1589
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getShort()I

    .line 1590
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v8

    .line 1591
    .restart local v8    # "foo":[B
    invoke-static {v8}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v5

    .line 1592
    .local v5, "ctyp":Ljava/lang/String;
    const-string v27, "forwarded-tcpip"

    move-object/from16 v0, v27

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v27

    if-nez v27, :cond_3ac

    const-string v27, "x11"

    move-object/from16 v0, v27

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_36b

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jcraft/jsch/Session;->x11_forwarding:Z

    move/from16 v27, v0

    if-nez v27, :cond_3ac

    :cond_36b
    const-string v27, "auth-agent@openssh.com"

    move-object/from16 v0, v27

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_37d

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jcraft/jsch/Session;->agent_forwarding:Z

    move/from16 v27, v0

    if-nez v27, :cond_3ac

    .line 1597
    :cond_37d
    invoke-virtual {v14}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 1598
    const/16 v27, 0x5c

    move/from16 v0, v27

    invoke-virtual {v3, v0}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 1599
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v27

    move/from16 v0, v27

    invoke-virtual {v3, v0}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 1600
    const/16 v27, 0x1

    move/from16 v0, v27

    invoke-virtual {v3, v0}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 1601
    sget-object v27, Lcom/jcraft/jsch/Util;->empty:[B

    move-object/from16 v0, v27

    invoke-virtual {v3, v0}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 1602
    sget-object v27, Lcom/jcraft/jsch/Util;->empty:[B

    move-object/from16 v0, v27

    invoke-virtual {v3, v0}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 1603
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    goto/16 :goto_22

    .line 1606
    :cond_3ac
    invoke-static {v5}, Lcom/jcraft/jsch/Channel;->getChannel(Ljava/lang/String;)Lcom/jcraft/jsch/Channel;

    move-result-object v4

    .line 1607
    .restart local v4    # "channel":Lcom/jcraft/jsch/Channel;
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/jcraft/jsch/Session;->addChannel(Lcom/jcraft/jsch/Channel;)V

    .line 1608
    invoke-virtual {v4, v3}, Lcom/jcraft/jsch/Channel;->getData(Lcom/jcraft/jsch/Buffer;)V

    .line 1609
    invoke-virtual {v4}, Lcom/jcraft/jsch/Channel;->init()V

    .line 1611
    new-instance v26, Ljava/lang/Thread;

    move-object/from16 v0, v26

    invoke-direct {v0, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 1612
    .local v26, "tmp":Ljava/lang/Thread;
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "Channel "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 1613
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jcraft/jsch/Session;->daemon_thread:Z

    move/from16 v27, v0

    if-eqz v27, :cond_3fb

    .line 1614
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jcraft/jsch/Session;->daemon_thread:Z

    move/from16 v27, v0

    invoke-virtual/range {v26 .. v27}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 1616
    :cond_3fb
    invoke-virtual/range {v26 .. v26}, Ljava/lang/Thread;->start()V

    goto/16 :goto_22

    .line 1620
    .end local v4    # "channel":Lcom/jcraft/jsch/Channel;
    .end local v5    # "ctyp":Ljava/lang/String;
    .end local v8    # "foo":[B
    .end local v26    # "tmp":Ljava/lang/Thread;
    :sswitch_400
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 1621
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getShort()I

    .line 1622
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v9

    .line 1623
    move-object/from16 v0, p0

    invoke-static {v9, v0}, Lcom/jcraft/jsch/Channel;->getChannel(ILcom/jcraft/jsch/Session;)Lcom/jcraft/jsch/Channel;

    move-result-object v4

    .line 1624
    .restart local v4    # "channel":Lcom/jcraft/jsch/Channel;
    if-eqz v4, :cond_22

    .line 1627
    const/16 v27, 0x1

    move/from16 v0, v27

    iput v0, v4, Lcom/jcraft/jsch/Channel;->reply:I

    goto/16 :goto_22

    .line 1630
    .end local v4    # "channel":Lcom/jcraft/jsch/Channel;
    :sswitch_41a
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 1631
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getShort()I

    .line 1632
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v9

    .line 1633
    move-object/from16 v0, p0

    invoke-static {v9, v0}, Lcom/jcraft/jsch/Channel;->getChannel(ILcom/jcraft/jsch/Session;)Lcom/jcraft/jsch/Channel;

    move-result-object v4

    .line 1634
    .restart local v4    # "channel":Lcom/jcraft/jsch/Channel;
    if-eqz v4, :cond_22

    .line 1637
    const/16 v27, 0x0

    move/from16 v0, v27

    iput v0, v4, Lcom/jcraft/jsch/Channel;->reply:I

    goto/16 :goto_22

    .line 1640
    .end local v4    # "channel":Lcom/jcraft/jsch/Channel;
    :sswitch_434
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 1641
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getShort()I

    .line 1642
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v8

    .line 1643
    .restart local v8    # "foo":[B
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-result v27

    if-eqz v27, :cond_459

    const/16 v17, 0x1

    .line 1644
    .restart local v17    # "reply":Z
    :goto_446
    if-eqz v17, :cond_22

    .line 1645
    invoke-virtual {v14}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 1646
    const/16 v27, 0x52

    move/from16 v0, v27

    invoke-virtual {v3, v0}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 1647
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    goto/16 :goto_22

    .line 1643
    .end local v17    # "reply":Z
    :cond_459
    const/16 v17, 0x0

    goto :goto_446

    .line 1652
    .end local v8    # "foo":[B
    :sswitch_45c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->grr:Lcom/jcraft/jsch/Session$GlobalRequestReply;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lcom/jcraft/jsch/Session$GlobalRequestReply;->getThread()Ljava/lang/Thread;

    move-result-object v25

    .line 1653
    .local v25, "t":Ljava/lang/Thread;
    if-eqz v25, :cond_22

    .line 1654
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->grr:Lcom/jcraft/jsch/Session$GlobalRequestReply;

    move-object/from16 v28, v0

    const/16 v27, 0x51

    move/from16 v0, v27

    if-ne v13, v0, :cond_4a7

    const/16 v27, 0x1

    :goto_476
    move-object/from16 v0, v28

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session$GlobalRequestReply;->setReply(I)V

    .line 1655
    const/16 v27, 0x51

    move/from16 v0, v27

    if-ne v13, v0, :cond_4a2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->grr:Lcom/jcraft/jsch/Session$GlobalRequestReply;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lcom/jcraft/jsch/Session$GlobalRequestReply;->getPort()I

    move-result v27

    if-nez v27, :cond_4a2

    .line 1656
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 1657
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getShort()I

    .line 1658
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->grr:Lcom/jcraft/jsch/Session$GlobalRequestReply;

    move-object/from16 v27, v0

    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v28

    invoke-virtual/range {v27 .. v28}, Lcom/jcraft/jsch/Session$GlobalRequestReply;->setPort(I)V

    .line 1660
    :cond_4a2
    invoke-virtual/range {v25 .. v25}, Ljava/lang/Thread;->interrupt()V
    :try_end_4a5
    .catch Ljava/lang/Exception; {:try_start_240 .. :try_end_4a5} :catch_79

    goto/16 :goto_22

    .line 1654
    :cond_4a7
    const/16 v27, 0x0

    goto :goto_476

    .line 1681
    .end local v13    # "msgType":I
    .end local v25    # "t":Ljava/lang/Thread;
    :catch_4aa
    move-exception v27

    goto/16 :goto_b1

    .line 1685
    :catch_4ad
    move-exception v27

    goto/16 :goto_b1

    .line 1406
    :sswitch_data_4b0
    .sparse-switch
        0x14 -> :sswitch_10d
        0x15 -> :sswitch_115
        0x50 -> :sswitch_434
        0x51 -> :sswitch_45c
        0x52 -> :sswitch_45c
        0x5a -> :sswitch_341
        0x5b -> :sswitch_28c
        0x5c -> :sswitch_2bf
        0x5d -> :sswitch_241
        0x5e -> :sswitch_120
        0x5f -> :sswitch_1b5
        0x60 -> :sswitch_25e
        0x61 -> :sswitch_275
        0x62 -> :sswitch_2ef
        0x63 -> :sswitch_400
        0x64 -> :sswitch_41a
    .end sparse-switch
.end method

.method public sendIgnore()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2343
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    invoke-direct {v0}, Lcom/jcraft/jsch/Buffer;-><init>()V

    .line 2344
    .local v0, "buf":Lcom/jcraft/jsch/Buffer;
    new-instance v1, Lcom/jcraft/jsch/Packet;

    invoke-direct {v1, v0}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    .line 2345
    .local v1, "packet":Lcom/jcraft/jsch/Packet;
    invoke-virtual {v1}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 2346
    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 2347
    invoke-virtual {p0, v1}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 2348
    return-void
.end method

.method public sendKeepAliveMsg()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2352
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    invoke-direct {v0}, Lcom/jcraft/jsch/Buffer;-><init>()V

    .line 2353
    .local v0, "buf":Lcom/jcraft/jsch/Buffer;
    new-instance v1, Lcom/jcraft/jsch/Packet;

    invoke-direct {v1, v0}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    .line 2354
    .local v1, "packet":Lcom/jcraft/jsch/Packet;
    invoke-virtual {v1}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 2355
    const/16 v2, 0x50

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 2356
    sget-object v2, Lcom/jcraft/jsch/Session;->keepalivemsg:[B

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 2357
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 2358
    invoke-virtual {p0, v1}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 2359
    return-void
.end method

.method public setClientVersion(Ljava/lang/String;)V
    .registers 3
    .param p1, "cv"    # Ljava/lang/String;

    .prologue
    .line 2339
    invoke-static {p1}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->V_C:[B

    .line 2340
    return-void
.end method

.method public setConfig(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 2290
    iget-object v1, p0, Lcom/jcraft/jsch/Session;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 2291
    :try_start_3
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->config:Ljava/util/Hashtable;

    if-nez v0, :cond_e

    .line 2292
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->config:Ljava/util/Hashtable;

    .line 2294
    :cond_e
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->config:Ljava/util/Hashtable;

    invoke-virtual {v0, p1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2295
    monitor-exit v1

    .line 2296
    return-void

    .line 2295
    :catchall_15
    move-exception v0

    monitor-exit v1
    :try_end_17
    .catchall {:try_start_3 .. :try_end_17} :catchall_15

    throw v0
.end method

.method public setConfig(Ljava/util/Hashtable;)V
    .registers 8
    .param p1, "newconf"    # Ljava/util/Hashtable;

    .prologue
    .line 2279
    iget-object v4, p0, Lcom/jcraft/jsch/Session;->lock:Ljava/lang/Object;

    monitor-enter v4

    .line 2280
    :try_start_3
    iget-object v3, p0, Lcom/jcraft/jsch/Session;->config:Ljava/util/Hashtable;

    if-nez v3, :cond_e

    .line 2281
    new-instance v3, Ljava/util/Hashtable;

    invoke-direct {v3}, Ljava/util/Hashtable;-><init>()V

    iput-object v3, p0, Lcom/jcraft/jsch/Session;->config:Ljava/util/Hashtable;

    .line 2282
    :cond_e
    invoke-virtual {p1}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v1

    .local v1, "e":Ljava/util/Enumeration;
    :goto_12
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_33

    .line 2283
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    move-object v0, v3

    check-cast v0, Ljava/lang/String;

    move-object v2, v0

    .line 2284
    .local v2, "key":Ljava/lang/String;
    iget-object v5, p0, Lcom/jcraft/jsch/Session;->config:Ljava/util/Hashtable;

    invoke-virtual {p1, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v5, v2, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_12

    .line 2286
    .end local v1    # "e":Ljava/util/Enumeration;
    .end local v2    # "key":Ljava/lang/String;
    :catchall_30
    move-exception v3

    monitor-exit v4
    :try_end_32
    .catchall {:try_start_3 .. :try_end_32} :catchall_30

    throw v3

    .restart local v1    # "e":Ljava/util/Enumeration;
    :cond_33
    :try_start_33
    monitor-exit v4
    :try_end_34
    .catchall {:try_start_33 .. :try_end_34} :catchall_30

    .line 2287
    return-void
.end method

.method public setConfig(Ljava/util/Properties;)V
    .registers 2
    .param p1, "newconf"    # Ljava/util/Properties;

    .prologue
    .line 2275
    invoke-virtual {p0, p1}, Lcom/jcraft/jsch/Session;->setConfig(Ljava/util/Hashtable;)V

    .line 2276
    return-void
.end method

.method public setDaemonThread(Z)V
    .registers 2
    .param p1, "enable"    # Z

    .prologue
    .line 2429
    iput-boolean p1, p0, Lcom/jcraft/jsch/Session;->daemon_thread:Z

    .line 2430
    return-void
.end method

.method public setHost(Ljava/lang/String;)V
    .registers 2
    .param p1, "host"    # Ljava/lang/String;

    .prologue
    .line 2253
    iput-object p1, p0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    return-void
.end method

.method public setHostKeyAlias(Ljava/lang/String;)V
    .registers 2
    .param p1, "hostKeyAlias"    # Ljava/lang/String;

    .prologue
    .line 2378
    iput-object p1, p0, Lcom/jcraft/jsch/Session;->hostKeyAlias:Ljava/lang/String;

    .line 2379
    return-void
.end method

.method public setHostKeyRepository(Lcom/jcraft/jsch/HostKeyRepository;)V
    .registers 2
    .param p1, "hostkeyRepository"    # Lcom/jcraft/jsch/HostKeyRepository;

    .prologue
    .line 2555
    iput-object p1, p0, Lcom/jcraft/jsch/Session;->hostkeyRepository:Lcom/jcraft/jsch/HostKeyRepository;

    .line 2556
    return-void
.end method

.method public setIdentityRepository(Lcom/jcraft/jsch/IdentityRepository;)V
    .registers 2
    .param p1, "identityRepository"    # Lcom/jcraft/jsch/IdentityRepository;

    .prologue
    .line 2532
    iput-object p1, p0, Lcom/jcraft/jsch/Session;->identityRepository:Lcom/jcraft/jsch/IdentityRepository;

    .line 2533
    return-void
.end method

.method public setInputStream(Ljava/io/InputStream;)V
    .registers 2
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 2258
    iput-object p1, p0, Lcom/jcraft/jsch/Session;->in:Ljava/io/InputStream;

    return-void
.end method

.method public setOutputStream(Ljava/io/OutputStream;)V
    .registers 2
    .param p1, "out"    # Ljava/io/OutputStream;

    .prologue
    .line 2259
    iput-object p1, p0, Lcom/jcraft/jsch/Session;->out:Ljava/io/OutputStream;

    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .registers 3
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    .line 2264
    if-eqz p1, :cond_8

    .line 2265
    invoke-static {p1}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->password:[B

    .line 2266
    :cond_8
    return-void
.end method

.method public setPassword([B)V
    .registers 5
    .param p1, "password"    # [B

    .prologue
    const/4 v2, 0x0

    .line 2268
    if-eqz p1, :cond_e

    .line 2269
    array-length v0, p1

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->password:[B

    .line 2270
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->password:[B

    array-length v1, p1

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2272
    :cond_e
    return-void
.end method

.method public setPort(I)V
    .registers 2
    .param p1, "port"    # I

    .prologue
    .line 2254
    iput p1, p0, Lcom/jcraft/jsch/Session;->port:I

    return-void
.end method

.method public setPortForwardingL(ILjava/lang/String;I)I
    .registers 5
    .param p1, "lport"    # I
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "rport"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 1768
    const-string v0, "127.0.0.1"

    invoke-virtual {p0, v0, p1, p2, p3}, Lcom/jcraft/jsch/Session;->setPortForwardingL(Ljava/lang/String;ILjava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public setPortForwardingL(Ljava/lang/String;)I
    .registers 7
    .param p1, "conf"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 2071
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/Session;->parseForwarding(Ljava/lang/String;)Lcom/jcraft/jsch/Session$Forwarding;

    move-result-object v0

    .line 2072
    .local v0, "f":Lcom/jcraft/jsch/Session$Forwarding;
    iget-object v1, v0, Lcom/jcraft/jsch/Session$Forwarding;->bind_address:Ljava/lang/String;

    iget v2, v0, Lcom/jcraft/jsch/Session$Forwarding;->port:I

    iget-object v3, v0, Lcom/jcraft/jsch/Session$Forwarding;->host:Ljava/lang/String;

    iget v4, v0, Lcom/jcraft/jsch/Session$Forwarding;->hostport:I

    invoke-virtual {p0, v1, v2, v3, v4}, Lcom/jcraft/jsch/Session;->setPortForwardingL(Ljava/lang/String;ILjava/lang/String;I)I

    move-result v1

    return v1
.end method

.method public setPortForwardingL(Ljava/lang/String;ILjava/lang/String;I)I
    .registers 11
    .param p1, "bind_address"    # Ljava/lang/String;
    .param p2, "lport"    # I
    .param p3, "host"    # Ljava/lang/String;
    .param p4, "rport"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 1785
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/jcraft/jsch/Session;->setPortForwardingL(Ljava/lang/String;ILjava/lang/String;ILcom/jcraft/jsch/ServerSocketFactory;)I

    move-result v0

    return v0
.end method

.method public setPortForwardingL(Ljava/lang/String;ILjava/lang/String;ILcom/jcraft/jsch/ServerSocketFactory;)I
    .registers 13
    .param p1, "bind_address"    # Ljava/lang/String;
    .param p2, "lport"    # I
    .param p3, "host"    # Ljava/lang/String;
    .param p4, "rport"    # I
    .param p5, "ssf"    # Lcom/jcraft/jsch/ServerSocketFactory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 1804
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v6}, Lcom/jcraft/jsch/Session;->setPortForwardingL(Ljava/lang/String;ILjava/lang/String;ILcom/jcraft/jsch/ServerSocketFactory;I)I

    move-result v0

    return v0
.end method

.method public setPortForwardingL(Ljava/lang/String;ILjava/lang/String;ILcom/jcraft/jsch/ServerSocketFactory;I)I
    .registers 11
    .param p1, "bind_address"    # Ljava/lang/String;
    .param p2, "lport"    # I
    .param p3, "host"    # Ljava/lang/String;
    .param p4, "rport"    # I
    .param p5, "ssf"    # Lcom/jcraft/jsch/ServerSocketFactory;
    .param p6, "connectTimeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 1823
    invoke-static/range {p0 .. p5}, Lcom/jcraft/jsch/PortWatcher;->addPort(Lcom/jcraft/jsch/Session;Ljava/lang/String;ILjava/lang/String;ILcom/jcraft/jsch/ServerSocketFactory;)Lcom/jcraft/jsch/PortWatcher;

    move-result-object v0

    .line 1824
    .local v0, "pw":Lcom/jcraft/jsch/PortWatcher;
    invoke-virtual {v0, p6}, Lcom/jcraft/jsch/PortWatcher;->setConnectTimeout(I)V

    .line 1825
    new-instance v1, Ljava/lang/Thread;

    invoke-direct {v1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 1826
    .local v1, "tmp":Ljava/lang/Thread;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "PortWatcher Thread for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 1827
    iget-boolean v2, p0, Lcom/jcraft/jsch/Session;->daemon_thread:Z

    if-eqz v2, :cond_2b

    .line 1828
    iget-boolean v2, p0, Lcom/jcraft/jsch/Session;->daemon_thread:Z

    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 1830
    :cond_2b
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 1831
    iget v2, v0, Lcom/jcraft/jsch/PortWatcher;->lport:I

    return v2
.end method

.method public setPortForwardingR(Ljava/lang/String;)I
    .registers 10
    .param p1, "conf"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 2091
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/Session;->parseForwarding(Ljava/lang/String;)Lcom/jcraft/jsch/Session$Forwarding;

    move-result-object v7

    .line 2092
    .local v7, "f":Lcom/jcraft/jsch/Session$Forwarding;
    iget-object v0, v7, Lcom/jcraft/jsch/Session$Forwarding;->bind_address:Ljava/lang/String;

    iget v1, v7, Lcom/jcraft/jsch/Session$Forwarding;->port:I

    invoke-direct {p0, v0, v1}, Lcom/jcraft/jsch/Session;->_setPortForwardingR(Ljava/lang/String;I)I

    move-result v3

    .line 2093
    .local v3, "allocated":I
    iget-object v1, v7, Lcom/jcraft/jsch/Session$Forwarding;->bind_address:Ljava/lang/String;

    iget v2, v7, Lcom/jcraft/jsch/Session$Forwarding;->port:I

    iget-object v4, v7, Lcom/jcraft/jsch/Session$Forwarding;->host:Ljava/lang/String;

    iget v5, v7, Lcom/jcraft/jsch/Session$Forwarding;->hostport:I

    const/4 v6, 0x0

    move-object v0, p0

    invoke-static/range {v0 .. v6}, Lcom/jcraft/jsch/ChannelForwardedTCPIP;->addPort(Lcom/jcraft/jsch/Session;Ljava/lang/String;IILjava/lang/String;ILcom/jcraft/jsch/SocketFactory;)V

    .line 2095
    return v3
.end method

.method public setPortForwardingR(ILjava/lang/String;)V
    .registers 4
    .param p1, "rport"    # I
    .param p2, "daemon"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 1946
    invoke-virtual {p0, v0, p1, p2, v0}, Lcom/jcraft/jsch/Session;->setPortForwardingR(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Object;)V

    .line 1947
    return-void
.end method

.method public setPortForwardingR(ILjava/lang/String;I)V
    .registers 10
    .param p1, "rport"    # I
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "lport"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 1874
    move-object v5, v1

    check-cast v5, Lcom/jcraft/jsch/SocketFactory;

    move-object v0, p0

    move v2, p1

    move-object v3, p2

    move v4, p3

    invoke-virtual/range {v0 .. v5}, Lcom/jcraft/jsch/Session;->setPortForwardingR(Ljava/lang/String;ILjava/lang/String;ILcom/jcraft/jsch/SocketFactory;)V

    .line 1875
    return-void
.end method

.method public setPortForwardingR(ILjava/lang/String;ILcom/jcraft/jsch/SocketFactory;)V
    .registers 11
    .param p1, "rport"    # I
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "lport"    # I
    .param p4, "sf"    # Lcom/jcraft/jsch/SocketFactory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 1907
    const/4 v1, 0x0

    move-object v0, p0

    move v2, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/jcraft/jsch/Session;->setPortForwardingR(Ljava/lang/String;ILjava/lang/String;ILcom/jcraft/jsch/SocketFactory;)V

    .line 1908
    return-void
.end method

.method public setPortForwardingR(ILjava/lang/String;[Ljava/lang/Object;)V
    .registers 5
    .param p1, "rport"    # I
    .param p2, "daemon"    # Ljava/lang/String;
    .param p3, "arg"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 1963
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1, p2, p3}, Lcom/jcraft/jsch/Session;->setPortForwardingR(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Object;)V

    .line 1964
    return-void
.end method

.method public setPortForwardingR(Ljava/lang/String;ILjava/lang/String;I)V
    .registers 11
    .param p1, "bind_address"    # Ljava/lang/String;
    .param p2, "rport"    # I
    .param p3, "host"    # Ljava/lang/String;
    .param p4, "lport"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 1893
    const/4 v5, 0x0

    check-cast v5, Lcom/jcraft/jsch/SocketFactory;

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/jcraft/jsch/Session;->setPortForwardingR(Ljava/lang/String;ILjava/lang/String;ILcom/jcraft/jsch/SocketFactory;)V

    .line 1894
    return-void
.end method

.method public setPortForwardingR(Ljava/lang/String;ILjava/lang/String;ILcom/jcraft/jsch/SocketFactory;)V
    .registers 13
    .param p1, "bind_address"    # Ljava/lang/String;
    .param p2, "rport"    # I
    .param p3, "host"    # Ljava/lang/String;
    .param p4, "lport"    # I
    .param p5, "sf"    # Lcom/jcraft/jsch/SocketFactory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 1928
    invoke-direct {p0, p1, p2}, Lcom/jcraft/jsch/Session;->_setPortForwardingR(Ljava/lang/String;I)I

    move-result v3

    .local v3, "allocated":I
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v4, p3

    move v5, p4

    move-object v6, p5

    .line 1929
    invoke-static/range {v0 .. v6}, Lcom/jcraft/jsch/ChannelForwardedTCPIP;->addPort(Lcom/jcraft/jsch/Session;Ljava/lang/String;IILjava/lang/String;ILcom/jcraft/jsch/SocketFactory;)V

    .line 1931
    return-void
.end method

.method public setPortForwardingR(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Object;)V
    .registers 11
    .param p1, "bind_address"    # Ljava/lang/String;
    .param p2, "rport"    # I
    .param p3, "daemon"    # Ljava/lang/String;
    .param p4, "arg"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 1986
    invoke-direct {p0, p1, p2}, Lcom/jcraft/jsch/Session;->_setPortForwardingR(Ljava/lang/String;I)I

    move-result v3

    .local v3, "allocated":I
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v4, p3

    move-object v5, p4

    .line 1987
    invoke-static/range {v0 .. v5}, Lcom/jcraft/jsch/ChannelForwardedTCPIP;->addPort(Lcom/jcraft/jsch/Session;Ljava/lang/String;IILjava/lang/String;[Ljava/lang/Object;)V

    .line 1989
    return-void
.end method

.method public setProxy(Lcom/jcraft/jsch/Proxy;)V
    .registers 2
    .param p1, "proxy"    # Lcom/jcraft/jsch/Proxy;

    .prologue
    .line 2252
    iput-object p1, p0, Lcom/jcraft/jsch/Session;->proxy:Lcom/jcraft/jsch/Proxy;

    return-void
.end method

.method public setServerAliveCountMax(I)V
    .registers 2
    .param p1, "count"    # I

    .prologue
    .line 2416
    iput p1, p0, Lcom/jcraft/jsch/Session;->serverAliveCountMax:I

    .line 2417
    return-void
.end method

.method public setServerAliveInterval(I)V
    .registers 2
    .param p1, "interval"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 2393
    invoke-virtual {p0, p1}, Lcom/jcraft/jsch/Session;->setTimeout(I)V

    .line 2394
    iput p1, p0, Lcom/jcraft/jsch/Session;->serverAliveInterval:I

    .line 2395
    return-void
.end method

.method public setSocketFactory(Lcom/jcraft/jsch/SocketFactory;)V
    .registers 2
    .param p1, "sfactory"    # Lcom/jcraft/jsch/SocketFactory;

    .prologue
    .line 2310
    iput-object p1, p0, Lcom/jcraft/jsch/Session;->socket_factory:Lcom/jcraft/jsch/SocketFactory;

    .line 2311
    return-void
.end method

.method public setTimeout(I)V
    .registers 5
    .param p1, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 2315
    iget-object v1, p0, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    if-nez v1, :cond_11

    .line 2316
    if-gez p1, :cond_e

    .line 2317
    new-instance v1, Lcom/jcraft/jsch/JSchException;

    const-string v2, "invalid timeout value"

    invoke-direct {v1, v2}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 2319
    :cond_e
    iput p1, p0, Lcom/jcraft/jsch/Session;->timeout:I

    .line 2331
    :goto_10
    return-void

    .line 2323
    :cond_11
    :try_start_11
    iget-object v1, p0, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    invoke-virtual {v1, p1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 2324
    iput p1, p0, Lcom/jcraft/jsch/Session;->timeout:I
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_18} :catch_19

    goto :goto_10

    .line 2326
    :catch_19
    move-exception v0

    .line 2327
    .local v0, "e":Ljava/lang/Exception;
    instance-of v1, v0, Ljava/lang/Throwable;

    if-eqz v1, :cond_28

    .line 2328
    new-instance v1, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 2329
    :cond_28
    new-instance v1, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public setUserInfo(Lcom/jcraft/jsch/UserInfo;)V
    .registers 2
    .param p1, "userinfo"    # Lcom/jcraft/jsch/UserInfo;

    .prologue
    .line 2256
    iput-object p1, p0, Lcom/jcraft/jsch/Session;->userinfo:Lcom/jcraft/jsch/UserInfo;

    return-void
.end method

.method setUserName(Ljava/lang/String;)V
    .registers 2
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    .line 2255
    iput-object p1, p0, Lcom/jcraft/jsch/Session;->username:Ljava/lang/String;

    return-void
.end method

.method public setX11Cookie(Ljava/lang/String;)V
    .registers 2
    .param p1, "cookie"    # Ljava/lang/String;

    .prologue
    .line 2262
    invoke-static {p1}, Lcom/jcraft/jsch/ChannelX11;->setCookie(Ljava/lang/String;)V

    return-void
.end method

.method public setX11Host(Ljava/lang/String;)V
    .registers 2
    .param p1, "host"    # Ljava/lang/String;

    .prologue
    .line 2260
    invoke-static {p1}, Lcom/jcraft/jsch/ChannelX11;->setHost(Ljava/lang/String;)V

    return-void
.end method

.method public setX11Port(I)V
    .registers 2
    .param p1, "port"    # I

    .prologue
    .line 2261
    invoke-static {p1}, Lcom/jcraft/jsch/ChannelX11;->setPort(I)V

    return-void
.end method

.method public write(Lcom/jcraft/jsch/Packet;)V
    .registers 10
    .param p1, "packet"    # Lcom/jcraft/jsch/Packet;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/16 v7, 0x1f

    .line 1327
    invoke-virtual {p0}, Lcom/jcraft/jsch/Session;->getTimeout()I

    move-result v3

    int-to-long v1, v3

    .line 1328
    .local v1, "t":J
    :goto_7
    iget-boolean v3, p0, Lcom/jcraft/jsch/Session;->in_kex:Z

    if-eqz v3, :cond_49

    .line 1329
    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-lez v3, :cond_24

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-wide v5, p0, Lcom/jcraft/jsch/Session;->kex_start_time:J

    sub-long/2addr v3, v5

    cmp-long v3, v3, v1

    if-lez v3, :cond_24

    .line 1330
    new-instance v3, Lcom/jcraft/jsch/JSchException;

    const-string v4, "timeout in wating for rekeying process."

    invoke-direct {v3, v4}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1332
    :cond_24
    iget-object v3, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getCommand()B

    move-result v0

    .line 1334
    .local v0, "command":B
    const/16 v3, 0x14

    if-eq v0, v3, :cond_49

    const/16 v3, 0x15

    if-eq v0, v3, :cond_49

    const/16 v3, 0x1e

    if-eq v0, v3, :cond_49

    if-eq v0, v7, :cond_49

    if-eq v0, v7, :cond_49

    const/16 v3, 0x20

    if-eq v0, v3, :cond_49

    const/16 v3, 0x21

    if-eq v0, v3, :cond_49

    const/16 v3, 0x22

    if-eq v0, v3, :cond_49

    const/4 v3, 0x1

    if-ne v0, v3, :cond_4d

    .line 1348
    .end local v0    # "command":B
    :cond_49
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/Session;->_write(Lcom/jcraft/jsch/Packet;)V

    .line 1349
    return-void

    .line 1345
    .restart local v0    # "command":B
    :cond_4d
    const-wide/16 v3, 0xa

    :try_start_4f
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_52
    .catch Ljava/lang/InterruptedException; {:try_start_4f .. :try_end_52} :catch_53

    goto :goto_7

    .line 1346
    :catch_53
    move-exception v3

    goto :goto_7
.end method

.method write(Lcom/jcraft/jsch/Packet;Lcom/jcraft/jsch/Channel;I)V
    .registers 16
    .param p1, "packet"    # Lcom/jcraft/jsch/Packet;
    .param p2, "c"    # Lcom/jcraft/jsch/Channel;
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1237
    invoke-virtual {p0}, Lcom/jcraft/jsch/Session;->getTimeout()I

    move-result v8

    int-to-long v6, v8

    .line 1239
    .local v6, "t":J
    :goto_5
    iget-boolean v8, p0, Lcom/jcraft/jsch/Session;->in_kex:Z

    if-eqz v8, :cond_2a

    .line 1240
    const-wide/16 v8, 0x0

    cmp-long v8, v6, v8

    if-lez v8, :cond_22

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    iget-wide v10, p0, Lcom/jcraft/jsch/Session;->kex_start_time:J

    sub-long/2addr v8, v10

    cmp-long v8, v8, v6

    if-lez v8, :cond_22

    .line 1241
    new-instance v8, Lcom/jcraft/jsch/JSchException;

    const-string v9, "timeout in wating for rekeying process."

    invoke-direct {v8, v9}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 1243
    :cond_22
    const-wide/16 v8, 0xa

    :try_start_24
    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V
    :try_end_27
    .catch Ljava/lang/InterruptedException; {:try_start_24 .. :try_end_27} :catch_28

    goto :goto_5

    .line 1244
    :catch_28
    move-exception v8

    goto :goto_5

    .line 1247
    :cond_2a
    monitor-enter p2

    .line 1249
    :try_start_2b
    iget-wide v8, p2, Lcom/jcraft/jsch/Channel;->rwsize:J
    :try_end_2d
    .catchall {:try_start_2b .. :try_end_2d} :catchall_5d

    int-to-long v10, p3

    cmp-long v8, v8, v10

    if-gez v8, :cond_43

    .line 1251
    :try_start_32
    iget v8, p2, Lcom/jcraft/jsch/Channel;->notifyme:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p2, Lcom/jcraft/jsch/Channel;->notifyme:I

    .line 1252
    const-wide/16 v8, 0x64

    invoke-virtual {p2, v8, v9}, Ljava/lang/Object;->wait(J)V
    :try_end_3d
    .catch Ljava/lang/InterruptedException; {:try_start_32 .. :try_end_3d} :catch_55
    .catchall {:try_start_32 .. :try_end_3d} :catchall_60

    .line 1257
    :try_start_3d
    iget v8, p2, Lcom/jcraft/jsch/Channel;->notifyme:I

    add-int/lit8 v8, v8, -0x1

    iput v8, p2, Lcom/jcraft/jsch/Channel;->notifyme:I

    .line 1261
    :cond_43
    :goto_43
    iget-wide v8, p2, Lcom/jcraft/jsch/Channel;->rwsize:J

    int-to-long v10, p3

    cmp-long v8, v8, v10

    if-ltz v8, :cond_68

    .line 1262
    iget-wide v8, p2, Lcom/jcraft/jsch/Channel;->rwsize:J

    int-to-long v10, p3

    sub-long/2addr v8, v10

    iput-wide v8, p2, Lcom/jcraft/jsch/Channel;->rwsize:J

    .line 1263
    monitor-exit p2
    :try_end_51
    .catchall {:try_start_3d .. :try_end_51} :catchall_5d

    .line 1322
    :goto_51
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/Session;->_write(Lcom/jcraft/jsch/Packet;)V

    .line 1323
    :cond_54
    return-void

    .line 1254
    :catch_55
    move-exception v8

    .line 1257
    :try_start_56
    iget v8, p2, Lcom/jcraft/jsch/Channel;->notifyme:I

    add-int/lit8 v8, v8, -0x1

    iput v8, p2, Lcom/jcraft/jsch/Channel;->notifyme:I

    goto :goto_43

    .line 1266
    :catchall_5d
    move-exception v8

    monitor-exit p2
    :try_end_5f
    .catchall {:try_start_56 .. :try_end_5f} :catchall_5d

    throw v8

    .line 1257
    :catchall_60
    move-exception v8

    :try_start_61
    iget v9, p2, Lcom/jcraft/jsch/Channel;->notifyme:I

    add-int/lit8 v9, v9, -0x1

    iput v9, p2, Lcom/jcraft/jsch/Channel;->notifyme:I

    throw v8

    .line 1266
    :cond_68
    monitor-exit p2
    :try_end_69
    .catchall {:try_start_61 .. :try_end_69} :catchall_5d

    .line 1267
    iget-boolean v8, p2, Lcom/jcraft/jsch/Channel;->close:Z

    if-nez v8, :cond_73

    invoke-virtual {p2}, Lcom/jcraft/jsch/Channel;->isConnected()Z

    move-result v8

    if-nez v8, :cond_7b

    .line 1268
    :cond_73
    new-instance v8, Ljava/io/IOException;

    const-string v9, "channel is broken"

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 1271
    :cond_7b
    const/4 v5, 0x0

    .line 1272
    .local v5, "sendit":Z
    const/4 v4, 0x0

    .line 1273
    .local v4, "s":I
    const/4 v0, 0x0

    .line 1274
    .local v0, "command":B
    const/4 v3, -0x1

    .line 1275
    .local v3, "recipient":I
    monitor-enter p2

    .line 1276
    :try_start_80
    iget-wide v8, p2, Lcom/jcraft/jsch/Channel;->rwsize:J

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-lez v8, :cond_be

    .line 1277
    iget-wide v1, p2, Lcom/jcraft/jsch/Channel;->rwsize:J

    .line 1278
    .local v1, "len":J
    int-to-long v8, p3

    cmp-long v8, v1, v8

    if-lez v8, :cond_90

    .line 1279
    int-to-long v1, p3

    .line 1281
    :cond_90
    int-to-long v8, p3

    cmp-long v8, v1, v8

    if-eqz v8, :cond_ab

    .line 1282
    long-to-int v10, v1

    iget-object v8, p0, Lcom/jcraft/jsch/Session;->c2scipher:Lcom/jcraft/jsch/Cipher;

    if-eqz v8, :cond_d4

    iget v8, p0, Lcom/jcraft/jsch/Session;->c2scipher_size:I

    move v9, v8

    :goto_9d
    iget-object v8, p0, Lcom/jcraft/jsch/Session;->c2smac:Lcom/jcraft/jsch/MAC;

    if-eqz v8, :cond_d8

    iget-object v8, p0, Lcom/jcraft/jsch/Session;->c2smac:Lcom/jcraft/jsch/MAC;

    invoke-interface {v8}, Lcom/jcraft/jsch/MAC;->getBlockSize()I

    move-result v8

    :goto_a7
    invoke-virtual {p1, v10, v9, v8}, Lcom/jcraft/jsch/Packet;->shift(III)I

    move-result v4

    .line 1286
    :cond_ab
    iget-object v8, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v8}, Lcom/jcraft/jsch/Buffer;->getCommand()B

    move-result v0

    .line 1287
    invoke-virtual {p2}, Lcom/jcraft/jsch/Channel;->getRecipient()I

    move-result v3

    .line 1288
    int-to-long v8, p3

    sub-long/2addr v8, v1

    long-to-int p3, v8

    .line 1289
    iget-wide v8, p2, Lcom/jcraft/jsch/Channel;->rwsize:J

    sub-long/2addr v8, v1

    iput-wide v8, p2, Lcom/jcraft/jsch/Channel;->rwsize:J

    .line 1290
    const/4 v5, 0x1

    .line 1292
    .end local v1    # "len":J
    :cond_be
    monitor-exit p2
    :try_end_bf
    .catchall {:try_start_80 .. :try_end_bf} :catchall_da

    .line 1293
    if-eqz v5, :cond_c9

    .line 1294
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/Session;->_write(Lcom/jcraft/jsch/Packet;)V

    .line 1295
    if-eqz p3, :cond_54

    .line 1298
    invoke-virtual {p1, v0, v3, v4, p3}, Lcom/jcraft/jsch/Packet;->unshift(BIII)V

    .line 1301
    :cond_c9
    monitor-enter p2

    .line 1302
    :try_start_ca
    iget-boolean v8, p0, Lcom/jcraft/jsch/Session;->in_kex:Z

    if-eqz v8, :cond_dd

    .line 1303
    monitor-exit p2

    goto/16 :goto_5

    .line 1320
    :catchall_d1
    move-exception v8

    monitor-exit p2
    :try_end_d3
    .catchall {:try_start_ca .. :try_end_d3} :catchall_d1

    throw v8

    .line 1282
    .restart local v1    # "len":J
    :cond_d4
    const/16 v8, 0x8

    move v9, v8

    goto :goto_9d

    :cond_d8
    const/4 v8, 0x0

    goto :goto_a7

    .line 1292
    .end local v1    # "len":J
    :catchall_da
    move-exception v8

    :try_start_db
    monitor-exit p2
    :try_end_dc
    .catchall {:try_start_db .. :try_end_dc} :catchall_da

    throw v8

    .line 1305
    :cond_dd
    :try_start_dd
    iget-wide v8, p2, Lcom/jcraft/jsch/Channel;->rwsize:J

    int-to-long v10, p3

    cmp-long v8, v8, v10

    if-ltz v8, :cond_ed

    .line 1306
    iget-wide v8, p2, Lcom/jcraft/jsch/Channel;->rwsize:J

    int-to-long v10, p3

    sub-long/2addr v8, v10

    iput-wide v8, p2, Lcom/jcraft/jsch/Channel;->rwsize:J

    .line 1307
    monitor-exit p2

    goto/16 :goto_51

    .line 1320
    :cond_ed
    monitor-exit p2
    :try_end_ee
    .catchall {:try_start_dd .. :try_end_ee} :catchall_d1

    goto/16 :goto_5
.end method
