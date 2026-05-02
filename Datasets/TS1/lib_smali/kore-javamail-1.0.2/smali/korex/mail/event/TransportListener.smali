.class public interface abstract Lkorex/mail/event/TransportListener;
.super Ljava/lang/Object;
.source "TransportListener.java"

# interfaces
.implements Ljava/util/EventListener;


# virtual methods
.method public abstract messageDelivered(Lkorex/mail/event/TransportEvent;)V
.end method

.method public abstract messageNotDelivered(Lkorex/mail/event/TransportEvent;)V
.end method

.method public abstract messagePartiallyDelivered(Lkorex/mail/event/TransportEvent;)V
.end method
