.class public Lorg/apache/commons/validator/util/Flags;
.super Ljava/lang/Object;
.source "Flags.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/lang/Cloneable;


# static fields
.field private static final serialVersionUID:J = 0x75b4a6f283df622bL


# instance fields
.field private flags:J


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/commons/validator/util/Flags;->flags:J

    .line 55
    return-void
.end method

.method public constructor <init>(J)V
    .registers 5
    .param p1, "flags"    # J

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/commons/validator/util/Flags;->flags:J

    .line 64
    iput-wide p1, p0, Lorg/apache/commons/validator/util/Flags;->flags:J

    .line 65
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 3

    .prologue
    .line 132
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/commons/validator/util/Flags;->flags:J

    .line 133
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .registers 4

    .prologue
    .line 150
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    .line 151
    :catch_5
    move-exception v0

    .line 152
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Couldn\'t clone Flags object."

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 9
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 164
    instance-of v3, p1, Lorg/apache/commons/validator/util/Flags;

    if-nez v3, :cond_8

    move v1, v2

    .line 174
    :cond_7
    :goto_7
    return v1

    .line 168
    :cond_8
    if-eq p1, p0, :cond_7

    move-object v0, p1

    .line 172
    check-cast v0, Lorg/apache/commons/validator/util/Flags;

    .line 174
    .local v0, "f":Lorg/apache/commons/validator/util/Flags;
    iget-wide v3, p0, Lorg/apache/commons/validator/util/Flags;->flags:J

    iget-wide v5, v0, Lorg/apache/commons/validator/util/Flags;->flags:J

    cmp-long v3, v3, v5

    if-eqz v3, :cond_7

    move v1, v2

    goto :goto_7
.end method

.method public getFlags()J
    .registers 3

    .prologue
    .line 73
    iget-wide v0, p0, Lorg/apache/commons/validator/util/Flags;->flags:J

    return-wide v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 184
    iget-wide v0, p0, Lorg/apache/commons/validator/util/Flags;->flags:J

    long-to-int v0, v0

    return v0
.end method

.method public isOff(J)Z
    .registers 7
    .param p1, "flag"    # J

    .prologue
    .line 97
    iget-wide v0, p0, Lorg/apache/commons/validator/util/Flags;->flags:J

    and-long/2addr v0, p1

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_b

    const/4 v0, 0x1

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public isOn(J)Z
    .registers 7
    .param p1, "flag"    # J

    .prologue
    .line 85
    iget-wide v0, p0, Lorg/apache/commons/validator/util/Flags;->flags:J

    and-long/2addr v0, p1

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_b

    const/4 v0, 0x1

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 195
    new-instance v0, Ljava/lang/StringBuffer;

    iget-wide v2, p0, Lorg/apache/commons/validator/util/Flags;->flags:J

    invoke-static {v2, v3}, Ljava/lang/Long;->toBinaryString(J)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 196
    .local v0, "bin":Ljava/lang/StringBuffer;
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v2

    rsub-int/lit8 v1, v2, 0x40

    .local v1, "i":I
    :goto_11
    if-lez v1, :cond_1c

    .line 197
    const/4 v2, 0x0

    const-string v3, "0"

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuffer;->insert(ILjava/lang/String;)Ljava/lang/StringBuffer;

    .line 196
    add-int/lit8 v1, v1, -0x1

    goto :goto_11

    .line 199
    :cond_1c
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public turnOff(J)V
    .registers 7
    .param p1, "flag"    # J

    .prologue
    .line 117
    iget-wide v0, p0, Lorg/apache/commons/validator/util/Flags;->flags:J

    const-wide/16 v2, -0x1

    xor-long/2addr v2, p1

    and-long/2addr v0, v2

    iput-wide v0, p0, Lorg/apache/commons/validator/util/Flags;->flags:J

    .line 118
    return-void
.end method

.method public turnOffAll()V
    .registers 3

    .prologue
    .line 124
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/commons/validator/util/Flags;->flags:J

    .line 125
    return-void
.end method

.method public turnOn(J)V
    .registers 5
    .param p1, "flag"    # J

    .prologue
    .line 107
    iget-wide v0, p0, Lorg/apache/commons/validator/util/Flags;->flags:J

    or-long/2addr v0, p1

    iput-wide v0, p0, Lorg/apache/commons/validator/util/Flags;->flags:J

    .line 108
    return-void
.end method

.method public turnOnAll()V
    .registers 3

    .prologue
    .line 139
    const-wide v0, 0x7fffffffffffffffL

    iput-wide v0, p0, Lorg/apache/commons/validator/util/Flags;->flags:J

    .line 140
    return-void
.end method
