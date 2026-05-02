.class public final Lroboguice/util/temp/Ln;
.super Ljava/lang/Object;
.source "Ln.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lroboguice/util/temp/Ln$Print;,
        Lroboguice/util/temp/Ln$BaseConfig;,
        Lroboguice/util/temp/Ln$Config;
    }
.end annotation


# static fields
.field private static final CONFIG:Lroboguice/util/temp/Ln$BaseConfig;

.field private static print:Lroboguice/util/temp/Ln$Print;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 41
    new-instance v0, Lroboguice/util/temp/Ln$BaseConfig;

    invoke-direct {v0}, Lroboguice/util/temp/Ln$BaseConfig;-><init>()V

    sput-object v0, Lroboguice/util/temp/Ln;->CONFIG:Lroboguice/util/temp/Ln$BaseConfig;

    .line 48
    new-instance v0, Lroboguice/util/temp/Ln$Print;

    invoke-direct {v0}, Lroboguice/util/temp/Ln$Print;-><init>()V

    sput-object v0, Lroboguice/util/temp/Ln;->print:Lroboguice/util/temp/Ln$Print;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    return-void
.end method

.method static synthetic access$000()Lroboguice/util/temp/Ln$BaseConfig;
    .registers 1

    .prologue
    .line 35
    sget-object v0, Lroboguice/util/temp/Ln;->CONFIG:Lroboguice/util/temp/Ln$BaseConfig;

    return-object v0
.end method

