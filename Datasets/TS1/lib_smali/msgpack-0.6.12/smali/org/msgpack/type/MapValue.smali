.class public interface abstract Lorg/msgpack/type/MapValue;
.super Ljava/lang/Object;
.source "MapValue.java"

# interfaces
.implements Lorg/msgpack/type/Value;
.implements Ljava/util/Map;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/msgpack/type/Value;",
        "Ljava/util/Map",
        "<",
        "Lorg/msgpack/type/Value;",
        "Lorg/msgpack/type/Value;",
        ">;"
    }
.end annotation


# virtual methods
.method public abstract getKeyValueArray()[Lorg/msgpack/type/Value;
.end method
