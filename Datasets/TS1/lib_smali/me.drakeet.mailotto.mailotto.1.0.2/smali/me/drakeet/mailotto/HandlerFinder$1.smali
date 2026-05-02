.class final Lme/drakeet/mailotto/HandlerFinder$1;
.super Ljava/lang/Object;
.source "HandlerFinder.java"

# interfaces
.implements Lme/drakeet/mailotto/HandlerFinder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lme/drakeet/mailotto/HandlerFinder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public findOnMailReceived(Ljava/lang/Object;)Lme/drakeet/mailotto/MailHandler;
    .registers 3
    .param p1, "listener"    # Ljava/lang/Object;

    .prologue
    .line 32
    invoke-static {p1}, Lme/drakeet/mailotto/AnnotatedHandlerFinder;->findOnMailReceived(Ljava/lang/Object;)Lme/drakeet/mailotto/MailHandler;

    move-result-object v0

    return-object v0
.end method
