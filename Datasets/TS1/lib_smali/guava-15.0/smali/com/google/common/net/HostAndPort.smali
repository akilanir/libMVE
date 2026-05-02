.class public final Lcom/google/common/net/HostAndPort;
.super Ljava/lang/Object;
.source "HostAndPort.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation

.annotation build Lcom/google/common/annotations/GwtCompatible;
.end annotation

.annotation build Ljavax/annotation/concurrent/Immutable;
.end annotation


# static fields
.field private static final NO_PORT:I = -0x1

.field private static final serialVersionUID:J


# instance fields
.field private final hasBracketlessColons:Z

.field private final host:Ljava/lang/String;

.field private final port:I


# direct methods
.method private constructor <init>(Ljava/lang/String;IZ)V
    .registers 4
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "hasBracketlessColons"    # Z

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    iput-object p1, p0, Lcom/google/common/net/HostAndPort;->host:Ljava/lang/String;

    .line 82
    iput p2, p0, Lcom/google/common/net/HostAndPort;->port:I

    .line 83
    iput-boolean p3, p0, Lcom/google/common/net/HostAndPort;->hasBracketlessColons:Z

    .line 84
    return-void
.end method

.method public static fromParts(Ljava/lang/String;I)Lcom/google/common/net/HostAndPort;
    .registers 9
    .param p0, "host"    # Ljava/lang/String;
    .param p1, "port"    # I

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 134
    invoke-static {p1}, Lcom/google/common/net/HostAndPort;->isValidPort(I)Z

    move-result v1

    const-string v4, "Port out of range: %s"

    new-array v5, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v3

    invoke-static {v1, v4, v5}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 135
    invoke-static {p0}, Lcom/google/common/net/HostAndPort;->fromString(Ljava/lang/String;)Lcom/google/common/net/HostAndPort;

    move-result-object v0

    .line 136
    .local v0, "parsedHost":Lcom/google/common/net/HostAndPort;
    invoke-virtual {v0}, Lcom/google/common/net/HostAndPort;->hasPort()Z

    move-result v1

    if-nez v1, :cond_31

    move v1, v2

    :goto_1e
    const-string v4, "Host has a port: %s"

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p0, v2, v3

    invoke-static {v1, v4, v2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 137
    new-instance v1, Lcom/google/common/net/HostAndPort;

    iget-object v2, v0, Lcom/google/common/net/HostAndPort;->host:Ljava/lang/String;

    iget-boolean v3, v0, Lcom/google/common/net/HostAndPort;->hasBracketlessColons:Z

    invoke-direct {v1, v2, p1, v3}, Lcom/google/common/net/HostAndPort;-><init>(Ljava/lang/String;IZ)V

    return-object v1

    :cond_31
    move v1, v3

    .line 136
    goto :goto_1e
.end method

.method public static fromString(Ljava/lang/String;)Lcom/google/common/net/HostAndPort;
    .registers 13
    .param p0, "hostPortString"    # Ljava/lang/String;

    .prologue
    const/16 v10, 0x3a

    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 151
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    const/4 v6, 0x0

    .line 154
    .local v6, "portString":Ljava/lang/String;
    const/4 v2, 0x0

    .line 156
    .local v2, "hasBracketlessColons":Z
    const-string v9, "["

    invoke-virtual {p0, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_49

    .line 157
    invoke-static {p0}, Lcom/google/common/net/HostAndPort;->getHostAndPortFromBracketedHost(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 158
    .local v4, "hostAndPort":[Ljava/lang/String;
    aget-object v3, v4, v8

    .line 159
    .local v3, "host":Ljava/lang/String;
    aget-object v6, v4, v7

    .line 173
    .end local v4    # "hostAndPort":[Ljava/lang/String;
    :goto_19
    const/4 v5, -0x1

    .line 174
    .local v5, "port":I
    invoke-static {v6}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_43

    .line 177
    const-string v9, "+"

    invoke-virtual {v6, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_6a

    move v9, v7

    :goto_29
    const-string v10, "Unparseable port number: %s"

    new-array v11, v7, [Ljava/lang/Object;

    aput-object p0, v11, v8

    invoke-static {v9, v10, v11}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 179
    :try_start_32
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_35
    .catch Ljava/lang/NumberFormatException; {:try_start_32 .. :try_end_35} :catch_6c

    move-result v5

    .line 183
    invoke-static {v5}, Lcom/google/common/net/HostAndPort;->isValidPort(I)Z

    move-result v9

    const-string v10, "Port number out of range: %s"

    new-array v7, v7, [Ljava/lang/Object;

    aput-object p0, v7, v8

    invoke-static {v9, v10, v7}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 186
    :cond_43
    new-instance v7, Lcom/google/common/net/HostAndPort;

    invoke-direct {v7, v3, v5, v2}, Lcom/google/common/net/HostAndPort;-><init>(Ljava/lang/String;IZ)V

    return-object v7

    .line 161
    .end local v3    # "host":Ljava/lang/String;
    .end local v5    # "port":I
    :cond_49
    invoke-virtual {p0, v10}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 162
    .local v0, "colonPos":I
    if-ltz v0, :cond_63

    add-int/lit8 v9, v0, 0x1

    invoke-virtual {p0, v10, v9}, Ljava/lang/String;->indexOf(II)I

    move-result v9

    const/4 v10, -0x1

    if-ne v9, v10, :cond_63

    .line 164
    invoke-virtual {p0, v8, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 165
    .restart local v3    # "host":Ljava/lang/String;
    add-int/lit8 v9, v0, 0x1

    invoke-virtual {p0, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    goto :goto_19

    .line 168
    .end local v3    # "host":Ljava/lang/String;
    :cond_63
    move-object v3, p0

    .line 169
    .restart local v3    # "host":Ljava/lang/String;
    if-ltz v0, :cond_68

    move v2, v7

    :goto_67
    goto :goto_19

    :cond_68
    move v2, v8

    goto :goto_67

    .end local v0    # "colonPos":I
    .restart local v5    # "port":I
    :cond_6a
    move v9, v8

    .line 177
    goto :goto_29

    .line 180
    :catch_6c
    move-exception v1

    .line 181
    .local v1, "e":Ljava/lang/NumberFormatException;
    new-instance v7, Ljava/lang/IllegalArgumentException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unparseable port number: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7
.end method

.method private static getHostAndPortFromBracketedHost(Ljava/lang/String;)[Ljava/lang/String;
    .registers 13
    .param p0, "hostPortString"    # Ljava/lang/String;

    .prologue
    const/16 v11, 0x3a

    const/4 v10, 0x2

    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 197
    const/4 v1, 0x0

    .line 198
    .local v1, "colonIndex":I
    const/4 v0, 0x0

    .line 199
    .local v0, "closeBracketIndex":I
    const/4 v2, 0x0

    .line 200
    .local v2, "hasPort":Z
    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v8, 0x5b

    if-ne v5, v8, :cond_48

    move v5, v6

    :goto_11
    const-string v8, "Bracketed host-port string must start with a bracket: %s"

    new-array v9, v6, [Ljava/lang/Object;

    aput-object p0, v9, v7

    invoke-static {v5, v8, v9}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 202
    invoke-virtual {p0, v11}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 203
    const/16 v5, 0x5d

    invoke-virtual {p0, v5}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 204
    const/4 v5, -0x1

    if-le v1, v5, :cond_4a

    if-le v0, v1, :cond_4a

    move v5, v6

    :goto_2a
    const-string v8, "Invalid bracketed host/port: %s"

    new-array v9, v6, [Ljava/lang/Object;

    aput-object p0, v9, v7

    invoke-static {v5, v8, v9}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 207
    invoke-virtual {p0, v6, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 208
    .local v3, "host":Ljava/lang/String;
    add-int/lit8 v5, v0, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v8

    if-ne v5, v8, :cond_4c

    .line 209
    new-array v5, v10, [Ljava/lang/String;

    aput-object v3, v5, v7

    const-string v7, ""

    aput-object v7, v5, v6

    .line 217
    :goto_47
    return-object v5

    .end local v3    # "host":Ljava/lang/String;
    :cond_48
    move v5, v7

    .line 200
    goto :goto_11

    :cond_4a
    move v5, v7

    .line 204
    goto :goto_2a

    .line 211
    .restart local v3    # "host":Ljava/lang/String;
    :cond_4c
    add-int/lit8 v5, v0, 0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v5, v11, :cond_7a

    move v5, v6

    :goto_55
    const-string v8, "Only a colon may follow a close bracket: %s"

    new-array v9, v6, [Ljava/lang/Object;

    aput-object p0, v9, v7

    invoke-static {v5, v8, v9}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 213
    add-int/lit8 v4, v0, 0x2

    .local v4, "i":I
    :goto_60
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_7c

    .line 214
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->isDigit(C)Z

    move-result v5

    const-string v8, "Port must be numeric: %s"

    new-array v9, v6, [Ljava/lang/Object;

    aput-object p0, v9, v7

    invoke-static {v5, v8, v9}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 213
    add-int/lit8 v4, v4, 0x1

    goto :goto_60

    .end local v4    # "i":I
    :cond_7a
    move v5, v7

    .line 211
    goto :goto_55

    .line 217
    .restart local v4    # "i":I
    :cond_7c
    new-array v5, v10, [Ljava/lang/String;

    aput-object v3, v5, v7

    add-int/lit8 v7, v0, 0x2

    invoke-virtual {p0, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    goto :goto_47
.end method

.method private static isValidPort(I)Z
    .registers 2
    .param p0, "port"    # I

    .prologue
    .line 295
    if-ltz p0, :cond_9

    const v0, 0xffff

    if-gt p0, v0, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "other"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 261
    if-ne p0, p1, :cond_5

    .line 270
    :cond_4
    :goto_4
    return v1

    .line 264
    :cond_5
    instance-of v3, p1, Lcom/google/common/net/HostAndPort;

    if-eqz v3, :cond_24

    move-object v0, p1

    .line 265
    check-cast v0, Lcom/google/common/net/HostAndPort;

    .line 266
    .local v0, "that":Lcom/google/common/net/HostAndPort;
    iget-object v3, p0, Lcom/google/common/net/HostAndPort;->host:Ljava/lang/String;

    iget-object v4, v0, Lcom/google/common/net/HostAndPort;->host:Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_22

    iget v3, p0, Lcom/google/common/net/HostAndPort;->port:I

    iget v4, v0, Lcom/google/common/net/HostAndPort;->port:I

    if-ne v3, v4, :cond_22

    iget-boolean v3, p0, Lcom/google/common/net/HostAndPort;->hasBracketlessColons:Z

    iget-boolean v4, v0, Lcom/google/common/net/HostAndPort;->hasBracketlessColons:Z

    if-eq v3, v4, :cond_4

    :cond_22
    move v1, v2

    goto :goto_4

    .end local v0    # "that":Lcom/google/common/net/HostAndPort;
    :cond_24
    move v1, v2

    .line 270
    goto :goto_4
.end method

.method public getHostText()Ljava/lang/String;
    .registers 2

    .prologue
    .line 94
    iget-object v0, p0, Lcom/google/common/net/HostAndPort;->host:Ljava/lang/String;

    return-object v0
.end method

.method public getPort()I
    .registers 2

    .prologue
    .line 110
    invoke-virtual {p0}, Lcom/google/common/net/HostAndPort;->hasPort()Z

    move-result v0

    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 111
    iget v0, p0, Lcom/google/common/net/HostAndPort;->port:I

    return v0
.end method

.method public getPortOrDefault(I)I
    .registers 3
    .param p1, "defaultPort"    # I

    .prologue
    .line 118
    invoke-virtual {p0}, Lcom/google/common/net/HostAndPort;->hasPort()Z

    move-result v0

    if-eqz v0, :cond_8

    iget p1, p0, Lcom/google/common/net/HostAndPort;->port:I

    .end local p1    # "defaultPort":I
    :cond_8
    return p1
.end method

.method public hasPort()Z
    .registers 2

    .prologue
    .line 99
    iget v0, p0, Lcom/google/common/net/HostAndPort;->port:I

    if-ltz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 275
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/google/common/net/HostAndPort;->host:Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget v2, p0, Lcom/google/common/net/HostAndPort;->port:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-boolean v2, p0, Lcom/google/common/net/HostAndPort;->hasBracketlessColons:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/google/common/base/Objects;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public requireBracketsForIPv6()Lcom/google/common/net/HostAndPort;
    .registers 6

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 255
    iget-boolean v0, p0, Lcom/google/common/net/HostAndPort;->hasBracketlessColons:Z

    if-nez v0, :cond_13

    move v0, v1

    :goto_7
    const-string v3, "Possible bracketless IPv6 literal: %s"

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/google/common/net/HostAndPort;->host:Ljava/lang/String;

    aput-object v4, v1, v2

    invoke-static {v0, v3, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 256
    return-object p0

    :cond_13
    move v0, v2

    .line 255
    goto :goto_7
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    const/16 v3, 0x3a

    .line 281
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/common/net/HostAndPort;->host:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x7

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 282
    .local v0, "builder":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/google/common/net/HostAndPort;->host:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-ltz v1, :cond_3c

    .line 283
    const/16 v1, 0x5b

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/common/net/HostAndPort;->host:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x5d

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 287
    :goto_28
    invoke-virtual {p0}, Lcom/google/common/net/HostAndPort;->hasPort()Z

    move-result v1

    if-eqz v1, :cond_37

    .line 288
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/google/common/net/HostAndPort;->port:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 290
    :cond_37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 285
    :cond_3c
    iget-object v1, p0, Lcom/google/common/net/HostAndPort;->host:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_28
.end method

.method public withDefaultPort(I)Lcom/google/common/net/HostAndPort;
    .registers 5
    .param p1, "defaultPort"    # I

    .prologue
    .line 232
    invoke-static {p1}, Lcom/google/common/net/HostAndPort;->isValidPort(I)Z

    move-result v0

    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 233
    invoke-virtual {p0}, Lcom/google/common/net/HostAndPort;->hasPort()Z

    move-result v0

    if-nez v0, :cond_11

    iget v0, p0, Lcom/google/common/net/HostAndPort;->port:I

    if-ne v0, p1, :cond_12

    .line 236
    .end local p0    # "this":Lcom/google/common/net/HostAndPort;
    :cond_11
    :goto_11
    return-object p0

    .restart local p0    # "this":Lcom/google/common/net/HostAndPort;
    :cond_12
    new-instance v0, Lcom/google/common/net/HostAndPort;

    iget-object v1, p0, Lcom/google/common/net/HostAndPort;->host:Ljava/lang/String;

    iget-boolean v2, p0, Lcom/google/common/net/HostAndPort;->hasBracketlessColons:Z

    invoke-direct {v0, v1, p1, v2}, Lcom/google/common/net/HostAndPort;-><init>(Ljava/lang/String;IZ)V

    move-object p0, v0

    goto :goto_11
.end method
