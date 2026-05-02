.class public Lorg/jsoup/nodes/Attribute;
.super Ljava/lang/Object;
.source "Attribute.java"

# interfaces
.implements Ljava/util/Map$Entry;
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Map$Entry",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;",
        "Ljava/lang/Cloneable;"
    }
.end annotation


# static fields
.field private static final booleanAttributes:[Ljava/lang/String;


# instance fields
.field private key:Ljava/lang/String;

.field private value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 15
    const/16 v0, 0x1e

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "allowfullscreen"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "async"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "autofocus"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "checked"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "compact"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "declare"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "default"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "defer"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "disabled"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "formnovalidate"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "hidden"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "inert"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "ismap"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "itemscope"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "multiple"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "muted"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "nohref"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string v2, "noresize"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string v2, "noshade"

    aput-object v2, v0, v1

    const/16 v1, 0x13

    const-string v2, "novalidate"

    aput-object v2, v0, v1

    const/16 v1, 0x14

    const-string v2, "nowrap"

    aput-object v2, v0, v1

    const/16 v1, 0x15

    const-string v2, "open"

    aput-object v2, v0, v1

    const/16 v1, 0x16

    const-string v2, "readonly"

    aput-object v2, v0, v1

    const/16 v1, 0x17

    const-string v2, "required"

    aput-object v2, v0, v1

    const/16 v1, 0x18

    const-string v2, "reversed"

    aput-object v2, v0, v1

    const/16 v1, 0x19

    const-string v2, "seamless"

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    const-string v2, "selected"

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    const-string v2, "sortable"

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    const-string v2, "truespeed"

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    const-string v2, "typemustmatch"

    aput-object v2, v0, v1

    sput-object v0, Lorg/jsoup/nodes/Attribute;->booleanAttributes:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 33
    invoke-static {p2}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 34
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jsoup/nodes/Attribute;->key:Ljava/lang/String;

    .line 35
    iput-object p2, p0, Lorg/jsoup/nodes/Attribute;->value:Ljava/lang/String;

    .line 36
    return-void
.end method

.method public static createFromEncoded(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Attribute;
    .registers 4
    .param p0, "unencodedKey"    # Ljava/lang/String;
    .param p1, "encodedValue"    # Ljava/lang/String;

    .prologue
    .line 114
    const/4 v1, 0x1

    invoke-static {p1, v1}, Lorg/jsoup/nodes/Entities;->unescape(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 115
    .local v0, "value":Ljava/lang/String;
    new-instance v1, Lorg/jsoup/nodes/Attribute;

    invoke-direct {v1, p0, v0}, Lorg/jsoup/nodes/Attribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method


# virtual methods
.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 14
    invoke-virtual {p0}, Lorg/jsoup/nodes/Attribute;->clone()Lorg/jsoup/nodes/Attribute;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/jsoup/nodes/Attribute;
    .registers 3

    .prologue
    .line 159
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Attribute;
    :try_end_6
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_6} :catch_7

    return-object v1

    .line 160
    :catch_7
    move-exception v0

    .line 161
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 140
    if-ne p0, p1, :cond_5

    .line 146
    :cond_4
    :goto_4
    return v1

    .line 141
    :cond_5
    instance-of v3, p1, Lorg/jsoup/nodes/Attribute;

    if-nez v3, :cond_b

    move v1, v2

    goto :goto_4

    :cond_b
    move-object v0, p1

    .line 143
    check-cast v0, Lorg/jsoup/nodes/Attribute;

    .line 145
    .local v0, "attribute":Lorg/jsoup/nodes/Attribute;
    iget-object v3, p0, Lorg/jsoup/nodes/Attribute;->key:Ljava/lang/String;

    if-eqz v3, :cond_1e

    iget-object v3, p0, Lorg/jsoup/nodes/Attribute;->key:Ljava/lang/String;

    iget-object v4, v0, Lorg/jsoup/nodes/Attribute;->key:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_22

    :cond_1c
    move v1, v2

    goto :goto_4

    :cond_1e
    iget-object v3, v0, Lorg/jsoup/nodes/Attribute;->key:Ljava/lang/String;

    if-nez v3, :cond_1c

    .line 146
    :cond_22
    iget-object v3, p0, Lorg/jsoup/nodes/Attribute;->value:Ljava/lang/String;

    if-eqz v3, :cond_32

    iget-object v3, p0, Lorg/jsoup/nodes/Attribute;->value:Ljava/lang/String;

    iget-object v4, v0, Lorg/jsoup/nodes/Attribute;->value:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    :cond_30
    move v1, v2

    goto :goto_4

    :cond_32
    iget-object v3, v0, Lorg/jsoup/nodes/Attribute;->value:Ljava/lang/String;

    if-nez v3, :cond_30

    goto :goto_4
.end method

.method public bridge synthetic getKey()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 14
    invoke-virtual {p0}, Lorg/jsoup/nodes/Attribute;->getKey()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 43
    iget-object v0, p0, Lorg/jsoup/nodes/Attribute;->key:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic getValue()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 14
    invoke-virtual {p0}, Lorg/jsoup/nodes/Attribute;->getValue()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .registers 2

    .prologue
    .line 60
    iget-object v0, p0, Lorg/jsoup/nodes/Attribute;->value:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 151
    iget-object v2, p0, Lorg/jsoup/nodes/Attribute;->key:Ljava/lang/String;

    if-eqz v2, :cond_1a

    iget-object v2, p0, Lorg/jsoup/nodes/Attribute;->key:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 152
    .local v0, "result":I
    :goto_b
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Lorg/jsoup/nodes/Attribute;->value:Ljava/lang/String;

    if-eqz v3, :cond_17

    iget-object v1, p0, Lorg/jsoup/nodes/Attribute;->value:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :cond_17
    add-int v0, v2, v1

    .line 153
    return v0

    .end local v0    # "result":I
    :cond_1a
    move v0, v1

    .line 151
    goto :goto_b
.end method

.method public html()Ljava/lang/String;
    .registers 5

    .prologue
    .line 79
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 82
    .local v0, "accum":Ljava/lang/StringBuilder;
    :try_start_5
    new-instance v2, Lorg/jsoup/nodes/Document;

    const-string v3, ""

    invoke-direct {v2, v3}, Lorg/jsoup/nodes/Document;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lorg/jsoup/nodes/Document;->outputSettings()Lorg/jsoup/nodes/Document$OutputSettings;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lorg/jsoup/nodes/Attribute;->html(Ljava/lang/Appendable;Lorg/jsoup/nodes/Document$OutputSettings;)V
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_13} :catch_18

    .line 86
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 83
    :catch_18
    move-exception v1

    .line 84
    .local v1, "exception":Ljava/io/IOException;
    new-instance v2, Lorg/jsoup/SerializationException;

    invoke-direct {v2, v1}, Lorg/jsoup/SerializationException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method protected html(Ljava/lang/Appendable;Lorg/jsoup/nodes/Document$OutputSettings;)V
    .registers 9
    .param p1, "accum"    # Ljava/lang/Appendable;
    .param p2, "out"    # Lorg/jsoup/nodes/Document$OutputSettings;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 90
    iget-object v0, p0, Lorg/jsoup/nodes/Attribute;->key:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 91
    invoke-virtual {p0, p2}, Lorg/jsoup/nodes/Attribute;->shouldCollapseAttribute(Lorg/jsoup/nodes/Document$OutputSettings;)Z

    move-result v0

    if-nez v0, :cond_1f

    .line 92
    const-string v0, "=\""

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 93
    iget-object v1, p0, Lorg/jsoup/nodes/Attribute;->value:Ljava/lang/String;

    const/4 v3, 0x1

    move-object v0, p1

    move-object v2, p2

    move v5, v4

    invoke-static/range {v0 .. v5}, Lorg/jsoup/nodes/Entities;->escape(Ljava/lang/Appendable;Ljava/lang/String;Lorg/jsoup/nodes/Document$OutputSettings;ZZZ)V

    .line 94
    const/16 v0, 0x22

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 96
    :cond_1f
    return-void
.end method

.method protected isBooleanAttribute()Z
    .registers 3

    .prologue
    .line 135
    sget-object v0, Lorg/jsoup/nodes/Attribute;->booleanAttributes:[Ljava/lang/String;

    iget-object v1, p0, Lorg/jsoup/nodes/Attribute;->key:Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/util/Arrays;->binarySearch([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method protected isDataAttribute()Z
    .registers 3

    .prologue
    .line 119
    iget-object v0, p0, Lorg/jsoup/nodes/Attribute;->key:Ljava/lang/String;

    const-string v1, "data-"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1a

    iget-object v0, p0, Lorg/jsoup/nodes/Attribute;->key:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const-string v1, "data-"

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-le v0, v1, :cond_1a

    const/4 v0, 0x1

    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method

.method public setKey(Ljava/lang/String;)V
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 51
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 52
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jsoup/nodes/Attribute;->key:Ljava/lang/String;

    .line 53
    return-void
.end method

.method public bridge synthetic setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 14
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lorg/jsoup/nodes/Attribute;->setValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setValue(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 68
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 69
    iget-object v0, p0, Lorg/jsoup/nodes/Attribute;->value:Ljava/lang/String;

    .line 70
    .local v0, "old":Ljava/lang/String;
    iput-object p1, p0, Lorg/jsoup/nodes/Attribute;->value:Ljava/lang/String;

    .line 71
    return-object v0
.end method

.method protected final shouldCollapseAttribute(Lorg/jsoup/nodes/Document$OutputSettings;)Z
    .registers 4
    .param p1, "out"    # Lorg/jsoup/nodes/Document$OutputSettings;

    .prologue
    .line 129
    const-string v0, ""

    iget-object v1, p0, Lorg/jsoup/nodes/Attribute;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    iget-object v0, p0, Lorg/jsoup/nodes/Attribute;->value:Ljava/lang/String;

    iget-object v1, p0, Lorg/jsoup/nodes/Attribute;->key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_24

    .line 130
    :cond_14
    invoke-virtual {p1}, Lorg/jsoup/nodes/Document$OutputSettings;->syntax()Lorg/jsoup/nodes/Document$OutputSettings$Syntax;

    move-result-object v0

    sget-object v1, Lorg/jsoup/nodes/Document$OutputSettings$Syntax;->html:Lorg/jsoup/nodes/Document$OutputSettings$Syntax;

    if-ne v0, v1, :cond_24

    .line 131
    invoke-virtual {p0}, Lorg/jsoup/nodes/Attribute;->isBooleanAttribute()Z

    move-result v0

    if-eqz v0, :cond_24

    const/4 v0, 0x1

    :goto_23
    return v0

    :cond_24
    const/4 v0, 0x0

    goto :goto_23
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 104
    invoke-virtual {p0}, Lorg/jsoup/nodes/Attribute;->html()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
