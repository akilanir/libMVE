.class public Lorg/msgpack/template/OrdinalEnumTemplate;
.super Lorg/msgpack/template/AbstractTemplate;
.source "OrdinalEnumTemplate.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/msgpack/template/AbstractTemplate",
        "<TT;>;"
    }
.end annotation


# instance fields
.field protected entries:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TT;"
        }
    .end annotation
.end field

.field protected reverse:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<TT;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field protected strict:Z


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 33
    .local p0, "this":Lorg/msgpack/template/OrdinalEnumTemplate;, "Lorg/msgpack/template/OrdinalEnumTemplate<TT;>;"
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-direct {p0}, Lorg/msgpack/template/AbstractTemplate;-><init>()V

    .line 34
    invoke-virtual {p1}, Ljava/lang/Class;->getEnumConstants()[Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p0, Lorg/msgpack/template/OrdinalEnumTemplate;->entries:[Ljava/lang/Object;

    .line 35
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lorg/msgpack/template/OrdinalEnumTemplate;->reverse:Ljava/util/HashMap;

    .line 36
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_11
    iget-object v1, p0, Lorg/msgpack/template/OrdinalEnumTemplate;->entries:[Ljava/lang/Object;

    array-length v1, v1

    if-ge v0, v1, :cond_26

    .line 37
    iget-object v1, p0, Lorg/msgpack/template/OrdinalEnumTemplate;->reverse:Ljava/util/HashMap;

    iget-object v2, p0, Lorg/msgpack/template/OrdinalEnumTemplate;->entries:[Ljava/lang/Object;

    aget-object v2, v2, v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    add-int/lit8 v0, v0, 0x1

    goto :goto_11

    .line 39
    :cond_26
    const-class v1, Lorg/msgpack/annotation/OrdinalEnum;

    invoke-virtual {p1, v1}, Ljava/lang/Class;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_3c

    const-class v1, Lorg/msgpack/annotation/OrdinalEnum;

    invoke-virtual {p1, v1}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    check-cast v1, Lorg/msgpack/annotation/OrdinalEnum;

    invoke-interface {v1}, Lorg/msgpack/annotation/OrdinalEnum;->strict()Z

    move-result v1

    if-eqz v1, :cond_40

    :cond_3c
    const/4 v1, 0x1

    :goto_3d
    iput-boolean v1, p0, Lorg/msgpack/template/OrdinalEnumTemplate;->strict:Z

    .line 41
    return-void

    .line 39
    :cond_40
    const/4 v1, 0x0

    goto :goto_3d
.end method


# virtual methods
.method public read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;Z)Ljava/lang/Object;
    .registers 9
    .param p1, "pac"    # Lorg/msgpack/unpacker/Unpacker;
    .param p3, "required"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/msgpack/unpacker/Unpacker;",
            "TT;Z)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/msgpack/MessageTypeException;
        }
    .end annotation

    .prologue
    .local p0, "this":Lorg/msgpack/template/OrdinalEnumTemplate;, "Lorg/msgpack/template/OrdinalEnumTemplate<TT;>;"
    .local p2, "to":Ljava/lang/Object;, "TT;"
    const/4 v1, 0x0

    .line 63
    if-nez p3, :cond_a

    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->trySkipNil()Z

    move-result v2

    if-eqz v2, :cond_a

    .line 74
    :cond_9
    :goto_9
    return-object v1

    .line 67
    :cond_a
    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->readInt()I

    move-result v0

    .line 69
    .local v0, "ordinal":I
    iget-object v2, p0, Lorg/msgpack/template/OrdinalEnumTemplate;->entries:[Ljava/lang/Object;

    array-length v2, v2

    if-ge v0, v2, :cond_18

    .line 70
    iget-object v1, p0, Lorg/msgpack/template/OrdinalEnumTemplate;->entries:[Ljava/lang/Object;

    aget-object v1, v1, v0

    goto :goto_9

    .line 73
    :cond_18
    iget-boolean v2, p0, Lorg/msgpack/template/OrdinalEnumTemplate;->strict:Z

    if-eqz v2, :cond_9

    .line 77
    new-instance v1, Lorg/msgpack/MessageTypeException;

    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ordinal: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v2}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public write(Lorg/msgpack/packer/Packer;Ljava/lang/Object;Z)V
    .registers 9
    .param p1, "pk"    # Lorg/msgpack/packer/Packer;
    .param p3, "required"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/msgpack/packer/Packer;",
            "TT;Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 45
    .local p0, "this":Lorg/msgpack/template/OrdinalEnumTemplate;, "Lorg/msgpack/template/OrdinalEnumTemplate<TT;>;"
    .local p2, "target":Ljava/lang/Object;, "TT;"
    if-nez p2, :cond_10

    .line 46
    if-eqz p3, :cond_c

    .line 47
    new-instance v1, Lorg/msgpack/MessageTypeException;

    const-string v2, "Attempted to write null"

    invoke-direct {v1, v2}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 49
    :cond_c
    invoke-interface {p1}, Lorg/msgpack/packer/Packer;->writeNil()Lorg/msgpack/packer/Packer;

    .line 58
    :goto_f
    return-void

    .line 52
    :cond_10
    iget-object v1, p0, Lorg/msgpack/template/OrdinalEnumTemplate;->reverse:Ljava/util/HashMap;

    invoke-virtual {v1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 53
    .local v0, "ordinal":Ljava/lang/Integer;
    if-nez v0, :cond_38

    .line 54
    new-instance v1, Lorg/msgpack/MessageTypeException;

    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ordinal: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v2}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 57
    :cond_38
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-interface {p1, v1}, Lorg/msgpack/packer/Packer;->write(I)Lorg/msgpack/packer/Packer;

    goto :goto_f
.end method
