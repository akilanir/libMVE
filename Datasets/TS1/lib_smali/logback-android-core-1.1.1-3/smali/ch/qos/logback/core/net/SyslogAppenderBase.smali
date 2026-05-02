.class public abstract Lch/qos/logback/core/net/SyslogAppenderBase;
.super Lch/qos/logback/core/AppenderBase;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lch/qos/logback/core/AppenderBase",
        "<TE;>;"
    }
.end annotation


# static fields
.field static final MAX_MESSAGE_SIZE_LIMIT:I = 0xfde8

.field static final SYSLOG_LAYOUT_URL:Ljava/lang/String; = "http://logback.qos.ch/codes.html#syslog_layout"


# instance fields
.field facilityStr:Ljava/lang/String;

.field initialized:Z

.field layout:Lch/qos/logback/core/Layout;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lch/qos/logback/core/Layout",
            "<TE;>;"
        }
    .end annotation
.end field

.field private lazyInit:Z

.field maxMessageSize:I

.field port:I

.field protected sos:Lch/qos/logback/core/net/SyslogOutputStream;

.field protected suffixPattern:Ljava/lang/String;

.field syslogHost:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 3

    const/4 v1, 0x0

    invoke-direct {p0}, Lch/qos/logback/core/AppenderBase;-><init>()V

    const/16 v0, 0x202

    iput v0, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->port:I

    iput-boolean v1, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->initialized:Z

    iput-boolean v1, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->lazyInit:Z

    return-void
.end method

.method private connect()Z
    .registers 4

    :try_start_0
    new-instance v0, Lch/qos/logback/core/net/SyslogOutputStream;

    iget-object v1, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->syslogHost:Ljava/lang/String;

    iget v2, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->port:I

    invoke-direct {v0, v1, v2}, Lch/qos/logback/core/net/SyslogOutputStream;-><init>(Ljava/lang/String;I)V

    iput-object v0, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->sos:Lch/qos/logback/core/net/SyslogOutputStream;

    iget-object v0, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->sos:Lch/qos/logback/core/net/SyslogOutputStream;

    invoke-virtual {v0}, Lch/qos/logback/core/net/SyslogOutputStream;->getSendBufferSize()I

    move-result v0

    iget v1, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->maxMessageSize:I

    if-nez v1, :cond_42

    const v1, 0xfde8

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->maxMessageSize:I

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Defaulting maxMessageSize to ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->maxMessageSize:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/net/SyslogAppenderBase;->addInfo(Ljava/lang/String;)V
    :try_end_3c
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_3c} :catch_74
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_3c} :catch_7b

    :cond_3c
    :goto_3c
    iget-object v0, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->sos:Lch/qos/logback/core/net/SyslogOutputStream;

    if-eqz v0, :cond_82

    const/4 v0, 0x1

    :goto_41
    return v0

    :cond_42
    :try_start_42
    iget v1, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->maxMessageSize:I

    if-le v1, v0, :cond_3c

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "maxMessageSize of ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->maxMessageSize:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] is larger than the system defined datagram size of ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/net/SyslogAppenderBase;->addWarn(Ljava/lang/String;)V

    const-string v0, "This may result in dropped logs."

    invoke-virtual {p0, v0}, Lch/qos/logback/core/net/SyslogAppenderBase;->addWarn(Ljava/lang/String;)V
    :try_end_73
    .catch Ljava/net/UnknownHostException; {:try_start_42 .. :try_end_73} :catch_74
    .catch Ljava/net/SocketException; {:try_start_42 .. :try_end_73} :catch_7b

    goto :goto_3c

    :catch_74
    move-exception v0

    const-string v1, "Could not create SyslogWriter"

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/core/net/SyslogAppenderBase;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3c

    :catch_7b
    move-exception v0

    const-string v1, "Failed to bind to a random datagram socket. Will try to reconnect later."

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/core/net/SyslogAppenderBase;->addWarn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3c

    :cond_82
    const/4 v0, 0x0

    goto :goto_41
.end method

