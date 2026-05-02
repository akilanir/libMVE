.class Lme/drakeet/mailotto/Mailbox$1;
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
        "Ljava/util/LinkedList",
        "<",
        "Lme/drakeet/mailotto/Mail;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lme/drakeet/mailotto/Mailbox;


# direct methods
.method constructor <init>(Lme/drakeet/mailotto/Mailbox;)V
    .registers 2
    .param p1, "this$0"    # Lme/drakeet/mailotto/Mailbox;

    .prologue
    .line 49
    iput-object p1, p0, Lme/drakeet/mailotto/Mailbox$1;->this$0:Lme/drakeet/mailotto/Mailbox;

    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic initialValue()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 49
    invoke-virtual {p0}, Lme/drakeet/mailotto/Mailbox$1;->initialValue()Ljava/util/LinkedList;

    move-result-object v0

    return-object v0
.end method

.method protected initialValue()Ljava/util/LinkedList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedList",
            "<",
            "Lme/drakeet/mailotto/Mail;",
            ">;"
        }
    .end annotation

    .prologue
    .line 51
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    return-object v0
.end method
