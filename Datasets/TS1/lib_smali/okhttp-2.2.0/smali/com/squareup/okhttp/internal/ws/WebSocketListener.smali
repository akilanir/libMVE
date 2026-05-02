.class public interface abstract Lcom/squareup/okhttp/internal/ws/WebSocketListener;
.super Ljava/lang/Object;
.source "WebSocketListener.java"


# virtual methods
.method public abstract onClose(ILjava/lang/String;)V
.end method

.method public abstract onFailure(Ljava/io/IOException;)V
.end method

.method public abstract onMessage(Lokio/BufferedSource;Lcom/squareup/okhttp/internal/ws/WebSocket$PayloadType;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
