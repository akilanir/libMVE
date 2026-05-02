.class public Lfreemarker/ext/ant/JythonAntTask;
.super Lorg/apache/tools/ant/Task;
.source "JythonAntTask.java"


# instance fields
.field private jythonOps:Lfreemarker/ext/ant/UnlinkedJythonOperations;

.field private script:Ljava/lang/String;

.field private scriptFile:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 72
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 75
    const-string v0, ""

    iput-object v0, p0, Lfreemarker/ext/ant/JythonAntTask;->script:Ljava/lang/String;

    return-void
.end method

.method private ensureJythonOpsExists()V
    .registers 6

    .prologue
    .line 101
    iget-object v2, p0, Lfreemarker/ext/ant/JythonAntTask;->jythonOps:Lfreemarker/ext/ant/UnlinkedJythonOperations;

    if-nez v2, :cond_12

    .line 104
    :try_start_4
    const-string v2, "freemarker.ext.ant.UnlinkedJythonOperationsImpl"

    invoke-static {v2}, Lfreemarker/template/utility/ClassUtil;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_9
    .catch Ljava/lang/ClassNotFoundException; {:try_start_4 .. :try_end_9} :catch_13

    move-result-object v0

    .line 114
    .local v0, "clazz":Ljava/lang/Class;
    :try_start_a
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfreemarker/ext/ant/UnlinkedJythonOperations;

    iput-object v2, p0, Lfreemarker/ext/ant/JythonAntTask;->jythonOps:Lfreemarker/ext/ant/UnlinkedJythonOperations;
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_12} :catch_31

    .line 123
    .end local v0    # "clazz":Ljava/lang/Class;
    :cond_12
    return-void

    .line 106
    :catch_13
    move-exception v1

    .line 107
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "A ClassNotFoundException has been thrown when trying to get the freemarker.ext.ant.UnlinkedJythonOperationsImpl class. The error message was: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 116
    .end local v1    # "e":Ljava/lang/ClassNotFoundException;
    .restart local v0    # "clazz":Ljava/lang/Class;
    :catch_31
    move-exception v1

    .line 117
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "An exception has been thrown when trying to create a freemarker.ext.ant.JythonAntTask object. The exception was: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method


# virtual methods
.method public addText(Ljava/lang/String;)V
    .registers 4
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 84
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lfreemarker/ext/ant/JythonAntTask;->script:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/ext/ant/JythonAntTask;->script:Ljava/lang/String;

    .line 85
    return-void
.end method

.method public execute(Ljava/util/Map;)V
    .registers 6
    .param p1, "vars"    # Ljava/util/Map;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 88
    iget-object v1, p0, Lfreemarker/ext/ant/JythonAntTask;->scriptFile:Ljava/io/File;

    if-eqz v1, :cond_e

    .line 89
    invoke-direct {p0}, Lfreemarker/ext/ant/JythonAntTask;->ensureJythonOpsExists()V

    .line 90
    iget-object v1, p0, Lfreemarker/ext/ant/JythonAntTask;->jythonOps:Lfreemarker/ext/ant/UnlinkedJythonOperations;

    iget-object v2, p0, Lfreemarker/ext/ant/JythonAntTask;->scriptFile:Ljava/io/File;

    invoke-interface {v1, v2, p1}, Lfreemarker/ext/ant/UnlinkedJythonOperations;->execute(Ljava/io/File;Ljava/util/Map;)V

    .line 92
    :cond_e
    iget-object v1, p0, Lfreemarker/ext/ant/JythonAntTask;->script:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_30

    .line 93
    invoke-direct {p0}, Lfreemarker/ext/ant/JythonAntTask;->ensureJythonOpsExists()V

    .line 94
    iget-object v1, p0, Lfreemarker/ext/ant/JythonAntTask;->project:Lorg/apache/tools/ant/Project;

    iget-object v2, p0, Lfreemarker/ext/ant/JythonAntTask;->script:Ljava/lang/String;

    iget-object v3, p0, Lfreemarker/ext/ant/JythonAntTask;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v3}, Lorg/apache/tools/ant/Project;->getProperties()Ljava/util/Hashtable;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lorg/apache/tools/ant/ProjectHelper;->replaceProperties(Lorg/apache/tools/ant/Project;Ljava/lang/String;Ljava/util/Hashtable;)Ljava/lang/String;

    move-result-object v0

    .line 96
    .local v0, "finalScript":Ljava/lang/String;
    iget-object v1, p0, Lfreemarker/ext/ant/JythonAntTask;->jythonOps:Lfreemarker/ext/ant/UnlinkedJythonOperations;

    invoke-interface {v1, v0, p1}, Lfreemarker/ext/ant/UnlinkedJythonOperations;->execute(Ljava/lang/String;Ljava/util/Map;)V

    .line 98
    .end local v0    # "finalScript":Ljava/lang/String;
    :cond_30
    return-void
.end method

.method public setFile(Ljava/io/File;)V
    .registers 2
    .param p1, "scriptFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 79
    invoke-direct {p0}, Lfreemarker/ext/ant/JythonAntTask;->ensureJythonOpsExists()V

    .line 80
    iput-object p1, p0, Lfreemarker/ext/ant/JythonAntTask;->scriptFile:Ljava/io/File;

    .line 81
    return-void
.end method
