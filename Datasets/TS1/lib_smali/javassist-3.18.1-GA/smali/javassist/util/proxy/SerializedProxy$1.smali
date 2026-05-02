.class Ljavassist/util/proxy/SerializedProxy$1;
.super Ljava/lang/Object;
.source "SerializedProxy.java"

# interfaces
.implements Ljava/security/PrivilegedExceptionAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljavassist/util/proxy/SerializedProxy;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Ljavassist/util/proxy/SerializedProxy;

.field final synthetic val$className:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljavassist/util/proxy/SerializedProxy;Ljava/lang/String;)V
    .registers 3

    .prologue
    .line 63
    iput-object p1, p0, Ljavassist/util/proxy/SerializedProxy$1;->this$0:Ljavassist/util/proxy/SerializedProxy;

    iput-object p2, p0, Ljavassist/util/proxy/SerializedProxy$1;->val$className:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 65
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 66
    .local v0, "cl":Ljava/lang/ClassLoader;
    iget-object v1, p0, Ljavassist/util/proxy/SerializedProxy$1;->val$className:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-static {v1, v2, v0}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v1

    return-object v1
.end method