.method public static facilityStringToint(Ljava/lang/String;)I
    .registers 4

    const-string v0, "KERN"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x0

    :goto_9
    return v0

    :cond_a
    const-string v0, "USER"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_15

    const/16 v0, 0x8

    goto :goto_9

    :cond_15
    const-string v0, "MAIL"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_20

    const/16 v0, 0x10

    goto :goto_9

    :cond_20
    const-string v0, "DAEMON"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2b

    const/16 v0, 0x18

    goto :goto_9

    :cond_2b
    const-string v0, "AUTH"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_36

    const/16 v0, 0x20

    goto :goto_9

    :cond_36
    const-string v0, "SYSLOG"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_41

    const/16 v0, 0x28

    goto :goto_9

    :cond_41
    const-string v0, "LPR"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4c

    const/16 v0, 0x30

    goto :goto_9

    :cond_4c
    const-string v0, "NEWS"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_57

    const/16 v0, 0x38

    goto :goto_9

    :cond_57
    const-string v0, "UUCP"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_62

    const/16 v0, 0x40

    goto :goto_9

    :cond_62
    const-string v0, "CRON"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6d

    const/16 v0, 0x48

    goto :goto_9

    :cond_6d
    const-string v0, "AUTHPRIV"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_78

    const/16 v0, 0x50

    goto :goto_9

    :cond_78
    const-string v0, "FTP"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_83

    const/16 v0, 0x58

    goto :goto_9

    :cond_83
    const-string v0, "NTP"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8f

    const/16 v0, 0x60

    goto/16 :goto_9

    :cond_8f
    const-string v0, "AUDIT"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9b

    const/16 v0, 0x68

    goto/16 :goto_9

    :cond_9b
    const-string v0, "ALERT"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a7

    const/16 v0, 0x70

    goto/16 :goto_9

    :cond_a7
    const-string v0, "CLOCK"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b3

    const/16 v0, 0x78

    goto/16 :goto_9

    :cond_b3
    const-string v0, "LOCAL0"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_bf

    const/16 v0, 0x80

    goto/16 :goto_9

    :cond_bf
    const-string v0, "LOCAL1"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_cb

    const/16 v0, 0x88

    goto/16 :goto_9

    :cond_cb
    const-string v0, "LOCAL2"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d7

    const/16 v0, 0x90

    goto/16 :goto_9

    :cond_d7
    const-string v0, "LOCAL3"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e3

    const/16 v0, 0x98

    goto/16 :goto_9

    :cond_e3
    const-string v0, "LOCAL4"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_ef

    const/16 v0, 0xa0

    goto/16 :goto_9

    :cond_ef
    const-string v0, "LOCAL5"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_fb

    const/16 v0, 0xa8

    goto/16 :goto_9

    :cond_fb
    const-string v0, "LOCAL6"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_107

    const/16 v0, 0xb0

    goto/16 :goto_9

    :cond_107
    const-string v0, "LOCAL7"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_113

    const/16 v0, 0xb8

    goto/16 :goto_9

    :cond_113
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not a valid syslog facility string"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method protected append(Ljava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    invoke-virtual {p0}, Lch/qos/logback/core/net/SyslogAppenderBase;->isStarted()Z

    move-result v0

    if-nez v0, :cond_7

    :cond_6
    :goto_6
    return-void

    :cond_7
    iget-boolean v0, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->initialized:Z

    if-nez v0, :cond_15

    iget-boolean v0, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->lazyInit:Z

    if-eqz v0, :cond_15

    const/4 v0, 0x1

    iput-boolean v0, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->initialized:Z

    invoke-direct {p0}, Lch/qos/logback/core/net/SyslogAppenderBase;->connect()Z

    :cond_15
    iget-object v0, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->sos:Lch/qos/logback/core/net/SyslogOutputStream;

    if-eqz v0, :cond_6

    :try_start_19
    iget-object v0, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->layout:Lch/qos/logback/core/Layout;

    invoke-interface {v0, p1}, Lch/qos/logback/core/Layout;->doLayout(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_6

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    iget v2, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->maxMessageSize:I

    if-le v1, v2, :cond_30

    const/4 v1, 0x0

    iget v2, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->maxMessageSize:I

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_30
    iget-object v1, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->sos:Lch/qos/logback/core/net/SyslogOutputStream;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {v1, v0}, Lch/qos/logback/core/net/SyslogOutputStream;->write([B)V

    iget-object v0, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->sos:Lch/qos/logback/core/net/SyslogOutputStream;

    invoke-virtual {v0}, Lch/qos/logback/core/net/SyslogOutputStream;->flush()V

    iget-object v0, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->sos:Lch/qos/logback/core/net/SyslogOutputStream;

    invoke-virtual {p0, p1, v0}, Lch/qos/logback/core/net/SyslogAppenderBase;->postProcess(Ljava/lang/Object;Ljava/io/OutputStream;)V
    :try_end_43
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_43} :catch_44

    goto :goto_6

    :catch_44
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to send diagram to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->syslogHost:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/core/net/SyslogAppenderBase;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_6
.end method

.method public abstract buildLayout()Lch/qos/logback/core/Layout;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lch/qos/logback/core/Layout",
            "<TE;>;"
        }
    .end annotation
