.class Lcom/danikula/videocache/ProxyCache$SourceReaderRunnable;
.super Ljava/lang/Object;
.source "ProxyCache.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/danikula/videocache/ProxyCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SourceReaderRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/danikula/videocache/ProxyCache;


# direct methods
.method private constructor <init>(Lcom/danikula/videocache/ProxyCache;)V
    .registers 2

    .prologue
    .line 174
    iput-object p1, p0, Lcom/danikula/videocache/ProxyCache$SourceReaderRunnable;->this$0:Lcom/danikula/videocache/ProxyCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/danikula/videocache/ProxyCache;Lcom/danikula/videocache/ProxyCache$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/danikula/videocache/ProxyCache;
    .param p2, "x1"    # Lcom/danikula/videocache/ProxyCache$1;

    .prologue
    .line 174
    invoke-direct {p0, p1}, Lcom/danikula/videocache/ProxyCache$SourceReaderRunnable;-><init>(Lcom/danikula/videocache/ProxyCache;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 178
    iget-object v0, p0, Lcom/danikula/videocache/ProxyCache$SourceReaderRunnable;->this$0:Lcom/danikula/videocache/ProxyCache;

    # invokes: Lcom/danikula/videocache/ProxyCache;->readSource()V
    invoke-static {v0}, Lcom/danikula/videocache/ProxyCache;->access$100(Lcom/danikula/videocache/ProxyCache;)V

    .line 179
    return-void
.end method
