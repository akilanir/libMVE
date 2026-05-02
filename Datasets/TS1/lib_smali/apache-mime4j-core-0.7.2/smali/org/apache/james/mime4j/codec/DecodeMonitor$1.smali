.class final Lorg/apache/james/mime4j/codec/DecodeMonitor$1;
.super Lorg/apache/james/mime4j/codec/DecodeMonitor;
.source "DecodeMonitor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/james/mime4j/codec/DecodeMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 37
    invoke-direct {p0}, Lorg/apache/james/mime4j/codec/DecodeMonitor;-><init>()V

    return-void
.end method


# virtual methods
.method public isListening()Z
    .registers 2

    .prologue
    .line 46
    const/4 v0, 0x1

    return v0
.end method

.method public warn(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4
    .param p1, "error"    # Ljava/lang/String;
    .param p2, "dropDesc"    # Ljava/lang/String;

    .prologue
    .line 41
    const/4 v0, 0x1

    return v0
.end method
