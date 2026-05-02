.class public Lcom/mikepenz/aboutlibraries/detector/Detect;
.super Ljava/lang/Object;
.source "Detect.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static detect(Landroid/content/Context;Ljava/util/List;)Ljava/util/List;
    .registers 10
    .param p0, "mCtx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Lcom/mikepenz/aboutlibraries/entity/Library;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lcom/mikepenz/aboutlibraries/entity/Library;",
            ">;"
        }
    .end annotation

    .prologue
    .line 19
    .local p1, "libraries":Ljava/util/List;, "Ljava/util/List<Lcom/mikepenz/aboutlibraries/entity/Library;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .local v2, "foundLibraries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/aboutlibraries/entity/Library;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_9
    :goto_9
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3d

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mikepenz/aboutlibraries/entity/Library;

    .line 22
    .local v3, "library":Lcom/mikepenz/aboutlibraries/entity/Library;
    invoke-virtual {v3}, Lcom/mikepenz/aboutlibraries/entity/Library;->getClassPath()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_9

    .line 24
    :try_start_1f
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x3

    invoke-virtual {p0, v5, v6}, Landroid/content/Context;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    move-result-object v1

    .line 26
    .local v1, "ctx":Landroid/content/Context;
    invoke-virtual {v3}, Lcom/mikepenz/aboutlibraries/entity/Library;->getClassPath()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v1}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v7

    invoke-static {v5, v6, v7}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    .line 29
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v0, :cond_9

    .line 30
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_3a
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1f .. :try_end_3a} :catch_3b
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1f .. :try_end_3a} :catch_3e

    goto :goto_9

    .line 32
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "ctx":Landroid/content/Context;
    :catch_3b
    move-exception v5

    goto :goto_9

    .line 42
    .end local v3    # "library":Lcom/mikepenz/aboutlibraries/entity/Library;
    :cond_3d
    return-object v2

    .line 34
    .restart local v3    # "library":Lcom/mikepenz/aboutlibraries/entity/Library;
    :catch_3e
    move-exception v5

    goto :goto_9
.end method
