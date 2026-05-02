.class public final Lch/qos/logback/classic/Level;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final ALL:Lch/qos/logback/classic/Level;

.field public static final ALL_INT:I = -0x80000000

.field public static final ALL_INTEGER:Ljava/lang/Integer;

.field public static final DEBUG:Lch/qos/logback/classic/Level;

.field public static final DEBUG_INT:I = 0x2710

.field public static final DEBUG_INTEGER:Ljava/lang/Integer;

.field public static final ERROR:Lch/qos/logback/classic/Level;

.field public static final ERROR_INT:I = 0x9c40

.field public static final ERROR_INTEGER:Ljava/lang/Integer;

.field public static final INFO:Lch/qos/logback/classic/Level;

.field public static final INFO_INT:I = 0x4e20

.field public static final INFO_INTEGER:Ljava/lang/Integer;

.field public static final OFF:Lch/qos/logback/classic/Level;

.field public static final OFF_INT:I = 0x7fffffff

.field public static final OFF_INTEGER:Ljava/lang/Integer;

.field public static final TRACE:Lch/qos/logback/classic/Level;

.field public static final TRACE_INT:I = 0x1388

.field public static final TRACE_INTEGER:Ljava/lang/Integer;

.field public static final WARN:Lch/qos/logback/classic/Level;

.field public static final WARN_INT:I = 0x7530

.field public static final WARN_INTEGER:Ljava/lang/Integer;

.field private static final serialVersionUID:J = -0xb4c3d0f032cb399L


# instance fields
.field public final levelInt:I

.field public final levelStr:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    const/16 v7, 0x7530

    const/16 v6, 0x4e20

    const/16 v5, 0x2710

    const/16 v4, 0x1388

    const/high16 v3, -0x80000000

    const v0, 0x7fffffff

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lch/qos/logback/classic/Level;->OFF_INTEGER:Ljava/lang/Integer;

    const v0, 0x9c40

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lch/qos/logback/classic/Level;->ERROR_INTEGER:Ljava/lang/Integer;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lch/qos/logback/classic/Level;->WARN_INTEGER:Ljava/lang/Integer;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lch/qos/logback/classic/Level;->INFO_INTEGER:Ljava/lang/Integer;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lch/qos/logback/classic/Level;->DEBUG_INTEGER:Ljava/lang/Integer;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lch/qos/logback/classic/Level;->TRACE_INTEGER:Ljava/lang/Integer;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lch/qos/logback/classic/Level;->ALL_INTEGER:Ljava/lang/Integer;

    new-instance v0, Lch/qos/logback/classic/Level;

    const v1, 0x7fffffff

    const-string v2, "OFF"

    invoke-direct {v0, v1, v2}, Lch/qos/logback/classic/Level;-><init>(ILjava/lang/String;)V

    sput-object v0, Lch/qos/logback/classic/Level;->OFF:Lch/qos/logback/classic/Level;

    new-instance v0, Lch/qos/logback/classic/Level;

    const v1, 0x9c40

    const-string v2, "ERROR"

    invoke-direct {v0, v1, v2}, Lch/qos/logback/classic/Level;-><init>(ILjava/lang/String;)V

    sput-object v0, Lch/qos/logback/classic/Level;->ERROR:Lch/qos/logback/classic/Level;

    new-instance v0, Lch/qos/logback/classic/Level;

    const-string v1, "WARN"

    invoke-direct {v0, v7, v1}, Lch/qos/logback/classic/Level;-><init>(ILjava/lang/String;)V

    sput-object v0, Lch/qos/logback/classic/Level;->WARN:Lch/qos/logback/classic/Level;

    new-instance v0, Lch/qos/logback/classic/Level;

    const-string v1, "INFO"

    invoke-direct {v0, v6, v1}, Lch/qos/logback/classic/Level;-><init>(ILjava/lang/String;)V

    sput-object v0, Lch/qos/logback/classic/Level;->INFO:Lch/qos/logback/classic/Level;

    new-instance v0, Lch/qos/logback/classic/Level;

    const-string v1, "DEBUG"

    invoke-direct {v0, v5, v1}, Lch/qos/logback/classic/Level;-><init>(ILjava/lang/String;)V

    sput-object v0, Lch/qos/logback/classic/Level;->DEBUG:Lch/qos/logback/classic/Level;

    new-instance v0, Lch/qos/logback/classic/Level;

    const-string v1, "TRACE"

    invoke-direct {v0, v4, v1}, Lch/qos/logback/classic/Level;-><init>(ILjava/lang/String;)V

    sput-object v0, Lch/qos/logback/classic/Level;->TRACE:Lch/qos/logback/classic/Level;

    new-instance v0, Lch/qos/logback/classic/Level;

    const-string v1, "ALL"

    invoke-direct {v0, v3, v1}, Lch/qos/logback/classic/Level;-><init>(ILjava/lang/String;)V

    sput-object v0, Lch/qos/logback/classic/Level;->ALL:Lch/qos/logback/classic/Level;

    return-void
.end method

