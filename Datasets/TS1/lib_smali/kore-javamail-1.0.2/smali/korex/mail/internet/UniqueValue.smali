.class Lkorex/mail/internet/UniqueValue;
.super Ljava/lang/Object;
.source "UniqueValue.java"


# static fields
.field private static id:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 63
    const/4 v0, 0x0

    sput v0, Lkorex/mail/internet/UniqueValue;->id:I

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getUniqueBoundaryValue()Ljava/lang/String;
    .registers 4

    .prologue
    .line 73
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 76
    .local v0, "s":Ljava/lang/StringBuffer;
    const-string v1, "----=_Part_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-static {}, Lkorex/mail/internet/UniqueValue;->getUniqueId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    .line 77
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const/16 v2, 0x2e

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v1

    .line 78
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    .line 79
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static declared-synchronized getUniqueId()I
    .registers 3

    .prologue
    .line 122
    const-class v1, Lkorex/mail/internet/UniqueValue;

    monitor-enter v1

    :try_start_3
    sget v0, Lkorex/mail/internet/UniqueValue;->id:I

    add-int/lit8 v2, v0, 0x1

    sput v2, Lkorex/mail/internet/UniqueValue;->id:I
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_b

    monitor-exit v1

    return v0

    :catchall_b
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static getUniqueMessageIDValue(Lkorex/mail/Session;)Ljava/lang/String;
    .registers 8
    .param p0, "ssn"    # Lkorex/mail/Session;

    .prologue
    const/16 v6, 0x2e

    .line 98
    const/4 v2, 0x0

    .line 100
    .local v2, "suffix":Ljava/lang/String;
    invoke-static {p0}, Lkorex/mail/internet/InternetAddress;->getLocalAddress(Lkorex/mail/Session;)Lkorex/mail/internet/InternetAddress;

    move-result-object v0

    .line 101
    .local v0, "addr":Lkorex/mail/internet/InternetAddress;
    if-eqz v0, :cond_44

    .line 102
    invoke-virtual {v0}, Lkorex/mail/internet/InternetAddress;->getAddress()Ljava/lang/String;

    move-result-object v2

    .line 107
    :goto_d
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 110
    .local v1, "s":Ljava/lang/StringBuffer;
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-static {}, Lkorex/mail/internet/UniqueValue;->getUniqueId()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v3

    .line 111
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "JavaMail."

    .line 112
    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    .line 113
    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 114
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 104
    .end local v1    # "s":Ljava/lang/StringBuffer;
    :cond_44
    const-string v2, "javamailuser@localhost"

    goto :goto_d
.end method
