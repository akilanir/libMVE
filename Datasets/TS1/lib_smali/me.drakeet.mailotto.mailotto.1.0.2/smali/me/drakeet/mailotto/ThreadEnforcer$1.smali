.class final Lme/drakeet/mailotto/ThreadEnforcer$1;
.super Ljava/lang/Object;
.source "ThreadEnforcer.java"

# interfaces
.implements Lme/drakeet/mailotto/ThreadEnforcer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lme/drakeet/mailotto/ThreadEnforcer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public enforce(Lme/drakeet/mailotto/Mailbox;)V
    .registers 2
    .param p1, "mailbox"    # Lme/drakeet/mailotto/Mailbox;

    .prologue
    .line 44
    return-void
.end method