.end method

.method public getFacility()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->facilityStr:Ljava/lang/String;

    return-object v0
.end method

.method public getLayout()Lch/qos/logback/core/Layout;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lch/qos/logback/core/Layout",
            "<TE;>;"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->layout:Lch/qos/logback/core/Layout;

    return-object v0
.end method

.method public getLazy()Z
    .registers 2

    iget-boolean v0, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->lazyInit:Z

    return v0
.end method

.method public getMaxMessageSize()I
    .registers 2

    iget v0, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->maxMessageSize:I

    return v0
.end method

.method public getPort()I
    .registers 2

    iget v0, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->port:I

    return v0
.end method

.method public abstract getSeverityForEvent(Ljava/lang/Object;)I
.end method

.method public getSuffixPattern()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->suffixPattern:Ljava/lang/String;

    return-object v0
.end method

.method public getSyslogHost()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->syslogHost:Ljava/lang/String;

    return-object v0
.end method

.method protected postProcess(Ljava/lang/Object;Ljava/io/OutputStream;)V
    .registers 3

    return-void
.end method

.method public setFacility(Ljava/lang/String;)V
    .registers 2

    if-eqz p1, :cond_6

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    :cond_6
    iput-object p1, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->facilityStr:Ljava/lang/String;

    return-void
.end method

.method public setLayout(Lch/qos/logback/core/Layout;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/Layout",
            "<TE;>;)V"
        }
    .end annotation

    const-string v0, "The layout of a SyslogAppender cannot be set directly. See also http://logback.qos.ch/codes.html#syslog_layout"

    invoke-virtual {p0, v0}, Lch/qos/logback/core/net/SyslogAppenderBase;->addWarn(Ljava/lang/String;)V

    return-void
.end method

.method public setLazy(Z)V
    .registers 2

    iput-boolean p1, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->lazyInit:Z

    return-void
.end method

.method public setMaxMessageSize(I)V
    .registers 2

    iput p1, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->maxMessageSize:I

    return-void
.end method

.method public setPort(I)V
    .registers 2

    iput p1, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->port:I

    return-void
.end method

.method public setSuffixPattern(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->suffixPattern:Ljava/lang/String;

    return-void
.end method

.method public setSyslogHost(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->syslogHost:Ljava/lang/String;

    return-void
.end method

.method public start()V
    .registers 3

    const/4 v0, 0x0

    iget-object v1, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->facilityStr:Ljava/lang/String;

    if-nez v1, :cond_b

    const-string v0, "The Facility option is mandatory"

    invoke-virtual {p0, v0}, Lch/qos/logback/core/net/SyslogAppenderBase;->addError(Ljava/lang/String;)V

    const/4 v0, 0x1

    :cond_b
    iget-boolean v1, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->lazyInit:Z

    if-nez v1, :cond_17

    invoke-direct {p0}, Lch/qos/logback/core/net/SyslogAppenderBase;->connect()Z

    move-result v1

    if-nez v1, :cond_17

    add-int/lit8 v0, v0, 0x1

    :cond_17
    iget-object v1, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->layout:Lch/qos/logback/core/Layout;

    if-nez v1, :cond_21

    invoke-virtual {p0}, Lch/qos/logback/core/net/SyslogAppenderBase;->buildLayout()Lch/qos/logback/core/Layout;

    move-result-object v1

    iput-object v1, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->layout:Lch/qos/logback/core/Layout;

    :cond_21
    if-nez v0, :cond_26

    invoke-super {p0}, Lch/qos/logback/core/AppenderBase;->start()V

    :cond_26
    return-void
.end method

.method public stop()V
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/SyslogAppenderBase;->sos:Lch/qos/logback/core/net/SyslogOutputStream;

    invoke-virtual {v0}, Lch/qos/logback/core/net/SyslogOutputStream;->close()V

    invoke-super {p0}, Lch/qos/logback/core/AppenderBase;->stop()V

    return-void
.end method
