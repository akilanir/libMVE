.class public abstract Lkorex/mail/event/MailEvent;
.super Ljava/util/EventObject;
.source "MailEvent.java"


# static fields
.field private static final serialVersionUID:J = 0x199f49e8c4a31af7L


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .registers 2
    .param p1, "source"    # Ljava/lang/Object;

    .prologue
    .line 60
    invoke-direct {p0, p1}, Ljava/util/EventObject;-><init>(Ljava/lang/Object;)V

    .line 61
    return-void
.end method


# virtual methods
.method public abstract dispatch(Ljava/lang/Object;)V
.end method
