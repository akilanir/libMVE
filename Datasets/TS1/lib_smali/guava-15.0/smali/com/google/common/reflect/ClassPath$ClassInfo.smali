.class public final Lcom/google/common/reflect/ClassPath$ClassInfo;
.super Lcom/google/common/reflect/ClassPath$ResourceInfo;
.source "ClassPath.java"


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/reflect/ClassPath;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ClassInfo"
.end annotation


# instance fields
.field private final className:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/ClassLoader;)V
    .registers 4
    .param p1, "resourceName"    # Ljava/lang/String;
    .param p2, "loader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 195
    invoke-direct {p0, p1, p2}, Lcom/google/common/reflect/ClassPath$ResourceInfo;-><init>(Ljava/lang/String;Ljava/lang/ClassLoader;)V

    .line 196
    invoke-static {p1}, Lcom/google/common/reflect/ClassPath;->getClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/reflect/ClassPath$ClassInfo;->className:Ljava/lang/String;

    .line 197
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 216
    iget-object v0, p0, Lcom/google/common/reflect/ClassPath$ClassInfo;->className:Ljava/lang/String;

    return-object v0
.end method

.method public getPackageName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 201
    iget-object v0, p0, Lcom/google/common/reflect/ClassPath$ClassInfo;->className:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/common/reflect/Reflection;->getPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSimpleName()Ljava/lang/String;
    .registers 4

    .prologue
    .line 206
    invoke-virtual {p0}, Lcom/google/common/reflect/ClassPath$ClassInfo;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 207
    .local v0, "packageName":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_d

    .line 208
    iget-object v1, p0, Lcom/google/common/reflect/ClassPath$ClassInfo;->className:Ljava/lang/String;

    .line 211
    :goto_c
    return-object v1

    :cond_d
    iget-object v1, p0, Lcom/google/common/reflect/ClassPath$ClassInfo;->className:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_c
.end method

.method public load()Ljava/lang/Class;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 227
    :try_start_0
    iget-object v1, p0, Lcom/google/common/reflect/ClassPath$ClassInfo;->loader:Ljava/lang/ClassLoader;

    iget-object v2, p0, Lcom/google/common/reflect/ClassPath$ClassInfo;->className:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_7
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_7} :catch_9

    move-result-object v1

    return-object v1

    .line 228
    :catch_9
    move-exception v0

    .line 230
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 235
    iget-object v0, p0, Lcom/google/common/reflect/ClassPath$ClassInfo;->className:Ljava/lang/String;

    return-object v0
.end method
