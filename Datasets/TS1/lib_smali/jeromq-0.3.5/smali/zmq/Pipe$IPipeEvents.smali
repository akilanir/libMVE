.class interface abstract Lzmq/Pipe$IPipeEvents;
.super Ljava/lang/Object;
.source "Pipe.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lzmq/Pipe;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x608
    name = "IPipeEvents"
.end annotation


# virtual methods
.method public abstract hiccuped(Lzmq/Pipe;)V
.end method

.method public abstract pipeTerminated(Lzmq/Pipe;)V
.end method

.method public abstract readActivated(Lzmq/Pipe;)V
.end method

.method public abstract writeActivated(Lzmq/Pipe;)V
.end method