.method private constructor <init>(ILjava/lang/String;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lch/qos/logback/classic/Level;->levelInt:I

    iput-object p2, p0, Lch/qos/logback/classic/Level;->levelStr:Ljava/lang/String;

    return-void
.end method

.method public static fromLocationAwareLoggerInteger(I)Lch/qos/logback/classic/Level;
    .registers 4

    sparse-switch p0, :sswitch_data_2c

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " not a valid level value"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :sswitch_1c
    sget-object v0, Lch/qos/logback/classic/Level;->TRACE:Lch/qos/logback/classic/Level;

    :goto_1e
    return-object v0

    :sswitch_1f
    sget-object v0, Lch/qos/logback/classic/Level;->DEBUG:Lch/qos/logback/classic/Level;

    goto :goto_1e

    :sswitch_22
    sget-object v0, Lch/qos/logback/classic/Level;->INFO:Lch/qos/logback/classic/Level;

    goto :goto_1e

    :sswitch_25
    sget-object v0, Lch/qos/logback/classic/Level;->WARN:Lch/qos/logback/classic/Level;

    goto :goto_1e

    :sswitch_28
    sget-object v0, Lch/qos/logback/classic/Level;->ERROR:Lch/qos/logback/classic/Level;

    goto :goto_1e

    nop

    :sswitch_data_2c
    .sparse-switch
        0x0 -> :sswitch_1c
        0xa -> :sswitch_1f
        0x14 -> :sswitch_22
        0x1e -> :sswitch_25
        0x28 -> :sswitch_28
    .end sparse-switch
.end method

.method private readResolve()Ljava/lang/Object;
    .registers 2

    iget v0, p0, Lch/qos/logback/classic/Level;->levelInt:I

    invoke-static {v0}, Lch/qos/logback/classic/Level;->toLevel(I)Lch/qos/logback/classic/Level;

    move-result-object v0

    return-object v0
.end method

.method public static toLevel(I)Lch/qos/logback/classic/Level;
    .registers 2

    sget-object v0, Lch/qos/logback/classic/Level;->DEBUG:Lch/qos/logback/classic/Level;

    invoke-static {p0, v0}, Lch/qos/logback/classic/Level;->toLevel(ILch/qos/logback/classic/Level;)Lch/qos/logback/classic/Level;

    move-result-object v0

    return-object v0
.end method

.method public static toLevel(ILch/qos/logback/classic/Level;)Lch/qos/logback/classic/Level;
    .registers 2

    sparse-switch p0, :sswitch_data_1a

    :goto_3
    return-object p1

    :sswitch_4
    sget-object p1, Lch/qos/logback/classic/Level;->ALL:Lch/qos/logback/classic/Level;

    goto :goto_3

    :sswitch_7
    sget-object p1, Lch/qos/logback/classic/Level;->TRACE:Lch/qos/logback/classic/Level;

    goto :goto_3

    :sswitch_a
    sget-object p1, Lch/qos/logback/classic/Level;->DEBUG:Lch/qos/logback/classic/Level;

    goto :goto_3

    :sswitch_d
    sget-object p1, Lch/qos/logback/classic/Level;->INFO:Lch/qos/logback/classic/Level;

    goto :goto_3

    :sswitch_10
    sget-object p1, Lch/qos/logback/classic/Level;->WARN:Lch/qos/logback/classic/Level;

    goto :goto_3

    :sswitch_13
    sget-object p1, Lch/qos/logback/classic/Level;->ERROR:Lch/qos/logback/classic/Level;

    goto :goto_3

    :sswitch_16
    sget-object p1, Lch/qos/logback/classic/Level;->OFF:Lch/qos/logback/classic/Level;

    goto :goto_3

    nop

    :sswitch_data_1a
    .sparse-switch
        -0x80000000 -> :sswitch_4
        0x1388 -> :sswitch_7
        0x2710 -> :sswitch_a
        0x4e20 -> :sswitch_d
        0x7530 -> :sswitch_10
        0x9c40 -> :sswitch_13
        0x7fffffff -> :sswitch_16
    .end sparse-switch
.end method

.method public static toLevel(Ljava/lang/String;)Lch/qos/logback/classic/Level;
    .registers 2

    sget-object v0, Lch/qos/logback/classic/Level;->DEBUG:Lch/qos/logback/classic/Level;

    invoke-static {p0, v0}, Lch/qos/logback/classic/Level;->toLevel(Ljava/lang/String;Lch/qos/logback/classic/Level;)Lch/qos/logback/classic/Level;

    move-result-object v0

    return-object v0
.end method

.method public static toLevel(Ljava/lang/String;Lch/qos/logback/classic/Level;)Lch/qos/logback/classic/Level;
    .registers 3

    if-nez p0, :cond_3

    :cond_2
    :goto_2
    return-object p1

    :cond_3
    const-string v0, "ALL"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e

    sget-object p1, Lch/qos/logback/classic/Level;->ALL:Lch/qos/logback/classic/Level;

    goto :goto_2

    :cond_e
    const-string v0, "TRACE"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_19

    sget-object p1, Lch/qos/logback/classic/Level;->TRACE:Lch/qos/logback/classic/Level;

    goto :goto_2

    :cond_19
    const-string v0, "DEBUG"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_24

    sget-object p1, Lch/qos/logback/classic/Level;->DEBUG:Lch/qos/logback/classic/Level;

    goto :goto_2

    :cond_24
    const-string v0, "INFO"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2f

    sget-object p1, Lch/qos/logback/classic/Level;->INFO:Lch/qos/logback/classic/Level;

    goto :goto_2

    :cond_2f
    const-string v0, "WARN"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3a

    sget-object p1, Lch/qos/logback/classic/Level;->WARN:Lch/qos/logback/classic/Level;

    goto :goto_2

    :cond_3a
    const-string v0, "ERROR"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_45

    sget-object p1, Lch/qos/logback/classic/Level;->ERROR:Lch/qos/logback/classic/Level;

    goto :goto_2

    :cond_45
    const-string v0, "OFF"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object p1, Lch/qos/logback/classic/Level;->OFF:Lch/qos/logback/classic/Level;

    goto :goto_2
.end method

.method public static toLocationAwareLoggerInteger(Lch/qos/logback/classic/Level;)I
    .registers 4

    if-nez p0, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "null level parameter is not admitted"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a
    invoke-virtual {p0}, Lch/qos/logback/classic/Level;->toInt()I

    move-result v0

    sparse-switch v0, :sswitch_data_38

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " not a valid level value"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :sswitch_2a
    const/4 v0, 0x0

    :goto_2b
    return v0

    :sswitch_2c
    const/16 v0, 0xa

    goto :goto_2b

    :sswitch_2f
    const/16 v0, 0x14

    goto :goto_2b

    :sswitch_32
    const/16 v0, 0x1e

    goto :goto_2b

    :sswitch_35
    const/16 v0, 0x28

    goto :goto_2b

    :sswitch_data_38
    .sparse-switch
        0x1388 -> :sswitch_2a
        0x2710 -> :sswitch_2c
        0x4e20 -> :sswitch_2f
        0x7530 -> :sswitch_32
        0x9c40 -> :sswitch_35
    .end sparse-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lch/qos/logback/classic/Level;
    .registers 2

    sget-object v0, Lch/qos/logback/classic/Level;->DEBUG:Lch/qos/logback/classic/Level;

    invoke-static {p0, v0}, Lch/qos/logback/classic/Level;->toLevel(Ljava/lang/String;Lch/qos/logback/classic/Level;)Lch/qos/logback/classic/Level;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public isGreaterOrEqual(Lch/qos/logback/classic/Level;)Z
    .registers 4

    iget v0, p0, Lch/qos/logback/classic/Level;->levelInt:I

    iget v1, p1, Lch/qos/logback/classic/Level;->levelInt:I

    if-lt v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public toInt()I
    .registers 2

    iget v0, p0, Lch/qos/logback/classic/Level;->levelInt:I

    return v0
.end method

.method public toInteger()Ljava/lang/Integer;
    .registers 4

    iget v0, p0, Lch/qos/logback/classic/Level;->levelInt:I

    sparse-switch v0, :sswitch_data_48

    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Level "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/classic/Level;->levelStr:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lch/qos/logback/classic/Level;->levelInt:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is unknown."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :sswitch_32
    sget-object v0, Lch/qos/logback/classic/Level;->ALL_INTEGER:Ljava/lang/Integer;

    :goto_34
    return-object v0

    :sswitch_35
    sget-object v0, Lch/qos/logback/classic/Level;->TRACE_INTEGER:Ljava/lang/Integer;

    goto :goto_34

    :sswitch_38
    sget-object v0, Lch/qos/logback/classic/Level;->DEBUG_INTEGER:Ljava/lang/Integer;

    goto :goto_34

    :sswitch_3b
    sget-object v0, Lch/qos/logback/classic/Level;->INFO_INTEGER:Ljava/lang/Integer;

    goto :goto_34

    :sswitch_3e
    sget-object v0, Lch/qos/logback/classic/Level;->WARN_INTEGER:Ljava/lang/Integer;

    goto :goto_34

    :sswitch_41
    sget-object v0, Lch/qos/logback/classic/Level;->ERROR_INTEGER:Ljava/lang/Integer;

    goto :goto_34

    :sswitch_44
    sget-object v0, Lch/qos/logback/classic/Level;->OFF_INTEGER:Ljava/lang/Integer;

    goto :goto_34

    nop

    :sswitch_data_48
    .sparse-switch
        -0x80000000 -> :sswitch_32
        0x1388 -> :sswitch_35
        0x2710 -> :sswitch_38
        0x4e20 -> :sswitch_3b
        0x7530 -> :sswitch_3e
        0x9c40 -> :sswitch_41
        0x7fffffff -> :sswitch_44
    .end sparse-switch
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/Level;->levelStr:Ljava/lang/String;

    return-object v0
.end method
