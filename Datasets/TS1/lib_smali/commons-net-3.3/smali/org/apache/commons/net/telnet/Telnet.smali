.class Lorg/apache/commons/net/telnet/Telnet;
.super Lorg/apache/commons/net/SocketClient;
.source "Telnet.java"


# static fields
.field static final DEFAULT_PORT:I = 0x17

.field protected static final TERMINAL_TYPE:I = 0x18

.field protected static final TERMINAL_TYPE_IS:I = 0x0

.field protected static final TERMINAL_TYPE_SEND:I = 0x1

.field static final _COMMAND_AYT:[B

.field static final _COMMAND_DO:[B

.field static final _COMMAND_DONT:[B

.field static final _COMMAND_IS:[B

.field static final _COMMAND_SB:[B

.field static final _COMMAND_SE:[B

.field static final _COMMAND_WILL:[B

.field static final _COMMAND_WONT:[B

.field static final _DO_MASK:I = 0x2

.field static final _REQUESTED_DO_MASK:I = 0x8

.field static final _REQUESTED_WILL_MASK:I = 0x4

.field static final _WILL_MASK:I = 0x1

.field static final debug:Z

.field static final debugoptions:Z


# instance fields
.field private __notifhand:Lorg/apache/commons/net/telnet/TelnetNotificationHandler;

.field _doResponse:[I

.field _options:[I

.field _willResponse:[I

.field private volatile aytFlag:Z

.field private final aytMonitor:Ljava/lang/Object;

.field private final optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

.field private volatile spyStream:Ljava/io/OutputStream;

.field private terminalType:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/4 v1, 0x2

    .line 38
    new-array v0, v1, [B

    fill-array-data v0, :array_3a

    sput-object v0, Lorg/apache/commons/net/telnet/Telnet;->_COMMAND_DO:[B

    .line 42
    new-array v0, v1, [B

    fill-array-data v0, :array_40

    sput-object v0, Lorg/apache/commons/net/telnet/Telnet;->_COMMAND_DONT:[B

    .line 46
    new-array v0, v1, [B

    fill-array-data v0, :array_46

    sput-object v0, Lorg/apache/commons/net/telnet/Telnet;->_COMMAND_WILL:[B

    .line 50
    new-array v0, v1, [B

    fill-array-data v0, :array_4c

    sput-object v0, Lorg/apache/commons/net/telnet/Telnet;->_COMMAND_WONT:[B

    .line 54
    new-array v0, v1, [B

    fill-array-data v0, :array_52

    sput-object v0, Lorg/apache/commons/net/telnet/Telnet;->_COMMAND_SB:[B

    .line 58
    new-array v0, v1, [B

    fill-array-data v0, :array_58

    sput-object v0, Lorg/apache/commons/net/telnet/Telnet;->_COMMAND_SE:[B

    .line 89
    new-array v0, v1, [B

    fill-array-data v0, :array_5e

    sput-object v0, Lorg/apache/commons/net/telnet/Telnet;->_COMMAND_IS:[B

    .line 111
    new-array v0, v1, [B

    fill-array-data v0, :array_64

    sput-object v0, Lorg/apache/commons/net/telnet/Telnet;->_COMMAND_AYT:[B

    return-void

    .line 38
    :array_3a
    .array-data 1
        -0x1t
        -0x3t
    .end array-data

    .line 42
    nop

    :array_40
    .array-data 1
        -0x1t
        -0x2t
    .end array-data

    .line 46
    nop

    :array_46
    .array-data 1
        -0x1t
        -0x5t
    .end array-data

    .line 50
    nop

    :array_4c
    .array-data 1
        -0x1t
        -0x4t
    .end array-data

    .line 54
    nop

    :array_52
    .array-data 1
        -0x1t
        -0x6t
    .end array-data

    .line 58
    nop

    :array_58
    .array-data 1
        -0x1t
        -0x10t
    .end array-data

    .line 89
    nop

    :array_5e
    .array-data 1
        0x18t
        0x0t
    .end array-data

    .line 111
    nop

    :array_64
    .array-data 1
        -0x1t
        -0xat
    .end array-data
.end method

.method constructor <init>()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    const/16 v1, 0x100

    .line 139
    invoke-direct {p0}, Lorg/apache/commons/net/SocketClient;-><init>()V

    .line 96
    iput-object v2, p0, Lorg/apache/commons/net/telnet/Telnet;->terminalType:Ljava/lang/String;

    .line 118
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->aytMonitor:Ljava/lang/Object;

    .line 123
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/net/telnet/Telnet;->aytFlag:Z

    .line 129
    iput-object v2, p0, Lorg/apache/commons/net/telnet/Telnet;->spyStream:Ljava/io/OutputStream;

    .line 134
    iput-object v2, p0, Lorg/apache/commons/net/telnet/Telnet;->__notifhand:Lorg/apache/commons/net/telnet/TelnetNotificationHandler;

    .line 140
    const/16 v0, 0x17

    invoke-virtual {p0, v0}, Lorg/apache/commons/net/telnet/Telnet;->setDefaultPort(I)V

    .line 141
    new-array v0, v1, [I

    iput-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_doResponse:[I

    .line 142
    new-array v0, v1, [I

    iput-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_willResponse:[I

    .line 143
    new-array v0, v1, [I

    iput-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_options:[I

    .line 144
    new-array v0, v1, [Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    iput-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    .line 146
    return-void
.end method

.method constructor <init>(Ljava/lang/String;)V
    .registers 5
    .param p1, "termtype"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    const/16 v1, 0x100

    .line 155
    invoke-direct {p0}, Lorg/apache/commons/net/SocketClient;-><init>()V

    .line 96
    iput-object v2, p0, Lorg/apache/commons/net/telnet/Telnet;->terminalType:Ljava/lang/String;

    .line 118
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->aytMonitor:Ljava/lang/Object;

    .line 123
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/net/telnet/Telnet;->aytFlag:Z

    .line 129
    iput-object v2, p0, Lorg/apache/commons/net/telnet/Telnet;->spyStream:Ljava/io/OutputStream;

    .line 134
    iput-object v2, p0, Lorg/apache/commons/net/telnet/Telnet;->__notifhand:Lorg/apache/commons/net/telnet/TelnetNotificationHandler;

    .line 156
    const/16 v0, 0x17

    invoke-virtual {p0, v0}, Lorg/apache/commons/net/telnet/Telnet;->setDefaultPort(I)V

    .line 157
    new-array v0, v1, [I

    iput-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_doResponse:[I

    .line 158
    new-array v0, v1, [I

    iput-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_willResponse:[I

    .line 159
    new-array v0, v1, [I

    iput-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_options:[I

    .line 160
    iput-object p1, p0, Lorg/apache/commons/net/telnet/Telnet;->terminalType:Ljava/lang/String;

    .line 161
    new-array v0, v1, [Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    iput-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    .line 163
    return-void
.end method


# virtual methods
.method protected _connectAction_()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x100

    const/4 v2, 0x0

    .line 835
    const/4 v0, 0x0

    .local v0, "ii":I
    :goto_4
    if-ge v0, v3, :cond_29

    .line 837
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->_doResponse:[I

    aput v2, v1, v0

    .line 838
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->_willResponse:[I

    aput v2, v1, v0

    .line 839
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->_options:[I

    aput v2, v1, v0

    .line 840
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v1, v1, v0

    if-eqz v1, :cond_26

    .line 842
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v1, v1, v0

    invoke-virtual {v1, v2}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->setDo(Z)V

    .line 843
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v1, v1, v0

    invoke-virtual {v1, v2}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->setWill(Z)V

    .line 835
    :cond_26
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 848
    :cond_29
    invoke-super {p0}, Lorg/apache/commons/net/SocketClient;->_connectAction_()V

    .line 849
    new-instance v1, Ljava/io/BufferedInputStream;

    iget-object v2, p0, Lorg/apache/commons/net/telnet/Telnet;->_input_:Ljava/io/InputStream;

    invoke-direct {v1, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->_input_:Ljava/io/InputStream;

    .line 850
    new-instance v1, Ljava/io/BufferedOutputStream;

    iget-object v2, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-direct {v1, v2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    .line 853
    const/4 v0, 0x0

    :goto_3f
    if-ge v0, v3, :cond_74

    .line 855
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v1, v1, v0

    if-eqz v1, :cond_71

    .line 857
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->getInitLocal()Z

    move-result v1

    if-eqz v1, :cond_5c

    .line 859
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->getOptionCode()I

    move-result v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/net/telnet/Telnet;->_requestWill(I)V

    .line 862
    :cond_5c
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->getInitRemote()Z

    move-result v1

    if-eqz v1, :cond_71

    .line 864
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->getOptionCode()I

    move-result v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/net/telnet/Telnet;->_requestDo(I)V

    .line 853
    :cond_71
    add-int/lit8 v0, v0, 0x1

    goto :goto_3f

    .line 869
    :cond_74
    return-void
.end method

.method final declared-synchronized _processAYTResponse()V
    .registers 3

    .prologue
    .line 815
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lorg/apache/commons/net/telnet/Telnet;->aytFlag:Z

    if-nez v0, :cond_11

    .line 817
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->aytMonitor:Ljava/lang/Object;

    monitor-enter v1
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_16

    .line 819
    const/4 v0, 0x1

    :try_start_9
    iput-boolean v0, p0, Lorg/apache/commons/net/telnet/Telnet;->aytFlag:Z

    .line 820
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->aytMonitor:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 821
    monitor-exit v1
    :try_end_11
    .catchall {:try_start_9 .. :try_end_11} :catchall_13

    .line 823
    :cond_11
    monitor-exit p0

    return-void

    .line 821
    :catchall_13
    move-exception v0

    :try_start_14
    monitor-exit v1
    :try_end_15
    .catchall {:try_start_14 .. :try_end_15} :catchall_13

    :try_start_15
    throw v0
    :try_end_16
    .catchall {:try_start_15 .. :try_end_16} :catchall_16

    .line 815
    :catchall_16
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method _processCommand(I)V
    .registers 4
    .param p1, "command"    # I

    .prologue
    .line 406
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->__notifhand:Lorg/apache/commons/net/telnet/TelnetNotificationHandler;

    if-eqz v0, :cond_a

    .line 408
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->__notifhand:Lorg/apache/commons/net/telnet/TelnetNotificationHandler;

    const/4 v1, 0x5

    invoke-interface {v0, v1, p1}, Lorg/apache/commons/net/telnet/TelnetNotificationHandler;->receivedNegotiation(II)V

    .line 411
    :cond_a
    return-void
.end method

.method _processDo(I)V
    .registers 5
    .param p1, "option"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 427
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->__notifhand:Lorg/apache/commons/net/telnet/TelnetNotificationHandler;

    if-eqz v1, :cond_a

    .line 429
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->__notifhand:Lorg/apache/commons/net/telnet/TelnetNotificationHandler;

    const/4 v2, 0x1

    invoke-interface {v1, v2, p1}, Lorg/apache/commons/net/telnet/TelnetNotificationHandler;->receivedNegotiation(II)V

    .line 434
    :cond_a
    const/4 v0, 0x0

    .line 438
    .local v0, "acceptNewState":Z
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v1, v1, p1

    if-eqz v1, :cond_53

    .line 440
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v1, v1, p1

    invoke-virtual {v1}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->getAcceptLocal()Z

    move-result v0

    .line 458
    :cond_19
    :goto_19
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->_willResponse:[I

    aget v1, v1, p1

    if-lez v1, :cond_3b

    .line 460
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->_willResponse:[I

    aget v2, v1, p1

    add-int/lit8 v2, v2, -0x1

    aput v2, v1, p1

    .line 461
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->_willResponse:[I

    aget v1, v1, p1

    if-lez v1, :cond_3b

    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_stateIsWill(I)Z

    move-result v1

    if-eqz v1, :cond_3b

    .line 463
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->_willResponse:[I

    aget v2, v1, p1

    add-int/lit8 v2, v2, -0x1

    aput v2, v1, p1

    .line 467
    :cond_3b
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->_willResponse:[I

    aget v1, v1, p1

    if-nez v1, :cond_4f

    .line 469
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_requestedWont(I)Z

    move-result v1

    if-eqz v1, :cond_4f

    .line 481
    if-eqz v0, :cond_65

    .line 483
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_setWantWill(I)V

    .line 484
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_sendWill(I)V

    .line 507
    :cond_4f
    :goto_4f
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_setWill(I)V

    .line 508
    return-void

    .line 446
    :cond_53
    const/16 v1, 0x18

    if-ne p1, v1, :cond_19

    .line 448
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->terminalType:Ljava/lang/String;

    if-eqz v1, :cond_19

    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->terminalType:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_19

    .line 450
    const/4 v0, 0x1

    goto :goto_19

    .line 488
    :cond_65
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->_willResponse:[I

    aget v2, v1, p1

    add-int/lit8 v2, v2, 0x1

    aput v2, v1, p1

    .line 489
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_sendWont(I)V

    goto :goto_4f
.end method

.method _processDont(I)V
    .registers 4
    .param p1, "option"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 523
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->__notifhand:Lorg/apache/commons/net/telnet/TelnetNotificationHandler;

    if-eqz v0, :cond_a

    .line 525
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->__notifhand:Lorg/apache/commons/net/telnet/TelnetNotificationHandler;

    const/4 v1, 0x2

    invoke-interface {v0, v1, p1}, Lorg/apache/commons/net/telnet/TelnetNotificationHandler;->receivedNegotiation(II)V

    .line 529
    :cond_a
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_willResponse:[I

    aget v0, v0, p1

    if-lez v0, :cond_2c

    .line 531
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_willResponse:[I

    aget v1, v0, p1

    add-int/lit8 v1, v1, -0x1

    aput v1, v0, p1

    .line 532
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_willResponse:[I

    aget v0, v0, p1

    if-lez v0, :cond_2c

    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_stateIsWont(I)Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 534
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_willResponse:[I

    aget v1, v0, p1

    add-int/lit8 v1, v1, -0x1

    aput v1, v0, p1

    .line 538
    :cond_2c
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_willResponse:[I

    aget v0, v0, p1

    if-nez v0, :cond_4a

    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_requestedWill(I)Z

    move-result v0

    if-eqz v0, :cond_4a

    .line 550
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_stateIsWill(I)Z

    move-result v0

    if-nez v0, :cond_44

    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_requestedWill(I)Z

    move-result v0

    if-eqz v0, :cond_47

    .line 552
    :cond_44
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_sendWont(I)V

    .line 555
    :cond_47
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_setWantWont(I)V

    .line 559
    :cond_4a
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_setWont(I)V

    .line 560
    return-void
.end method

.method _processSuboption([II)V
    .registers 8
    .param p1, "suboption"    # [I
    .param p2, "suboptionLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 700
    if-lez p2, :cond_19

    .line 702
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget v2, p1, v3

    aget-object v1, v1, v2

    if-eqz v1, :cond_1a

    .line 704
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget v2, p1, v3

    aget-object v1, v1, v2

    invoke-virtual {v1, p1, p2}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->answerSubnegotiation([II)[I

    move-result-object v0

    .line 707
    .local v0, "responseSuboption":[I
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/telnet/Telnet;->_sendSubnegotiation([I)V

    .line 730
    .end local v0    # "responseSuboption":[I
    :cond_19
    :goto_19
    return-void

    .line 711
    :cond_1a
    if-le p2, v4, :cond_19

    .line 721
    aget v1, p1, v3

    const/16 v2, 0x18

    if-ne v1, v2, :cond_19

    aget v1, p1, v4

    if-ne v1, v4, :cond_19

    .line 724
    invoke-virtual {p0}, Lorg/apache/commons/net/telnet/Telnet;->_sendTerminalType()V

    goto :goto_19
.end method

.method _processWill(I)V
    .registers 5
    .param p1, "option"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 577
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->__notifhand:Lorg/apache/commons/net/telnet/TelnetNotificationHandler;

    if-eqz v1, :cond_a

    .line 579
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->__notifhand:Lorg/apache/commons/net/telnet/TelnetNotificationHandler;

    const/4 v2, 0x3

    invoke-interface {v1, v2, p1}, Lorg/apache/commons/net/telnet/TelnetNotificationHandler;->receivedNegotiation(II)V

    .line 584
    :cond_a
    const/4 v0, 0x0

    .line 587
    .local v0, "acceptNewState":Z
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v1, v1, p1

    if-eqz v1, :cond_19

    .line 589
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v1, v1, p1

    invoke-virtual {v1}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->getAcceptRemote()Z

    move-result v0

    .line 593
    :cond_19
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->_doResponse:[I

    aget v1, v1, p1

    if-lez v1, :cond_3b

    .line 595
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->_doResponse:[I

    aget v2, v1, p1

    add-int/lit8 v2, v2, -0x1

    aput v2, v1, p1

    .line 596
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->_doResponse:[I

    aget v1, v1, p1

    if-lez v1, :cond_3b

    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_stateIsDo(I)Z

    move-result v1

    if-eqz v1, :cond_3b

    .line 598
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->_doResponse:[I

    aget v2, v1, p1

    add-int/lit8 v2, v2, -0x1

    aput v2, v1, p1

    .line 602
    :cond_3b
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->_doResponse:[I

    aget v1, v1, p1

    if-nez v1, :cond_4f

    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_requestedDont(I)Z

    move-result v1

    if-eqz v1, :cond_4f

    .line 614
    if-eqz v0, :cond_53

    .line 616
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_setWantDo(I)V

    .line 617
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_sendDo(I)V

    .line 626
    :cond_4f
    :goto_4f
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_setDo(I)V

    .line 627
    return-void

    .line 621
    :cond_53
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->_doResponse:[I

    aget v2, v1, p1

    add-int/lit8 v2, v2, 0x1

    aput v2, v1, p1

    .line 622
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_sendDont(I)V

    goto :goto_4f
.end method

.method _processWont(I)V
    .registers 4
    .param p1, "option"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 643
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->__notifhand:Lorg/apache/commons/net/telnet/TelnetNotificationHandler;

    if-eqz v0, :cond_a

    .line 645
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->__notifhand:Lorg/apache/commons/net/telnet/TelnetNotificationHandler;

    const/4 v1, 0x4

    invoke-interface {v0, v1, p1}, Lorg/apache/commons/net/telnet/TelnetNotificationHandler;->receivedNegotiation(II)V

    .line 650
    :cond_a
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_doResponse:[I

    aget v0, v0, p1

    if-lez v0, :cond_2c

    .line 652
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_doResponse:[I

    aget v1, v0, p1

    add-int/lit8 v1, v1, -0x1

    aput v1, v0, p1

    .line 653
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_doResponse:[I

    aget v0, v0, p1

    if-lez v0, :cond_2c

    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_stateIsDont(I)Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 655
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_doResponse:[I

    aget v1, v0, p1

    add-int/lit8 v1, v1, -0x1

    aput v1, v0, p1

    .line 659
    :cond_2c
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_doResponse:[I

    aget v0, v0, p1

    if-nez v0, :cond_4a

    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_requestedDo(I)Z

    move-result v0

    if-eqz v0, :cond_4a

    .line 671
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_stateIsDo(I)Z

    move-result v0

    if-nez v0, :cond_44

    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_requestedDo(I)Z

    move-result v0

    if-eqz v0, :cond_47

    .line 673
    :cond_44
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_sendDont(I)V

    .line 676
    :cond_47
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_setWantDont(I)V

    .line 680
    :cond_4a
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_setDont(I)V

    .line 681
    return-void
.end method

.method _registerSpyStream(Ljava/io/OutputStream;)V
    .registers 2
    .param p1, "spystream"    # Ljava/io/OutputStream;

    .prologue
    .line 1182
    iput-object p1, p0, Lorg/apache/commons/net/telnet/Telnet;->spyStream:Ljava/io/OutputStream;

    .line 1183
    return-void
.end method

.method final declared-synchronized _requestDo(I)V
    .registers 4
    .param p1, "option"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 901
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_doResponse:[I

    aget v0, v0, p1

    if-nez v0, :cond_d

    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_stateIsDo(I)Z

    move-result v0

    if-nez v0, :cond_13

    :cond_d
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_requestedDo(I)Z
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_24

    move-result v0

    if-eqz v0, :cond_15

    .line 909
    :cond_13
    :goto_13
    monitor-exit p0

    return-void

    .line 906
    :cond_15
    :try_start_15
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_setWantDo(I)V

    .line 907
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_doResponse:[I

    aget v1, v0, p1

    add-int/lit8 v1, v1, 0x1

    aput v1, v0, p1

    .line 908
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_sendDo(I)V
    :try_end_23
    .catchall {:try_start_15 .. :try_end_23} :catchall_24

    goto :goto_13

    .line 901
    :catchall_24
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized _requestDont(I)V
    .registers 4
    .param p1, "option"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 941
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_doResponse:[I

    aget v0, v0, p1

    if-nez v0, :cond_d

    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_stateIsDont(I)Z

    move-result v0

    if-nez v0, :cond_13

    :cond_d
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_requestedDont(I)Z
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_24

    move-result v0

    if-eqz v0, :cond_15

    .line 949
    :cond_13
    :goto_13
    monitor-exit p0

    return-void

    .line 946
    :cond_15
    :try_start_15
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_setWantDont(I)V

    .line 947
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_doResponse:[I

    aget v1, v0, p1

    add-int/lit8 v1, v1, 0x1

    aput v1, v0, p1

    .line 948
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_sendDont(I)V
    :try_end_23
    .catchall {:try_start_15 .. :try_end_23} :catchall_24

    goto :goto_13

    .line 941
    :catchall_24
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized _requestWill(I)V
    .registers 4
    .param p1, "option"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 982
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_willResponse:[I

    aget v0, v0, p1

    if-nez v0, :cond_d

    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_stateIsWill(I)Z

    move-result v0

    if-nez v0, :cond_13

    :cond_d
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_requestedWill(I)Z
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_24

    move-result v0

    if-eqz v0, :cond_15

    .line 990
    :cond_13
    :goto_13
    monitor-exit p0

    return-void

    .line 987
    :cond_15
    :try_start_15
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_setWantWill(I)V

    .line 988
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_doResponse:[I

    aget v1, v0, p1

    add-int/lit8 v1, v1, 0x1

    aput v1, v0, p1

    .line 989
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_sendWill(I)V
    :try_end_23
    .catchall {:try_start_15 .. :try_end_23} :catchall_24

    goto :goto_13

    .line 982
    :catchall_24
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized _requestWont(I)V
    .registers 4
    .param p1, "option"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1022
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_willResponse:[I

    aget v0, v0, p1

    if-nez v0, :cond_d

    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_stateIsWont(I)Z

    move-result v0

    if-nez v0, :cond_13

    :cond_d
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_requestedWont(I)Z
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_24

    move-result v0

    if-eqz v0, :cond_15

    .line 1030
    :cond_13
    :goto_13
    monitor-exit p0

    return-void

    .line 1027
    :cond_15
    :try_start_15
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_setWantWont(I)V

    .line 1028
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_doResponse:[I

    aget v1, v0, p1

    add-int/lit8 v1, v1, 0x1

    aput v1, v0, p1

    .line 1029
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_sendWont(I)V
    :try_end_23
    .catchall {:try_start_15 .. :try_end_23} :catchall_24

    goto :goto_13

    .line 1022
    :catchall_24
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method _requestedDo(I)Z
    .registers 3
    .param p1, "option"    # I

    .prologue
    .line 247
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_options:[I

    aget v0, v0, p1

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method _requestedDont(I)Z
    .registers 3
    .param p1, "option"    # I

    .prologue
    .line 259
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_requestedDo(I)Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method _requestedWill(I)Z
    .registers 3
    .param p1, "option"    # I

    .prologue
    .line 223
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_options:[I

    aget v0, v0, p1

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method _requestedWont(I)Z
    .registers 3
    .param p1, "option"    # I

    .prologue
    .line 235
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_requestedWill(I)Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method final _sendAYT(J)Z
    .registers 7
    .param p1, "timeout"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 1062
    const/4 v0, 0x0

    .line 1063
    .local v0, "retValue":Z
    iget-object v2, p0, Lorg/apache/commons/net/telnet/Telnet;->aytMonitor:Ljava/lang/Object;

    monitor-enter v2

    .line 1065
    :try_start_4
    monitor-enter p0
    :try_end_5
    .catchall {:try_start_4 .. :try_end_5} :catchall_27

    .line 1067
    const/4 v1, 0x0

    :try_start_6
    iput-boolean v1, p0, Lorg/apache/commons/net/telnet/Telnet;->aytFlag:Z

    .line 1068
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    sget-object v3, Lorg/apache/commons/net/telnet/Telnet;->_COMMAND_AYT:[B

    invoke-virtual {v1, v3}, Ljava/io/OutputStream;->write([B)V

    .line 1069
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V

    .line 1070
    monitor-exit p0
    :try_end_15
    .catchall {:try_start_6 .. :try_end_15} :catchall_24

    .line 1071
    :try_start_15
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->aytMonitor:Ljava/lang/Object;

    invoke-virtual {v1, p1, p2}, Ljava/lang/Object;->wait(J)V

    .line 1072
    iget-boolean v1, p0, Lorg/apache/commons/net/telnet/Telnet;->aytFlag:Z

    if-nez v1, :cond_2a

    .line 1074
    const/4 v0, 0x0

    .line 1075
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/apache/commons/net/telnet/Telnet;->aytFlag:Z

    .line 1081
    :goto_22
    monitor-exit v2
    :try_end_23
    .catchall {:try_start_15 .. :try_end_23} :catchall_27

    .line 1083
    return v0

    .line 1070
    :catchall_24
    move-exception v1

    :try_start_25
    monitor-exit p0
    :try_end_26
    .catchall {:try_start_25 .. :try_end_26} :catchall_24

    :try_start_26
    throw v1

    .line 1081
    :catchall_27
    move-exception v1

    monitor-exit v2
    :try_end_29
    .catchall {:try_start_26 .. :try_end_29} :catchall_27

    throw v1

    .line 1079
    :cond_2a
    const/4 v0, 0x1

    goto :goto_22
.end method

.method final declared-synchronized _sendByte(I)V
    .registers 3
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1041
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 1044
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_spyWrite(I)V
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_b

    .line 1047
    monitor-exit p0

    return-void

    .line 1041
    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized _sendCommand(B)V
    .registers 4
    .param p1, "cmd"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 804
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    const/16 v1, 0xff

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 805
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 806
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V
    :try_end_12
    .catchall {:try_start_1 .. :try_end_12} :catchall_14

    .line 807
    monitor-exit p0

    return-void

    .line 804
    :catchall_14
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized _sendDo(I)V
    .registers 4
    .param p1, "option"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 884
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    sget-object v1, Lorg/apache/commons/net/telnet/Telnet;->_COMMAND_DO:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 885
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 888
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V
    :try_end_12
    .catchall {:try_start_1 .. :try_end_12} :catchall_14

    .line 890
    monitor-exit p0

    return-void

    .line 884
    :catchall_14
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized _sendDont(I)V
    .registers 4
    .param p1, "option"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 924
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    sget-object v1, Lorg/apache/commons/net/telnet/Telnet;->_COMMAND_DONT:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 925
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 928
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V
    :try_end_12
    .catchall {:try_start_1 .. :try_end_12} :catchall_14

    .line 930
    monitor-exit p0

    return-void

    .line 924
    :catchall_14
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized _sendSubnegotiation([I)V
    .registers 9
    .param p1, "subn"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 774
    monitor-enter p0

    if-eqz p1, :cond_2e

    .line 776
    :try_start_3
    iget-object v5, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    sget-object v6, Lorg/apache/commons/net/telnet/Telnet;->_COMMAND_SB:[B

    invoke-virtual {v5, v6}, Ljava/io/OutputStream;->write([B)V

    .line 778
    move-object v0, p1

    .local v0, "arr$":[I
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_d
    if-ge v3, v4, :cond_22

    aget v2, v0, v3

    .line 780
    .local v2, "element":I
    int-to-byte v1, v2

    .line 781
    .local v1, "b":B
    const/4 v5, -0x1

    if-ne v1, v5, :cond_1a

    .line 782
    iget-object v5, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v5, v1}, Ljava/io/OutputStream;->write(I)V

    .line 784
    :cond_1a
    iget-object v5, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v5, v1}, Ljava/io/OutputStream;->write(I)V

    .line 778
    add-int/lit8 v3, v3, 0x1

    goto :goto_d

    .line 786
    .end local v1    # "b":B
    .end local v2    # "element":I
    :cond_22
    iget-object v5, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    sget-object v6, Lorg/apache/commons/net/telnet/Telnet;->_COMMAND_SE:[B

    invoke-virtual {v5, v6}, Ljava/io/OutputStream;->write([B)V

    .line 789
    iget-object v5, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v5}, Ljava/io/OutputStream;->flush()V
    :try_end_2e
    .catchall {:try_start_3 .. :try_end_2e} :catchall_30

    .line 792
    .end local v0    # "arr$":[I
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    :cond_2e
    monitor-exit p0

    return-void

    .line 774
    :catchall_30
    move-exception v5

    monitor-exit p0

    throw v5
.end method

.method final declared-synchronized _sendTerminalType()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 744
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->terminalType:Ljava/lang/String;

    if-eqz v0, :cond_2e

    .line 746
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    sget-object v1, Lorg/apache/commons/net/telnet/Telnet;->_COMMAND_SB:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 747
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    sget-object v1, Lorg/apache/commons/net/telnet/Telnet;->_COMMAND_IS:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 748
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->terminalType:Ljava/lang/String;

    invoke-virtual {p0}, Lorg/apache/commons/net/telnet/Telnet;->getCharsetName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 749
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    sget-object v1, Lorg/apache/commons/net/telnet/Telnet;->_COMMAND_SE:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 750
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V
    :try_end_2e
    .catchall {:try_start_1 .. :try_end_2e} :catchall_30

    .line 752
    :cond_2e
    monitor-exit p0

    return-void

    .line 744
    :catchall_30
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized _sendWill(I)V
    .registers 4
    .param p1, "option"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 965
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    sget-object v1, Lorg/apache/commons/net/telnet/Telnet;->_COMMAND_WILL:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 966
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 969
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V
    :try_end_12
    .catchall {:try_start_1 .. :try_end_12} :catchall_14

    .line 971
    monitor-exit p0

    return-void

    .line 965
    :catchall_14
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized _sendWont(I)V
    .registers 4
    .param p1, "option"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1005
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    sget-object v1, Lorg/apache/commons/net/telnet/Telnet;->_COMMAND_WONT:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 1006
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 1009
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V
    :try_end_12
    .catchall {:try_start_1 .. :try_end_12} :catchall_14

    .line 1011
    monitor-exit p0

    return-void

    .line 1005
    :catchall_14
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method _setDo(I)V
    .registers 5
    .param p1, "option"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 299
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->_options:[I

    aget v2, v1, p1

    or-int/lit8 v2, v2, 0x2

    aput v2, v1, p1

    .line 302
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_requestedDo(I)Z

    move-result v1

    if-eqz v1, :cond_29

    .line 304
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v1, v1, p1

    if-eqz v1, :cond_29

    .line 306
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v1, v1, p1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->setDo(Z)V

    .line 308
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v1, v1, p1

    invoke-virtual {v1}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->startSubnegotiationRemote()[I

    move-result-object v0

    .line 311
    .local v0, "subneg":[I
    if-eqz v0, :cond_29

    .line 313
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/telnet/Telnet;->_sendSubnegotiation([I)V

    .line 318
    .end local v0    # "subneg":[I
    :cond_29
    return-void
.end method

.method _setDont(I)V
    .registers 4
    .param p1, "option"    # I

    .prologue
    .line 364
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_options:[I

    aget v1, v0, p1

    and-int/lit8 v1, v1, -0x3

    aput v1, v0, p1

    .line 367
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v0, v0, p1

    if-eqz v0, :cond_16

    .line 369
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v0, v0, p1

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->setDo(Z)V

    .line 372
    :cond_16
    return-void
.end method

.method _setWantDo(I)V
    .registers 4
    .param p1, "option"    # I

    .prologue
    .line 337
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_options:[I

    aget v1, v0, p1

    or-int/lit8 v1, v1, 0x8

    aput v1, v0, p1

    .line 338
    return-void
.end method

.method _setWantDont(I)V
    .registers 4
    .param p1, "option"    # I

    .prologue
    .line 391
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_options:[I

    aget v1, v0, p1

    and-int/lit8 v1, v1, -0x9

    aput v1, v0, p1

    .line 392
    return-void
.end method

.method _setWantWill(I)V
    .registers 4
    .param p1, "option"    # I

    .prologue
    .line 327
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_options:[I

    aget v1, v0, p1

    or-int/lit8 v1, v1, 0x4

    aput v1, v0, p1

    .line 328
    return-void
.end method

.method _setWantWont(I)V
    .registers 4
    .param p1, "option"    # I

    .prologue
    .line 381
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_options:[I

    aget v1, v0, p1

    and-int/lit8 v1, v1, -0x5

    aput v1, v0, p1

    .line 382
    return-void
.end method

.method _setWill(I)V
    .registers 5
    .param p1, "option"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 270
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->_options:[I

    aget v2, v1, p1

    or-int/lit8 v2, v2, 0x1

    aput v2, v1, p1

    .line 273
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_requestedWill(I)Z

    move-result v1

    if-eqz v1, :cond_29

    .line 275
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v1, v1, p1

    if-eqz v1, :cond_29

    .line 277
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v1, v1, p1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->setWill(Z)V

    .line 279
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v1, v1, p1

    invoke-virtual {v1}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->startSubnegotiationLocal()[I

    move-result-object v0

    .line 282
    .local v0, "subneg":[I
    if-eqz v0, :cond_29

    .line 284
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/telnet/Telnet;->_sendSubnegotiation([I)V

    .line 289
    .end local v0    # "subneg":[I
    :cond_29
    return-void
.end method

.method _setWont(I)V
    .registers 4
    .param p1, "option"    # I

    .prologue
    .line 347
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_options:[I

    aget v1, v0, p1

    and-int/lit8 v1, v1, -0x2

    aput v1, v0, p1

    .line 350
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v0, v0, p1

    if-eqz v0, :cond_16

    .line 352
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v0, v0, p1

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->setWill(Z)V

    .line 355
    :cond_16
    return-void
.end method

.method _spyRead(I)V
    .registers 5
    .param p1, "ch"    # I

    .prologue
    const/16 v2, 0xd

    .line 1201
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->spyStream:Ljava/io/OutputStream;

    .line 1202
    .local v1, "spy":Ljava/io/OutputStream;
    if-eqz v1, :cond_17

    .line 1206
    if-eq p1, v2, :cond_17

    .line 1208
    :try_start_8
    invoke-virtual {v1, p1}, Ljava/io/OutputStream;->write(I)V

    .line 1209
    const/16 v2, 0xa

    if-ne p1, v2, :cond_14

    .line 1211
    const/16 v2, 0xd

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write(I)V

    .line 1213
    :cond_14
    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V
    :try_end_17
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_17} :catch_18

    .line 1221
    :cond_17
    :goto_17
    return-void

    .line 1216
    :catch_18
    move-exception v0

    .line 1218
    .local v0, "e":Ljava/io/IOException;
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/apache/commons/net/telnet/Telnet;->spyStream:Ljava/io/OutputStream;

    goto :goto_17
.end method

.method _spyWrite(I)V
    .registers 6
    .param p1, "ch"    # I

    .prologue
    const/4 v3, 0x1

    .line 1230
    invoke-virtual {p0, v3}, Lorg/apache/commons/net/telnet/Telnet;->_stateIsDo(I)Z

    move-result v2

    if-eqz v2, :cond_d

    invoke-virtual {p0, v3}, Lorg/apache/commons/net/telnet/Telnet;->_requestedDo(I)Z

    move-result v2

    if-nez v2, :cond_17

    .line 1233
    :cond_d
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->spyStream:Ljava/io/OutputStream;

    .line 1234
    .local v1, "spy":Ljava/io/OutputStream;
    if-eqz v1, :cond_17

    .line 1238
    :try_start_11
    invoke-virtual {v1, p1}, Ljava/io/OutputStream;->write(I)V

    .line 1239
    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V
    :try_end_17
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_17} :catch_18

    .line 1247
    .end local v1    # "spy":Ljava/io/OutputStream;
    :cond_17
    :goto_17
    return-void

    .line 1241
    .restart local v1    # "spy":Ljava/io/OutputStream;
    :catch_18
    move-exception v0

    .line 1243
    .local v0, "e":Ljava/io/IOException;
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/apache/commons/net/telnet/Telnet;->spyStream:Ljava/io/OutputStream;

    goto :goto_17
.end method

.method _stateIsDo(I)Z
    .registers 3
    .param p1, "option"    # I

    .prologue
    .line 199
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_options:[I

    aget v0, v0, p1

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method _stateIsDont(I)Z
    .registers 3
    .param p1, "option"    # I

    .prologue
    .line 211
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_stateIsDo(I)Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method _stateIsWill(I)Z
    .registers 3
    .param p1, "option"    # I

    .prologue
    .line 175
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_options:[I

    aget v0, v0, p1

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method _stateIsWont(I)Z
    .registers 3
    .param p1, "option"    # I

    .prologue
    .line 187
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_stateIsWill(I)Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method _stopSpyStream()V
    .registers 2

    .prologue
    .line 1191
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->spyStream:Ljava/io/OutputStream;

    .line 1192
    return-void
.end method

.method addOptionHandler(Lorg/apache/commons/net/telnet/TelnetOptionHandler;)V
    .registers 5
    .param p1, "opthand"    # Lorg/apache/commons/net/telnet/TelnetOptionHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/net/telnet/InvalidTelnetOptionException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1099
    invoke-virtual {p1}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->getOptionCode()I

    move-result v0

    .line 1100
    .local v0, "optcode":I
    invoke-static {v0}, Lorg/apache/commons/net/telnet/TelnetOption;->isValidOption(I)Z

    move-result v1

    if-eqz v1, :cond_35

    .line 1102
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v1, v1, v0

    if-nez v1, :cond_2d

    .line 1104
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aput-object p1, v1, v0

    .line 1105
    invoke-virtual {p0}, Lorg/apache/commons/net/telnet/Telnet;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_2c

    .line 1107
    invoke-virtual {p1}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->getInitLocal()Z

    move-result v1

    if-eqz v1, :cond_23

    .line 1109
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/telnet/Telnet;->_requestWill(I)V

    .line 1112
    :cond_23
    invoke-virtual {p1}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->getInitRemote()Z

    move-result v1

    if-eqz v1, :cond_2c

    .line 1114
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/telnet/Telnet;->_requestDo(I)V

    .line 1129
    :cond_2c
    return-void

    .line 1120
    :cond_2d
    new-instance v1, Lorg/apache/commons/net/telnet/InvalidTelnetOptionException;

    const-string v2, "Already registered option"

    invoke-direct {v1, v2, v0}, Lorg/apache/commons/net/telnet/InvalidTelnetOptionException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 1126
    :cond_35
    new-instance v1, Lorg/apache/commons/net/telnet/InvalidTelnetOptionException;

    const-string v2, "Invalid Option Code"

    invoke-direct {v1, v2, v0}, Lorg/apache/commons/net/telnet/InvalidTelnetOptionException;-><init>(Ljava/lang/String;I)V

    throw v1
.end method

.method deleteOptionHandler(I)V
    .registers 5
    .param p1, "optcode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/net/telnet/InvalidTelnetOptionException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1141
    invoke-static {p1}, Lorg/apache/commons/net/telnet/TelnetOption;->isValidOption(I)Z

    move-result v1

    if-eqz v1, :cond_30

    .line 1143
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v1, v1, p1

    if-nez v1, :cond_14

    .line 1145
    new-instance v1, Lorg/apache/commons/net/telnet/InvalidTelnetOptionException;

    const-string v2, "Unregistered option"

    invoke-direct {v1, v2, p1}, Lorg/apache/commons/net/telnet/InvalidTelnetOptionException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 1150
    :cond_14
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v0, v1, p1

    .line 1151
    .local v0, "opthand":Lorg/apache/commons/net/telnet/TelnetOptionHandler;
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    const/4 v2, 0x0

    aput-object v2, v1, p1

    .line 1153
    invoke-virtual {v0}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->getWill()Z

    move-result v1

    if-eqz v1, :cond_26

    .line 1155
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_requestWont(I)V

    .line 1158
    :cond_26
    invoke-virtual {v0}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->getDo()Z

    move-result v1

    if-eqz v1, :cond_2f

    .line 1160
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_requestDont(I)V

    .line 1169
    :cond_2f
    return-void

    .line 1166
    .end local v0    # "opthand":Lorg/apache/commons/net/telnet/TelnetOptionHandler;
    :cond_30
    new-instance v1, Lorg/apache/commons/net/telnet/InvalidTelnetOptionException;

    const-string v2, "Invalid Option Code"

    invoke-direct {v1, v2, p1}, Lorg/apache/commons/net/telnet/InvalidTelnetOptionException;-><init>(Ljava/lang/String;I)V

    throw v1
.end method

.method public registerNotifHandler(Lorg/apache/commons/net/telnet/TelnetNotificationHandler;)V
    .registers 2
    .param p1, "notifhand"    # Lorg/apache/commons/net/telnet/TelnetNotificationHandler;

    .prologue
    .line 1258
    iput-object p1, p0, Lorg/apache/commons/net/telnet/Telnet;->__notifhand:Lorg/apache/commons/net/telnet/TelnetNotificationHandler;

    .line 1259
    return-void
.end method

.method public unregisterNotifHandler()V
    .registers 2

    .prologue
    .line 1267
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->__notifhand:Lorg/apache/commons/net/telnet/TelnetNotificationHandler;

    .line 1268
    return-void
.end method
