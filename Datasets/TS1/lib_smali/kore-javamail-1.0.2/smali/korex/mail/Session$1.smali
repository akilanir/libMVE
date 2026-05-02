.class Lkorex/mail/Session$1;
.super Ljava/lang/Object;
.source "Session.java"

# interfaces
.implements Lkorex/mail/StreamLoader;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkorex/mail/Session;->loadProviders(Ljava/lang/Class;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lkorex/mail/Session;


# direct methods
.method constructor <init>(Lkorex/mail/Session;)V
    .registers 2
    .param p1, "this$0"    # Lkorex/mail/Session;

    .prologue
    .line 912
    iput-object p1, p0, Lkorex/mail/Session$1;->this$0:Lkorex/mail/Session;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public load(Ljava/io/InputStream;)V
    .registers 3
    .param p1, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 914
    iget-object v0, p0, Lkorex/mail/Session$1;->this$0:Lkorex/mail/Session;

    # invokes: Lkorex/mail/Session;->loadProvidersFromStream(Ljava/io/InputStream;)V
    invoke-static {v0, p1}, Lkorex/mail/Session;->access$000(Lkorex/mail/Session;Ljava/io/InputStream;)V

    .line 915
    return-void
.end method
