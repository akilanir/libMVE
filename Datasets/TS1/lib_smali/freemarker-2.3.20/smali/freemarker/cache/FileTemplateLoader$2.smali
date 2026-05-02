.class Lfreemarker/cache/FileTemplateLoader$2;
.super Ljava/lang/Object;
.source "FileTemplateLoader.java"

# interfaces
.implements Ljava/security/PrivilegedExceptionAction;


# instance fields
.field private final this$0:Lfreemarker/cache/FileTemplateLoader;

.field private final val$name:Ljava/lang/String;


# direct methods
.method constructor <init>(Lfreemarker/cache/FileTemplateLoader;Ljava/lang/String;)V
    .registers 3

    .prologue
    .line 161
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/cache/FileTemplateLoader$2;->this$0:Lfreemarker/cache/FileTemplateLoader;

    iput-object p2, p0, Lfreemarker/cache/FileTemplateLoader$2;->val$name:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 163
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lfreemarker/cache/FileTemplateLoader$2;->this$0:Lfreemarker/cache/FileTemplateLoader;

    iget-object v3, v2, Lfreemarker/cache/FileTemplateLoader;->baseDir:Ljava/io/File;

    invoke-static {}, Lfreemarker/cache/FileTemplateLoader;->access$000()Z

    move-result v2

    if-eqz v2, :cond_19

    iget-object v2, p0, Lfreemarker/cache/FileTemplateLoader$2;->val$name:Ljava/lang/String;

    :goto_e
    invoke-direct {v1, v3, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 165
    .local v1, "source":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v2

    if-nez v2, :cond_24

    .line 166
    const/4 v1, 0x0

    .line 179
    .end local v1    # "source":Ljava/io/File;
    :cond_18
    return-object v1

    .line 163
    :cond_19
    iget-object v2, p0, Lfreemarker/cache/FileTemplateLoader$2;->val$name:Ljava/lang/String;

    const/16 v4, 0x2f

    sget-char v5, Ljava/io/File;->separatorChar:C

    invoke-virtual {v2, v4, v5}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    goto :goto_e

    .line 171
    .restart local v1    # "source":Ljava/io/File;
    :cond_24
    iget-object v2, p0, Lfreemarker/cache/FileTemplateLoader$2;->this$0:Lfreemarker/cache/FileTemplateLoader;

    invoke-static {v2}, Lfreemarker/cache/FileTemplateLoader;->access$100(Lfreemarker/cache/FileTemplateLoader;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_18

    .line 172
    invoke-virtual {v1}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v0

    .line 173
    .local v0, "normalized":Ljava/lang/String;
    iget-object v2, p0, Lfreemarker/cache/FileTemplateLoader$2;->this$0:Lfreemarker/cache/FileTemplateLoader;

    invoke-static {v2}, Lfreemarker/cache/FileTemplateLoader;->access$100(Lfreemarker/cache/FileTemplateLoader;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_18

    .line 174
    new-instance v2, Ljava/lang/SecurityException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " resolves to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " which "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " doesn\'t start with "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lfreemarker/cache/FileTemplateLoader$2;->this$0:Lfreemarker/cache/FileTemplateLoader;

    invoke-static {v4}, Lfreemarker/cache/FileTemplateLoader;->access$100(Lfreemarker/cache/FileTemplateLoader;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v2
.end method
