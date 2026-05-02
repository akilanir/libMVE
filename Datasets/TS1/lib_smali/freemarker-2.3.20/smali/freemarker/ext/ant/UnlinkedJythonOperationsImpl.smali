.class public Lfreemarker/ext/ant/UnlinkedJythonOperationsImpl;
.super Ljava/lang/Object;
.source "UnlinkedJythonOperationsImpl.java"

# interfaces
.implements Lfreemarker/ext/ant/UnlinkedJythonOperations;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private createInterpreter(Ljava/util/Map;)Lorg/python/util/PythonInterpreter;
    .registers 7
    .param p1, "vars"    # Ljava/util/Map;

    .prologue
    .line 83
    new-instance v2, Lorg/python/util/PythonInterpreter;

    invoke-direct {v2}, Lorg/python/util/PythonInterpreter;-><init>()V

    .line 84
    .local v2, "pi":Lorg/python/util/PythonInterpreter;
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 85
    .local v1, "it":Ljava/util/Iterator;
    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_27

    .line 86
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 87
    .local v0, "ent":Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/python/util/PythonInterpreter;->set(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_d

    .line 89
    .end local v0    # "ent":Ljava/util/Map$Entry;
    :cond_27
    return-object v2
.end method


# virtual methods
.method public execute(Ljava/io/File;Ljava/util/Map;)V
    .registers 6
    .param p1, "file"    # Ljava/io/File;
    .param p2, "vars"    # Ljava/util/Map;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 74
    invoke-direct {p0, p2}, Lfreemarker/ext/ant/UnlinkedJythonOperationsImpl;->createInterpreter(Ljava/util/Map;)Lorg/python/util/PythonInterpreter;

    move-result-object v1

    .line 76
    .local v1, "pi":Lorg/python/util/PythonInterpreter;
    :try_start_4
    invoke-virtual {p1}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/python/util/PythonInterpreter;->execfile(Ljava/lang/String;)V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_b} :catch_c

    .line 80
    return-void

    .line 77
    :catch_c
    move-exception v0

    .line 78
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public execute(Ljava/lang/String;Ljava/util/Map;)V
    .registers 4
    .param p1, "script"    # Ljava/lang/String;
    .param p2, "vars"    # Ljava/util/Map;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 69
    invoke-direct {p0, p2}, Lfreemarker/ext/ant/UnlinkedJythonOperationsImpl;->createInterpreter(Ljava/util/Map;)Lorg/python/util/PythonInterpreter;

    move-result-object v0

    .line 70
    .local v0, "pi":Lorg/python/util/PythonInterpreter;
    invoke-virtual {v0, p1}, Lorg/python/util/PythonInterpreter;->exec(Ljava/lang/String;)V

    .line 71
    return-void
.end method
