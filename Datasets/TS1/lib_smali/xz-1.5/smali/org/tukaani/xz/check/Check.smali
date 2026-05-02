.class public abstract Lorg/tukaani/xz/check/Check;
.super Ljava/lang/Object;


# instance fields
.field name:Ljava/lang/String;

.field size:I


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance(I)Lorg/tukaani/xz/check/Check;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/tukaani/xz/UnsupportedOptionsException;
        }
    .end annotation

    sparse-switch p0, :sswitch_data_36

    :goto_3
    new-instance v0, Lorg/tukaani/xz/UnsupportedOptionsException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Unsupported Check ID "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>(Ljava/lang/String;)V

    throw v0

    :sswitch_1c
    new-instance v0, Lorg/tukaani/xz/check/None;

    invoke-direct {v0}, Lorg/tukaani/xz/check/None;-><init>()V

    :goto_21
    return-object v0

    :sswitch_22
    new-instance v0, Lorg/tukaani/xz/check/CRC32;

    invoke-direct {v0}, Lorg/tukaani/xz/check/CRC32;-><init>()V

    goto :goto_21

    :sswitch_28
    new-instance v0, Lorg/tukaani/xz/check/CRC64;

    invoke-direct {v0}, Lorg/tukaani/xz/check/CRC64;-><init>()V

    goto :goto_21

    :sswitch_2e
    :try_start_2e
    new-instance v0, Lorg/tukaani/xz/check/SHA256;

    invoke-direct {v0}, Lorg/tukaani/xz/check/SHA256;-><init>()V
    :try_end_33
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_2e .. :try_end_33} :catch_34

    goto :goto_21

    :catch_34
    move-exception v0

    goto :goto_3

    :sswitch_data_36
    .sparse-switch
        0x0 -> :sswitch_1c
        0x1 -> :sswitch_22
        0x4 -> :sswitch_28
        0xa -> :sswitch_2e
    .end sparse-switch
.end method


# virtual methods
.method public abstract finish()[B
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lorg/tukaani/xz/check/Check;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getSize()I
    .registers 2

    iget v0, p0, Lorg/tukaani/xz/check/Check;->size:I

    return v0
.end method

.method public update([B)V
    .registers 4

    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/tukaani/xz/check/Check;->update([BII)V

    return-void
.end method

.method public abstract update([BII)V
.end method
