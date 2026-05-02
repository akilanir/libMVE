.class Lcom/octo/android/robospice/persistence/string/InFileStringObjectPersister$1;
.super Ljava/lang/Thread;
.source "InFileStringObjectPersister.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/octo/android/robospice/persistence/string/InFileStringObjectPersister;->saveDataToCacheAndReturnData(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/octo/android/robospice/persistence/string/InFileStringObjectPersister;

.field final synthetic val$cacheKey:Ljava/lang/Object;

.field final synthetic val$data:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/octo/android/robospice/persistence/string/InFileStringObjectPersister;Ljava/lang/Object;Ljava/lang/String;)V
    .registers 4

    .prologue
    .line 50
    iput-object p1, p0, Lcom/octo/android/robospice/persistence/string/InFileStringObjectPersister$1;->this$0:Lcom/octo/android/robospice/persistence/string/InFileStringObjectPersister;

    iput-object p2, p0, Lcom/octo/android/robospice/persistence/string/InFileStringObjectPersister$1;->val$cacheKey:Ljava/lang/Object;

    iput-object p3, p0, Lcom/octo/android/robospice/persistence/string/InFileStringObjectPersister$1;->val$data:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 54
    :try_start_0
    iget-object v1, p0, Lcom/octo/android/robospice/persistence/string/InFileStringObjectPersister$1;->this$0:Lcom/octo/android/robospice/persistence/string/InFileStringObjectPersister;

    iget-object v2, p0, Lcom/octo/android/robospice/persistence/string/InFileStringObjectPersister$1;->val$cacheKey:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Lcom/octo/android/robospice/persistence/string/InFileStringObjectPersister;->getCacheFile(Ljava/lang/Object;)Ljava/io/File;

    move-result-object v1

    iget-object v2, p0, Lcom/octo/android/robospice/persistence/string/InFileStringObjectPersister$1;->val$data:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v1, v2, v3}, Lorg/apache/commons/io/FileUtils;->writeStringToFile(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_f} :catch_10

    .line 58
    :goto_f
    return-void

    .line 55
    :catch_10
    move-exception v0

    .line 56
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "An error occured on saving request "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/octo/android/robospice/persistence/string/InFileStringObjectPersister$1;->val$cacheKey:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " data asynchronously"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v1, v2}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I

    goto :goto_f
.end method
