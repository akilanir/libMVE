.class public Lorg/msgpack/template/DateTemplate;
.super Lorg/msgpack/template/AbstractTemplate;
.source "DateTemplate.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/msgpack/template/AbstractTemplate",
        "<",
        "Ljava/util/Date;",
        ">;"
    }
.end annotation


# static fields
.field static final instance:Lorg/msgpack/template/DateTemplate;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 55
    new-instance v0, Lorg/msgpack/template/DateTemplate;

    invoke-direct {v0}, Lorg/msgpack/template/DateTemplate;-><init>()V

    sput-object v0, Lorg/msgpack/template/DateTemplate;->instance:Lorg/msgpack/template/DateTemplate;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Lorg/msgpack/template/AbstractTemplate;-><init>()V

    .line 29
    return-void
.end method

.method public static getInstance()Lorg/msgpack/template/DateTemplate;
    .registers 1

    .prologue
    .line 52
    sget-object v0, Lorg/msgpack/template/DateTemplate;->instance:Lorg/msgpack/template/DateTemplate;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;Z)Ljava/lang/Object;
    .registers 5
    .param p1, "x0"    # Lorg/msgpack/unpacker/Unpacker;
    .param p2, "x1"    # Ljava/lang/Object;
    .param p3, "x2"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 27
    check-cast p2, Ljava/util/Date;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/template/DateTemplate;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/util/Date;Z)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public read(Lorg/msgpack/unpacker/Unpacker;Ljava/util/Date;Z)Ljava/util/Date;
    .registers 7
    .param p1, "u"    # Lorg/msgpack/unpacker/Unpacker;
    .param p2, "to"    # Ljava/util/Date;
    .param p3, "required"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 44
    if-nez p3, :cond_a

    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->trySkipNil()Z

    move-result v2

    if-eqz v2, :cond_a

    .line 45
    const/4 v2, 0x0

    .line 48
    :goto_9
    return-object v2

    .line 47
    :cond_a
    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->readLong()J

    move-result-wide v0

    .line 48
    .local v0, "temp":J
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2, v0, v1}, Ljava/util/Date;-><init>(J)V

    goto :goto_9
.end method

.method public bridge synthetic write(Lorg/msgpack/packer/Packer;Ljava/lang/Object;Z)V
    .registers 4
    .param p1, "x0"    # Lorg/msgpack/packer/Packer;
    .param p2, "x1"    # Ljava/lang/Object;
    .param p3, "x2"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 27
    check-cast p2, Ljava/util/Date;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/template/DateTemplate;->write(Lorg/msgpack/packer/Packer;Ljava/util/Date;Z)V

    return-void
.end method

.method public write(Lorg/msgpack/packer/Packer;Ljava/util/Date;Z)V
    .registers 6
    .param p1, "pk"    # Lorg/msgpack/packer/Packer;
    .param p2, "target"    # Ljava/util/Date;
    .param p3, "required"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 33
    if-nez p2, :cond_10

    .line 34
    if-eqz p3, :cond_c

    .line 35
    new-instance v0, Lorg/msgpack/MessageTypeException;

    const-string v1, "Attempted to write null"

    invoke-direct {v0, v1}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 37
    :cond_c
    invoke-interface {p1}, Lorg/msgpack/packer/Packer;->writeNil()Lorg/msgpack/packer/Packer;

    .line 41
    :goto_f
    return-void

    .line 40
    :cond_10
    invoke-virtual {p2}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-interface {p1, v0, v1}, Lorg/msgpack/packer/Packer;->write(J)Lorg/msgpack/packer/Packer;

    goto :goto_f
.end method
