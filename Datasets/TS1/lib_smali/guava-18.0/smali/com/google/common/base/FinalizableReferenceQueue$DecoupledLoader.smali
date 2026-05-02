.class Lcom/google/common/base/FinalizableReferenceQueue$DecoupledLoader;
.super Ljava/lang/Object;
.source "FinalizableReferenceQueue.java"

# interfaces
.implements Lcom/google/common/base/FinalizableReferenceQueue$FinalizerLoader;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/base/FinalizableReferenceQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "DecoupledLoader"
.end annotation


# static fields
.field private static final LOADING_ERROR:Ljava/lang/String; = "Could not load Finalizer in its own class loader.Loading Finalizer in the current class loader instead. As a result, you will not be ableto garbage collect this class loader. To support reclaiming this class loader, eitherresolve the underlying issue, or move Google Collections to your system class path."


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 277
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method getBaseUrl()Ljava/net/URL;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 308
    const-string v3, "com.google.common.base.internal.Finalizer"

    const/16 v4, 0x2e

    const/16 v5, 0x2f

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const-string v4, ".class"

    invoke-virtual {v3, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 309
    .local v0, "finalizerPath":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v1

    .line 310
    .local v1, "finalizerUrl":Ljava/net/URL;
    if-nez v1, :cond_28

    .line 311
    new-instance v3, Ljava/io/FileNotFoundException;

    invoke-direct {v3, v0}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 315
    :cond_28
    invoke-virtual {v1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v2

    .line 316
    .local v2, "urlString":Ljava/lang/String;
    invoke-virtual {v2, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_4e

    .line 317
    new-instance v4, Ljava/io/IOException;

    const-string v5, "Unsupported path style: "

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    if-eqz v6, :cond_48

    invoke-virtual {v5, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :goto_44
    invoke-direct {v4, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    :cond_48
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v5}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_44

    .line 319
    :cond_4e
    const/4 v3, 0x0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 320
    new-instance v3, Ljava/net/URL;

    invoke-direct {v3, v1, v2}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    return-object v3
.end method

.method public loadFinalizer()Ljava/lang/Class;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 295
    :try_start_0
    invoke-virtual {p0}, Lcom/google/common/base/FinalizableReferenceQueue$DecoupledLoader;->getBaseUrl()Ljava/net/URL;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/google/common/base/FinalizableReferenceQueue$DecoupledLoader;->newLoader(Ljava/net/URL;)Ljava/net/URLClassLoader;

    move-result-object v1

    .line 296
    .local v1, "finalizerLoader":Ljava/lang/ClassLoader;
    const-string v2, "com.google.common.base.internal.Finalizer"

    invoke-virtual {v1, v2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_d} :catch_f

    move-result-object v2

    .line 299
    .end local v1    # "finalizerLoader":Ljava/lang/ClassLoader;
    :goto_e
    return-object v2

    .line 297
    :catch_f
    move-exception v0

    .line 298
    .local v0, "e":Ljava/lang/Exception;
    # getter for: Lcom/google/common/base/FinalizableReferenceQueue;->logger:Ljava/util/logging/Logger;
    invoke-static {}, Lcom/google/common/base/FinalizableReferenceQueue;->access$000()Ljava/util/logging/Logger;

    move-result-object v2

    sget-object v3, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v4, "Could not load Finalizer in its own class loader.Loading Finalizer in the current class loader instead. As a result, you will not be ableto garbage collect this class loader. To support reclaiming this class loader, eitherresolve the underlying issue, or move Google Collections to your system class path."

    invoke-virtual {v2, v3, v4, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 299
    const/4 v2, 0x0

    goto :goto_e
.end method

.method newLoader(Ljava/net/URL;)Ljava/net/URLClassLoader;
    .registers 5
    .param p1, "base"    # Ljava/net/URL;

    .prologue
    .line 328
    new-instance v0, Ljava/net/URLClassLoader;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/net/URL;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/net/URLClassLoader;-><init>([Ljava/net/URL;Ljava/lang/ClassLoader;)V

    return-object v0
.end method
