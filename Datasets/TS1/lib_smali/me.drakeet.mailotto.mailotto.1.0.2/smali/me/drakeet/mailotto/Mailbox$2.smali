.class Lme/drakeet/mailotto/Mailbox$2;
.super Ljava/lang/ThreadLocal;
.source "Mailbox.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lme/drakeet/mailotto/Mailbox;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ThreadLocal",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lme/drakeet/mailotto/Mailbox;


# direct methods
.method constructor <init>(Lme/drakeet/mailotto/Mailbox;)V
    .registers 2
    .param p1, "this$0"    # Lme/drakeet/mailotto/Mailbox;

    .prologue
    .line 58
    iput-object p1, p0, Lme/drakeet/mailotto/Mailbox$2;->this$0:Lme/drakeet/mailotto/Mailbox;

    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    return-void
.end method


# virtual methods
.method protected initialValue()Ljava/lang/Boolean;
    .registers 2

    .prologue
    .line 60
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic initialValue()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 58
    invoke-virtual {p0}, Lme/drakeet/mailotto/Mailbox$2;->initialValue()Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method
