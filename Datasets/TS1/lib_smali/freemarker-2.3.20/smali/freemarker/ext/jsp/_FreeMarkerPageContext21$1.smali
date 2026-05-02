.class Lfreemarker/ext/jsp/_FreeMarkerPageContext21$1;
.super Ljava/lang/Object;
.source "_FreeMarkerPageContext21.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# instance fields
.field private final this$0:Lfreemarker/ext/jsp/_FreeMarkerPageContext21;


# direct methods
.method constructor <init>(Lfreemarker/ext/jsp/_FreeMarkerPageContext21;)V
    .registers 2

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/ext/jsp/_FreeMarkerPageContext21$1;->this$0:Lfreemarker/ext/jsp/_FreeMarkerPageContext21;

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 52
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    return-object v0
.end method
