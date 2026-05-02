.class Lcom/sun/mail/imap/IdleManager$1;
.super Ljava/lang/Object;
.source "IdleManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sun/mail/imap/IdleManager;-><init>(Lkorex/mail/Session;Ljava/util/concurrent/Executor;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sun/mail/imap/IdleManager;


# direct methods
.method constructor <init>(Lcom/sun/mail/imap/IdleManager;)V
    .registers 2
    .param p1, "this$0"    # Lcom/sun/mail/imap/IdleManager;

    .prologue
    .line 152
    iput-object p1, p0, Lcom/sun/mail/imap/IdleManager$1;->this$0:Lcom/sun/mail/imap/IdleManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 154
    iget-object v0, p0, Lcom/sun/mail/imap/IdleManager$1;->this$0:Lcom/sun/mail/imap/IdleManager;

    # invokes: Lcom/sun/mail/imap/IdleManager;->select()V
    invoke-static {v0}, Lcom/sun/mail/imap/IdleManager;->access$000(Lcom/sun/mail/imap/IdleManager;)V

    .line 155
    return-void
.end method
