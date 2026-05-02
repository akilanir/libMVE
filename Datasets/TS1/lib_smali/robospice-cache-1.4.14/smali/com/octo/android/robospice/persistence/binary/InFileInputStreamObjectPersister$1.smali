.class Lcom/octo/android/robospice/persistence/binary/InFileInputStreamObjectPersister$1;
.super Ljava/lang/Thread;
.source "InFileInputStreamObjectPersister.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/octo/android/robospice/persistence/binary/InFileInputStreamObjectPersister;->saveDataToCacheAndReturnData(Ljava/io/InputStream;Ljava/lang/Object;)Ljava/io/InputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/octo/android/robospice/persistence/binary/InFileInputStreamObjectPersister;

.field final synthetic val$byteArray:[B

.field final synthetic val$cacheKey:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lcom/octo/android/robospice/persistence/binary/InFileInputStreamObjectPersister;Ljava/lang/Object;[B)V
    .registers 4

    .prologue
    .line 56
    iput-object p1, p0, Lcom/octo/android/robospice/persistence/binary/InFileInputStreamObjectPersister$1;->this$0:Lcom/octo/android/robospice/persistence/binary/InFileInputStreamObjectPersister;

    iput-object p2, p0, Lcom/octo/android/robospice/persistence/binary/InFileInputStreamObjectPersister$1;->val$cacheKey:Ljava/lang/Object;

    iput-object p3, p0, Lcom/octo/android/robospice/persistence/binary/InFileInputStreamObjectPersister$1;->val$byteArray:[B

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 61
    :try_start_0
    iget-object v1, p0, Lcom/octo/android/robospice/persistence/binary/InFileInputStreamObjectPersister$1;->this$0:Lcom/octo/android/robospice/persistence/binary/InFileInputStreamObjectPersister;

    iget-object v2, p0, Lcom/octo/android/robospice/persistence/binary/InFileInputStreamObjectPersister$1;->val$cacheKey:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Lcom/octo/android/robospice/persistence/binary/InFileInputStreamObjectPersister;->getCacheFile(Ljava/lang/Object;)Ljava/io/File;

    move-result-object v1

    iget-object v2, p0, Lcom/octo/android/robospice/persistence/binary/InFileInputStreamObjectPersister$1;->val$byteArray:[B

    invoke-static {v1, v2}, Lorg/apache/commons/io/FileUtils;->writeByteArrayToFile(Ljava/io/File;[B)V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_d} :catch_e

    .line 65
    :goto_d
    return-void

    .line 62
    :catch_e
    move-exception v0

    .line 63
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "An error occured on saving request "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/octo/android/robospice/persistence/binary/InFileInputStreamObjectPersister$1;->val$cacheKey:Ljava/lang/Object;

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

    goto :goto_d
.end method
