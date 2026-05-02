.class public Lorg/apache/http/message/BasicHeaderElement;
.super Ljava/lang/Object;
.source "BasicHeaderElement.java"

# interfaces
.implements Lorg/apache/http/HeaderElement;
.implements Ljava/lang/Cloneable;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private final name:Ljava/lang/String;

.field private final parameters:[Lorg/apache/http/NameValuePair;

.field private final value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 79
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/http/message/BasicHeaderElement;-><init>(Ljava/lang/String;Ljava/lang/String;[Lorg/apache/http/NameValuePair;)V

    .line 80
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;[Lorg/apache/http/NameValuePair;)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "parameters"    # [Lorg/apache/http/NameValuePair;

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    if-nez p1, :cond_d

    .line 61
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Name may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 63
    :cond_d
    iput-object p1, p0, Lorg/apache/http/message/BasicHeaderElement;->name:Ljava/lang/String;

    .line 64
    iput-object p2, p0, Lorg/apache/http/message/BasicHeaderElement;->value:Ljava/lang/String;

    .line 65
    if-eqz p3, :cond_16

    .line 66
    iput-object p3, p0, Lorg/apache/http/message/BasicHeaderElement;->parameters:[Lorg/apache/http/NameValuePair;

    .line 70
    :goto_15
    return-void

    .line 68
    :cond_16
    const/4 v0, 0x0

    new-array v0, v0, [Lorg/apache/http/NameValuePair;

    iput-object v0, p0, Lorg/apache/http/message/BasicHeaderElement;->parameters:[Lorg/apache/http/NameValuePair;

    goto :goto_15
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 161
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 120
    if-ne p0, p1, :cond_5

    .line 127
    :cond_4
    :goto_4
    return v1

    .line 121
    :cond_5
    instance-of v3, p1, Lorg/apache/http/HeaderElement;

    if-eqz v3, :cond_2c

    move-object v0, p1

    .line 122
    check-cast v0, Lorg/apache/http/message/BasicHeaderElement;

    .line 123
    .local v0, "that":Lorg/apache/http/message/BasicHeaderElement;
    iget-object v3, p0, Lorg/apache/http/message/BasicHeaderElement;->name:Ljava/lang/String;

    iget-object v4, v0, Lorg/apache/http/message/BasicHeaderElement;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2a

    iget-object v3, p0, Lorg/apache/http/message/BasicHeaderElement;->value:Ljava/lang/String;

    iget-object v4, v0, Lorg/apache/http/message/BasicHeaderElement;->value:Ljava/lang/String;

    invoke-static {v3, v4}, Lorg/apache/http/util/LangUtils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2a

    iget-object v3, p0, Lorg/apache/http/message/BasicHeaderElement;->parameters:[Lorg/apache/http/NameValuePair;

    iget-object v4, v0, Lorg/apache/http/message/BasicHeaderElement;->parameters:[Lorg/apache/http/NameValuePair;

    invoke-static {v3, v4}, Lorg/apache/http/util/LangUtils;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    :cond_2a
    move v1, v2

    goto :goto_4

    .end local v0    # "that":Lorg/apache/http/message/BasicHeaderElement;
    :cond_2c
    move v1, v2

    .line 127
    goto :goto_4
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 83
    iget-object v0, p0, Lorg/apache/http/message/BasicHeaderElement;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getParameter(I)Lorg/apache/http/NameValuePair;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 100
    iget-object v0, p0, Lorg/apache/http/message/BasicHeaderElement;->parameters:[Lorg/apache/http/NameValuePair;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getParameterByName(Ljava/lang/String;)Lorg/apache/http/NameValuePair;
    .registers 7
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 104
    if-nez p1, :cond_a

    .line 105
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Name may not be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 107
    :cond_a
    const/4 v1, 0x0

    .line 108
    .local v1, "found":Lorg/apache/http/NameValuePair;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_c
    iget-object v3, p0, Lorg/apache/http/message/BasicHeaderElement;->parameters:[Lorg/apache/http/NameValuePair;

    array-length v3, v3

    if-ge v2, v3, :cond_20

    .line 109
    iget-object v3, p0, Lorg/apache/http/message/BasicHeaderElement;->parameters:[Lorg/apache/http/NameValuePair;

    aget-object v0, v3, v2

    .line 110
    .local v0, "current":Lorg/apache/http/NameValuePair;
    invoke-interface {v0}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_21

    .line 111
    move-object v1, v0

    .line 115
    .end local v0    # "current":Lorg/apache/http/NameValuePair;
    :cond_20
    return-object v1

    .line 108
    .restart local v0    # "current":Lorg/apache/http/NameValuePair;
    :cond_21
    add-int/lit8 v2, v2, 0x1

    goto :goto_c
.end method

.method public getParameterCount()I
    .registers 2

    .prologue
    .line 95
    iget-object v0, p0, Lorg/apache/http/message/BasicHeaderElement;->parameters:[Lorg/apache/http/NameValuePair;

    array-length v0, v0

    return v0
.end method

.method public getParameters()[Lorg/apache/http/NameValuePair;
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lorg/apache/http/message/BasicHeaderElement;->parameters:[Lorg/apache/http/NameValuePair;

    invoke-virtual {v0}, [Lorg/apache/http/NameValuePair;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/http/NameValuePair;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .registers 2

    .prologue
    .line 87
    iget-object v0, p0, Lorg/apache/http/message/BasicHeaderElement;->value:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 133
    const/16 v0, 0x11

    .line 134
    .local v0, "hash":I
    iget-object v2, p0, Lorg/apache/http/message/BasicHeaderElement;->name:Ljava/lang/String;

    invoke-static {v0, v2}, Lorg/apache/http/util/LangUtils;->hashCode(ILjava/lang/Object;)I

    move-result v0

    .line 135
    iget-object v2, p0, Lorg/apache/http/message/BasicHeaderElement;->value:Ljava/lang/String;

    invoke-static {v0, v2}, Lorg/apache/http/util/LangUtils;->hashCode(ILjava/lang/Object;)I

    move-result v0

    .line 136
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_f
    iget-object v2, p0, Lorg/apache/http/message/BasicHeaderElement;->parameters:[Lorg/apache/http/NameValuePair;

    array-length v2, v2

    if-ge v1, v2, :cond_1f

    .line 137
    iget-object v2, p0, Lorg/apache/http/message/BasicHeaderElement;->parameters:[Lorg/apache/http/NameValuePair;

    aget-object v2, v2, v1

    invoke-static {v0, v2}, Lorg/apache/http/util/LangUtils;->hashCode(ILjava/lang/Object;)I

    move-result v0

    .line 136
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 139
    :cond_1f
    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 144
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 145
    .local v0, "buffer":Ljava/lang/StringBuilder;
    iget-object v2, p0, Lorg/apache/http/message/BasicHeaderElement;->name:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    iget-object v2, p0, Lorg/apache/http/message/BasicHeaderElement;->value:Ljava/lang/String;

    if-eqz v2, :cond_18

    .line 147
    const-string v2, "="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    iget-object v2, p0, Lorg/apache/http/message/BasicHeaderElement;->value:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    :cond_18
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_19
    iget-object v2, p0, Lorg/apache/http/message/BasicHeaderElement;->parameters:[Lorg/apache/http/NameValuePair;

    array-length v2, v2

    if-ge v1, v2, :cond_2d

    .line 151
    const-string v2, "; "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    iget-object v2, p0, Lorg/apache/http/message/BasicHeaderElement;->parameters:[Lorg/apache/http/NameValuePair;

    aget-object v2, v2, v1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 150
    add-int/lit8 v1, v1, 0x1

    goto :goto_19

    .line 154
    :cond_2d
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
