.class Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister$1;
.super Ljava/lang/Thread;
.source "RetrofitObjectPersister.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;->saveDataToCacheAndReturnData(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;

.field final synthetic val$cacheKey:Ljava/lang/Object;

.field final synthetic val$data:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4

    .prologue
    .line 54
    .local p0, "this":Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister$1;, "Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister.1;"
    iput-object p1, p0, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister$1;->this$0:Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;

    iput-object p2, p0, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister$1;->val$data:Ljava/lang/Object;

    iput-object p3, p0, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister$1;->val$cacheKey:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .prologue
    .local p0, "this":Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister$1;, "Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister.1;"
    const/4 v4, 0x0

    .line 58
    :try_start_1
    iget-object v1, p0, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister$1;->this$0:Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;

    iget-object v2, p0, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister$1;->val$data:Ljava/lang/Object;

    iget-object v3, p0, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister$1;->val$cacheKey:Ljava/lang/Object;

    # invokes: Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;->saveData(Ljava/lang/Object;Ljava/lang/Object;)V
    invoke-static {v1, v2, v3}, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;->access$000(Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_a} :catch_b
    .catch Lcom/octo/android/robospice/persistence/exception/CacheSavingException; {:try_start_1 .. :try_end_a} :catch_2d

    .line 64
    :goto_a
    return-void

    .line 59
    :catch_b
    move-exception v0

    .line 60
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "An error occured on saving request "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister$1;->val$cacheKey:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " data asynchronously"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-array v2, v4, [Ljava/lang/Object;

    invoke-static {v0, v1, v2}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I

    goto :goto_a

    .line 61
    .end local v0    # "e":Ljava/io/IOException;
    :catch_2d
    move-exception v0

    .line 62
    .local v0, "e":Lcom/octo/android/robospice/persistence/exception/CacheSavingException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "An error occured on saving request "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister$1;->val$cacheKey:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " data asynchronously"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-array v2, v4, [Ljava/lang/Object;

    invoke-static {v0, v1, v2}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I

    goto :goto_a
.end method
