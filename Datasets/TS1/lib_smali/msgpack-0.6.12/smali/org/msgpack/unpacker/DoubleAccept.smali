.class final Lorg/msgpack/unpacker/DoubleAccept;
.super Lorg/msgpack/unpacker/Accept;
.source "DoubleAccept.java"


# instance fields
.field value:D


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 24
    const-string v0, "float"

    invoke-direct {p0, v0}, Lorg/msgpack/unpacker/Accept;-><init>(Ljava/lang/String;)V

    .line 25
    return-void
.end method


# virtual methods
.method acceptDouble(D)V
    .registers 3
    .param p1, "v"    # D

    .prologue
    .line 34
    iput-wide p1, p0, Lorg/msgpack/unpacker/DoubleAccept;->value:D

    .line 35
    return-void
.end method

.method acceptFloat(F)V
    .registers 4
    .param p1, "v"    # F

    .prologue
    .line 29
    float-to-double v0, p1

    iput-wide v0, p0, Lorg/msgpack/unpacker/DoubleAccept;->value:D

    .line 30
    return-void
.end method
