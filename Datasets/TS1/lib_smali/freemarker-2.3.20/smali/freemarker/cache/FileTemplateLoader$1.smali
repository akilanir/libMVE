.class Lfreemarker/cache/FileTemplateLoader$1;
.super Ljava/lang/Object;
.source "FileTemplateLoader.java"

# interfaces
.implements Ljava/security/PrivilegedExceptionAction;


# instance fields
.field private final this$0:Lfreemarker/cache/FileTemplateLoader;

.field private final val$allowLinking:Z

.field private final val$baseDir:Ljava/io/File;


# direct methods
.method constructor <init>(Lfreemarker/cache/FileTemplateLoader;Ljava/io/File;Z)V
    .registers 4

    .prologue
    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/cache/FileTemplateLoader$1;->this$0:Lfreemarker/cache/FileTemplateLoader;

    iput-object p2, p0, Lfreemarker/cache/FileTemplateLoader$1;->val$baseDir:Ljava/io/File;

    iput-boolean p3, p0, Lfreemarker/cache/FileTemplateLoader$1;->val$allowLinking:Z

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 123
    iget-object v2, p0, Lfreemarker/cache/FileTemplateLoader$1;->val$baseDir:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_25

    .line 124
    new-instance v2, Ljava/io/FileNotFoundException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v4, p0, Lfreemarker/cache/FileTemplateLoader$1;->val$baseDir:Ljava/io/File;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " does not exist."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 126
    :cond_25
    iget-object v2, p0, Lfreemarker/cache/FileTemplateLoader$1;->val$baseDir:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-nez v2, :cond_48

    .line 127
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v4, p0, Lfreemarker/cache/FileTemplateLoader$1;->val$baseDir:Ljava/io/File;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " is not a directory."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 129
    :cond_48
    const/4 v2, 0x2

    new-array v1, v2, [Ljava/lang/Object;

    .line 130
    .local v1, "retval":[Ljava/lang/Object;
    iget-boolean v2, p0, Lfreemarker/cache/FileTemplateLoader$1;->val$allowLinking:Z

    if-eqz v2, :cond_57

    .line 131
    iget-object v2, p0, Lfreemarker/cache/FileTemplateLoader$1;->val$baseDir:Ljava/io/File;

    aput-object v2, v1, v3

    .line 132
    const/4 v2, 0x0

    aput-object v2, v1, v4

    .line 144
    :goto_56
    return-object v1

    .line 135
    :cond_57
    iget-object v2, p0, Lfreemarker/cache/FileTemplateLoader$1;->val$baseDir:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v2

    aput-object v2, v1, v3

    .line 136
    aget-object v2, v1, v3

    check-cast v2, Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 139
    .local v0, "basePath":Ljava/lang/String;
    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_82

    .line 140
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    sget-char v3, Ljava/io/File;->separatorChar:C

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 142
    :cond_82
    aput-object v0, v1, v4

    goto :goto_56
.end method
