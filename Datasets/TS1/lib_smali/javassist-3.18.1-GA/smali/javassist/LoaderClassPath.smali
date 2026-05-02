.class public Ljavassist/LoaderClassPath;
.super Ljava/lang/Object;
.source "LoaderClassPath.java"

# interfaces
.implements Ljavassist/ClassPath;


# instance fields
.field private clref:Ljava/lang/ref/WeakReference;


# direct methods
.method public constructor <init>(Ljava/lang/ClassLoader;)V
    .registers 3
    .param p1, "cl"    # Ljava/lang/ClassLoader;

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Ljavassist/LoaderClassPath;->clref:Ljava/lang/ref/WeakReference;

    .line 50
    return-void
.end method


# virtual methods
.method public close()V
    .registers 2

    .prologue
    .line 94
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/LoaderClassPath;->clref:Ljava/lang/ref/WeakReference;

    .line 95
    return-void
.end method

.method public find(Ljava/lang/String;)Ljava/net/URL;
    .registers 7
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 82
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v3, 0x2e

    const/16 v4, 0x2f

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".class"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 83
    .local v1, "cname":Ljava/lang/String;
    iget-object v2, p0, Ljavassist/LoaderClassPath;->clref:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ClassLoader;

    .line 84
    .local v0, "cl":Ljava/lang/ClassLoader;
    if-nez v0, :cond_27

    .line 85
    const/4 v2, 0x0

    .line 87
    :goto_26
    return-object v2

    :cond_27
    invoke-virtual {v0, v1}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v2

    goto :goto_26
.end method

.method public openClassfile(Ljava/lang/String;)Ljava/io/InputStream;
    .registers 7
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 66
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v3, 0x2e

    const/16 v4, 0x2f

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".class"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 67
    .local v1, "cname":Ljava/lang/String;
    iget-object v2, p0, Ljavassist/LoaderClassPath;->clref:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ClassLoader;

    .line 68
    .local v0, "cl":Ljava/lang/ClassLoader;
    if-nez v0, :cond_27

    .line 69
    const/4 v2, 0x0

    .line 71
    :goto_26
    return-object v2

    :cond_27
    invoke-virtual {v0, v1}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    goto :goto_26
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 53
    const/4 v0, 0x0

    .line 54
    .local v0, "cl":Ljava/lang/Object;
    iget-object v1, p0, Ljavassist/LoaderClassPath;->clref:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_b

    .line 55
    iget-object v1, p0, Ljavassist/LoaderClassPath;->clref:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    .line 57
    .end local v0    # "cl":Ljava/lang/Object;
    :cond_b
    if-nez v0, :cond_10

    const-string v1, "<null>"

    :goto_f
    return-object v1

    :cond_10
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_f
.end method
