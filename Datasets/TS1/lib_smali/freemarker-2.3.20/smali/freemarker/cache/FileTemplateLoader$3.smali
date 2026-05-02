.class Lfreemarker/cache/FileTemplateLoader$3;
.super Ljava/lang/Object;
.source "FileTemplateLoader.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# instance fields
.field private final this$0:Lfreemarker/cache/FileTemplateLoader;

.field private final val$templateSource:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lfreemarker/cache/FileTemplateLoader;Ljava/lang/Object;)V
    .registers 3

    .prologue
    .line 192
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/cache/FileTemplateLoader$3;->this$0:Lfreemarker/cache/FileTemplateLoader;

    iput-object p2, p0, Lfreemarker/cache/FileTemplateLoader$3;->val$templateSource:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .registers 5

    .prologue
    .line 195
    new-instance v1, Ljava/lang/Long;

    iget-object v0, p0, Lfreemarker/cache/FileTemplateLoader$3;->val$templateSource:Ljava/lang/Object;

    check-cast v0, Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/lang/Long;-><init>(J)V

    return-object v1
.end method
