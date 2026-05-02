.class Lfreemarker/cache/FileTemplateLoader$4;
.super Ljava/lang/Object;
.source "FileTemplateLoader.java"

# interfaces
.implements Ljava/security/PrivilegedExceptionAction;


# instance fields
.field private final this$0:Lfreemarker/cache/FileTemplateLoader;

.field private final val$encoding:Ljava/lang/String;

.field private final val$templateSource:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lfreemarker/cache/FileTemplateLoader;Ljava/lang/Object;Ljava/lang/String;)V
    .registers 4

    .prologue
    .line 209
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/cache/FileTemplateLoader$4;->this$0:Lfreemarker/cache/FileTemplateLoader;

    iput-object p2, p0, Lfreemarker/cache/FileTemplateLoader$4;->val$templateSource:Ljava/lang/Object;

    iput-object p3, p0, Lfreemarker/cache/FileTemplateLoader$4;->val$encoding:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 214
    iget-object v0, p0, Lfreemarker/cache/FileTemplateLoader$4;->val$templateSource:Ljava/lang/Object;

    instance-of v0, v0, Ljava/io/File;

    if-nez v0, :cond_29

    .line 215
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "templateSource is a: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/cache/FileTemplateLoader$4;->val$templateSource:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 219
    :cond_29
    new-instance v1, Ljava/io/InputStreamReader;

    new-instance v2, Ljava/io/FileInputStream;

    iget-object v0, p0, Lfreemarker/cache/FileTemplateLoader$4;->val$templateSource:Ljava/lang/Object;

    check-cast v0, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    iget-object v0, p0, Lfreemarker/cache/FileTemplateLoader$4;->val$encoding:Ljava/lang/String;

    invoke-direct {v1, v2, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    return-object v1
.end method