.method public static varargs d(Ljava/lang/Object;[Ljava/lang/Object;)I
    .registers 6
    .param p0, "s1"    # Ljava/lang/Object;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v3, 0x3

    .line 82
    sget-object v2, Lroboguice/util/temp/Ln;->CONFIG:Lroboguice/util/temp/Ln$BaseConfig;

    iget v2, v2, Lroboguice/util/temp/Ln$BaseConfig;->minimumLogLevel:I

    if-le v2, v3, :cond_9

    .line 83
    const/4 v2, 0x0

    .line 88
    :goto_8
    return v2

    .line 86
    :cond_9
    invoke-static {p0}, Lroboguice/util/temp/Strings;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 87
    .local v1, "s":Ljava/lang/String;
    array-length v2, p1

    if-lez v2, :cond_1b

    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 88
    .local v0, "message":Ljava/lang/String;
    :goto_14
    sget-object v2, Lroboguice/util/temp/Ln;->print:Lroboguice/util/temp/Ln$Print;

    invoke-virtual {v2, v3, v0}, Lroboguice/util/temp/Ln$Print;->println(ILjava/lang/String;)I

    move-result v2

    goto :goto_8

    .end local v0    # "message":Ljava/lang/String;
    :cond_1b
    move-object v0, v1

    .line 87
    goto :goto_14
.end method

.method public static d(Ljava/lang/Throwable;)I
    .registers 4
    .param p0, "t"    # Ljava/lang/Throwable;

    .prologue
    const/4 v2, 0x3

    .line 78
    sget-object v0, Lroboguice/util/temp/Ln;->CONFIG:Lroboguice/util/temp/Ln$BaseConfig;

    iget v0, v0, Lroboguice/util/temp/Ln$BaseConfig;->minimumLogLevel:I

    if-gt v0, v2, :cond_12

    sget-object v0, Lroboguice/util/temp/Ln;->print:Lroboguice/util/temp/Ln$Print;

    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lroboguice/util/temp/Ln$Print;->println(ILjava/lang/String;)I

    move-result v0

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public static varargs d(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I
    .registers 8
    .param p0, "throwable"    # Ljava/lang/Throwable;
    .param p1, "s1"    # Ljava/lang/Object;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v4, 0x3

    .line 92
    sget-object v2, Lroboguice/util/temp/Ln;->CONFIG:Lroboguice/util/temp/Ln$BaseConfig;

    iget v2, v2, Lroboguice/util/temp/Ln$BaseConfig;->minimumLogLevel:I

    if-le v2, v4, :cond_9

    .line 93
    const/4 v2, 0x0

    .line 98
    :goto_8
    return v2

    .line 96
    :cond_9
    invoke-static {p1}, Lroboguice/util/temp/Strings;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 97
    .local v1, "s":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    array-length v3, p2

    if-lez v3, :cond_19

    invoke-static {v1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .end local v1    # "s":Ljava/lang/String;
    :cond_19
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 98
    .local v0, "message":Ljava/lang/String;
    sget-object v2, Lroboguice/util/temp/Ln;->print:Lroboguice/util/temp/Ln$Print;

    invoke-virtual {v2, v4, v0}, Lroboguice/util/temp/Ln$Print;->println(ILjava/lang/String;)I

    move-result v2

    goto :goto_8
.end method

.method public static varargs e(Ljava/lang/Object;[Ljava/lang/Object;)I
    .registers 6
    .param p0, "s1"    # Ljava/lang/Object;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v3, 0x6

    .line 154
    sget-object v2, Lroboguice/util/temp/Ln;->CONFIG:Lroboguice/util/temp/Ln$BaseConfig;

    iget v2, v2, Lroboguice/util/temp/Ln$BaseConfig;->minimumLogLevel:I

    if-le v2, v3, :cond_9

    .line 155
    const/4 v2, 0x0

    .line 160
    :goto_8
    return v2

    .line 158
    :cond_9
    invoke-static {p0}, Lroboguice/util/temp/Strings;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 159
    .local v1, "s":Ljava/lang/String;
    array-length v2, p1

    if-lez v2, :cond_1b

    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 160
    .local v0, "message":Ljava/lang/String;
    :goto_14
    sget-object v2, Lroboguice/util/temp/Ln;->print:Lroboguice/util/temp/Ln$Print;

    invoke-virtual {v2, v3, v0}, Lroboguice/util/temp/Ln$Print;->println(ILjava/lang/String;)I

    move-result v2

    goto :goto_8

    .end local v0    # "message":Ljava/lang/String;
    :cond_1b
    move-object v0, v1

    .line 159
    goto :goto_14
.end method

.method public static e(Ljava/lang/Throwable;)I
    .registers 4
    .param p0, "t"    # Ljava/lang/Throwable;

    .prologue
    const/4 v2, 0x6

    .line 150
    sget-object v0, Lroboguice/util/temp/Ln;->CONFIG:Lroboguice/util/temp/Ln$BaseConfig;

    iget v0, v0, Lroboguice/util/temp/Ln$BaseConfig;->minimumLogLevel:I

    if-gt v0, v2, :cond_12

    sget-object v0, Lroboguice/util/temp/Ln;->print:Lroboguice/util/temp/Ln$Print;

    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lroboguice/util/temp/Ln$Print;->println(ILjava/lang/String;)I

    move-result v0

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public static varargs e(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I
    .registers 8
    .param p0, "throwable"    # Ljava/lang/Throwable;
    .param p1, "s1"    # Ljava/lang/Object;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v4, 0x6

    .line 164
    sget-object v2, Lroboguice/util/temp/Ln;->CONFIG:Lroboguice/util/temp/Ln$BaseConfig;

    iget v2, v2, Lroboguice/util/temp/Ln$BaseConfig;->minimumLogLevel:I

    if-le v2, v4, :cond_9

    .line 165
    const/4 v2, 0x0

    .line 170
    :goto_8
    return v2

    .line 168
    :cond_9
    invoke-static {p1}, Lroboguice/util/temp/Strings;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 169
    .local v1, "s":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    array-length v3, p2

    if-lez v3, :cond_19

    invoke-static {v1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .end local v1    # "s":Ljava/lang/String;
    :cond_19
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 170
    .local v0, "message":Ljava/lang/String;
    sget-object v2, Lroboguice/util/temp/Ln;->print:Lroboguice/util/temp/Ln$Print;

    invoke-virtual {v2, v4, v0}, Lroboguice/util/temp/Ln$Print;->println(ILjava/lang/String;)I

    move-result v2

    goto :goto_8
.end method

.method public static getConfig()Lroboguice/util/temp/Ln$Config;
    .registers 1

    .prologue
    .line 183
    sget-object v0, Lroboguice/util/temp/Ln;->CONFIG:Lroboguice/util/temp/Ln$BaseConfig;

    return-object v0
.end method

.method public static varargs i(Ljava/lang/Object;[Ljava/lang/Object;)I
    .registers 6
    .param p0, "s1"    # Ljava/lang/Object;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v3, 0x4

    .line 106
    sget-object v2, Lroboguice/util/temp/Ln;->CONFIG:Lroboguice/util/temp/Ln$BaseConfig;

    iget v2, v2, Lroboguice/util/temp/Ln$BaseConfig;->minimumLogLevel:I

    if-le v2, v3, :cond_9

    .line 107
    const/4 v2, 0x0

    .line 112
    :goto_8
    return v2

    .line 110
    :cond_9
    invoke-static {p0}, Lroboguice/util/temp/Strings;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 111
    .local v1, "s":Ljava/lang/String;
    array-length v2, p1

    if-lez v2, :cond_1b

    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 112
    .local v0, "message":Ljava/lang/String;
    :goto_14
    sget-object v2, Lroboguice/util/temp/Ln;->print:Lroboguice/util/temp/Ln$Print;

    invoke-virtual {v2, v3, v0}, Lroboguice/util/temp/Ln$Print;->println(ILjava/lang/String;)I

    move-result v2

    goto :goto_8

    .end local v0    # "message":Ljava/lang/String;
    :cond_1b
    move-object v0, v1

    .line 111
    goto :goto_14
.end method

.method public static i(Ljava/lang/Throwable;)I
    .registers 4
    .param p0, "t"    # Ljava/lang/Throwable;

    .prologue
    const/4 v2, 0x4

    .line 102
    sget-object v0, Lroboguice/util/temp/Ln;->CONFIG:Lroboguice/util/temp/Ln$BaseConfig;

    iget v0, v0, Lroboguice/util/temp/Ln$BaseConfig;->minimumLogLevel:I

    if-gt v0, v2, :cond_12

    sget-object v0, Lroboguice/util/temp/Ln;->print:Lroboguice/util/temp/Ln$Print;

    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lroboguice/util/temp/Ln$Print;->println(ILjava/lang/String;)I

    move-result v0

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public static varargs i(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I
    .registers 8
    .param p0, "throwable"    # Ljava/lang/Throwable;
    .param p1, "s1"    # Ljava/lang/Object;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v4, 0x4

    .line 116
    sget-object v2, Lroboguice/util/temp/Ln;->CONFIG:Lroboguice/util/temp/Ln$BaseConfig;

    iget v2, v2, Lroboguice/util/temp/Ln$BaseConfig;->minimumLogLevel:I

    if-le v2, v4, :cond_9

    .line 117
    const/4 v2, 0x0

    .line 122
    :goto_8
    return v2

    .line 120
    :cond_9
    invoke-static {p1}, Lroboguice/util/temp/Strings;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 121
    .local v1, "s":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    array-length v3, p2

    if-lez v3, :cond_19

    invoke-static {v1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .end local v1    # "s":Ljava/lang/String;
    :cond_19
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 122
    .local v0, "message":Ljava/lang/String;
    sget-object v2, Lroboguice/util/temp/Ln;->print:Lroboguice/util/temp/Ln$Print;

    invoke-virtual {v2, v4, v0}, Lroboguice/util/temp/Ln$Print;->println(ILjava/lang/String;)I

    move-result v2

    goto :goto_8
.end method

.method public static isDebugEnabled()Z
    .registers 2

    .prologue
    .line 174
    sget-object v0, Lroboguice/util/temp/Ln;->CONFIG:Lroboguice/util/temp/Ln$BaseConfig;

    iget v0, v0, Lroboguice/util/temp/Ln$BaseConfig;->minimumLogLevel:I

    const/4 v1, 0x3

    if-gt v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public static isVerboseEnabled()Z
    .registers 2

    .prologue
    .line 178
    sget-object v0, Lroboguice/util/temp/Ln;->CONFIG:Lroboguice/util/temp/Ln$BaseConfig;

    iget v0, v0, Lroboguice/util/temp/Ln$BaseConfig;->minimumLogLevel:I

    const/4 v1, 0x2

    if-gt v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public static logLevelToString(I)Ljava/lang/String;
    .registers 2
    .param p0, "loglevel"    # I

    .prologue
    .line 224
    packed-switch p0, :pswitch_data_18

    .line 239
    const-string v0, "UNKNOWN"

    :goto_5
    return-object v0

    .line 226
    :pswitch_6
    const-string v0, "VERBOSE"

    goto :goto_5

    .line 228
    :pswitch_9
    const-string v0, "DEBUG"

    goto :goto_5

    .line 230
    :pswitch_c
    const-string v0, "INFO"

    goto :goto_5

    .line 232
    :pswitch_f
    const-string v0, "WARN"

    goto :goto_5

    .line 234
    :pswitch_12
    const-string v0, "ERROR"

    goto :goto_5

    .line 236
    :pswitch_15
    const-string v0, "ASSERT"

    goto :goto_5

    .line 224
    :pswitch_data_18
    .packed-switch 0x2
        :pswitch_6
        :pswitch_9
        :pswitch_c
        :pswitch_f
        :pswitch_12
        :pswitch_15
    .end packed-switch
.end method

.method public static setPrint(Lroboguice/util/temp/Ln$Print;)V
    .registers 1
    .param p0, "print"    # Lroboguice/util/temp/Ln$Print;

    .prologue
    .line 245
    sput-object p0, Lroboguice/util/temp/Ln;->print:Lroboguice/util/temp/Ln$Print;

    .line 246
    return-void
.end method

.method public static varargs v(Ljava/lang/Object;[Ljava/lang/Object;)I
    .registers 6
    .param p0, "s1"    # Ljava/lang/Object;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v3, 0x2

    .line 58
    sget-object v2, Lroboguice/util/temp/Ln;->CONFIG:Lroboguice/util/temp/Ln$BaseConfig;

    iget v2, v2, Lroboguice/util/temp/Ln$BaseConfig;->minimumLogLevel:I

    if-le v2, v3, :cond_9

    .line 59
    const/4 v2, 0x0

    .line 64
    :goto_8
    return v2

    .line 62
    :cond_9
    invoke-static {p0}, Lroboguice/util/temp/Strings;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 63
    .local v1, "s":Ljava/lang/String;
    array-length v2, p1

    if-lez v2, :cond_1b

    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 64
    .local v0, "message":Ljava/lang/String;
    :goto_14
    sget-object v2, Lroboguice/util/temp/Ln;->print:Lroboguice/util/temp/Ln$Print;

    invoke-virtual {v2, v3, v0}, Lroboguice/util/temp/Ln$Print;->println(ILjava/lang/String;)I

    move-result v2

    goto :goto_8

    .end local v0    # "message":Ljava/lang/String;
    :cond_1b
    move-object v0, v1

    .line 63
    goto :goto_14
.end method

.method public static v(Ljava/lang/Throwable;)I
    .registers 4
    .param p0, "t"    # Ljava/lang/Throwable;

    .prologue
    const/4 v2, 0x2

    .line 54
    sget-object v0, Lroboguice/util/temp/Ln;->CONFIG:Lroboguice/util/temp/Ln$BaseConfig;

    iget v0, v0, Lroboguice/util/temp/Ln$BaseConfig;->minimumLogLevel:I

    if-gt v0, v2, :cond_12

    sget-object v0, Lroboguice/util/temp/Ln;->print:Lroboguice/util/temp/Ln$Print;

    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lroboguice/util/temp/Ln$Print;->println(ILjava/lang/String;)I

    move-result v0

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public static varargs v(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I
    .registers 8
    .param p0, "throwable"    # Ljava/lang/Throwable;
    .param p1, "s1"    # Ljava/lang/Object;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v4, 0x2

    .line 68
    sget-object v2, Lroboguice/util/temp/Ln;->CONFIG:Lroboguice/util/temp/Ln$BaseConfig;

    iget v2, v2, Lroboguice/util/temp/Ln$BaseConfig;->minimumLogLevel:I

    if-le v2, v4, :cond_9

    .line 69
    const/4 v2, 0x0

    .line 74
    :goto_8
    return v2

    .line 72
    :cond_9
    invoke-static {p1}, Lroboguice/util/temp/Strings;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 73
    .local v1, "s":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    array-length v3, p2

    if-lez v3, :cond_19

    invoke-static {v1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .end local v1    # "s":Ljava/lang/String;
    :cond_19
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 74
    .local v0, "message":Ljava/lang/String;
    sget-object v2, Lroboguice/util/temp/Ln;->print:Lroboguice/util/temp/Ln$Print;

    invoke-virtual {v2, v4, v0}, Lroboguice/util/temp/Ln$Print;->println(ILjava/lang/String;)I

    move-result v2

    goto :goto_8
.end method

.method public static varargs w(Ljava/lang/Object;[Ljava/lang/Object;)I
    .registers 6
    .param p0, "s1"    # Ljava/lang/Object;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v3, 0x5

    .line 130
    sget-object v2, Lroboguice/util/temp/Ln;->CONFIG:Lroboguice/util/temp/Ln$BaseConfig;

    iget v2, v2, Lroboguice/util/temp/Ln$BaseConfig;->minimumLogLevel:I

    if-le v2, v3, :cond_9

    .line 131
    const/4 v2, 0x0

    .line 136
    :goto_8
    return v2

    .line 134
    :cond_9
    invoke-static {p0}, Lroboguice/util/temp/Strings;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 135
    .local v1, "s":Ljava/lang/String;
    array-length v2, p1

    if-lez v2, :cond_1b

    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 136
    .local v0, "message":Ljava/lang/String;
    :goto_14
    sget-object v2, Lroboguice/util/temp/Ln;->print:Lroboguice/util/temp/Ln$Print;

    invoke-virtual {v2, v3, v0}, Lroboguice/util/temp/Ln$Print;->println(ILjava/lang/String;)I

    move-result v2

    goto :goto_8

    .end local v0    # "message":Ljava/lang/String;
    :cond_1b
    move-object v0, v1

    .line 135
    goto :goto_14
.end method

.method public static w(Ljava/lang/Throwable;)I
    .registers 4
    .param p0, "t"    # Ljava/lang/Throwable;

    .prologue
    const/4 v2, 0x5

    .line 126
    sget-object v0, Lroboguice/util/temp/Ln;->CONFIG:Lroboguice/util/temp/Ln$BaseConfig;

    iget v0, v0, Lroboguice/util/temp/Ln$BaseConfig;->minimumLogLevel:I

    if-gt v0, v2, :cond_12

    sget-object v0, Lroboguice/util/temp/Ln;->print:Lroboguice/util/temp/Ln$Print;

    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lroboguice/util/temp/Ln$Print;->println(ILjava/lang/String;)I

    move-result v0

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public static varargs w(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I
    .registers 8
    .param p0, "throwable"    # Ljava/lang/Throwable;
    .param p1, "s1"    # Ljava/lang/Object;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v4, 0x5

    .line 140
    sget-object v2, Lroboguice/util/temp/Ln;->CONFIG:Lroboguice/util/temp/Ln$BaseConfig;

    iget v2, v2, Lroboguice/util/temp/Ln$BaseConfig;->minimumLogLevel:I

    if-le v2, v4, :cond_9

    .line 141
    const/4 v2, 0x0

    .line 146
    :goto_8
    return v2

    .line 144
    :cond_9
    invoke-static {p1}, Lroboguice/util/temp/Strings;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 145
    .local v1, "s":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    array-length v3, p2

    if-lez v3, :cond_19

    invoke-static {v1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .end local v1    # "s":Ljava/lang/String;
    :cond_19
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 146
    .local v0, "message":Ljava/lang/String;
    sget-object v2, Lroboguice/util/temp/Ln;->print:Lroboguice/util/temp/Ln$Print;

    invoke-virtual {v2, v4, v0}, Lroboguice/util/temp/Ln$Print;->println(ILjava/lang/String;)I

    move-result v2

    goto :goto_8
.end method
