.class Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister$2;
.super Ljava/lang/Object;
.source "RetrofitObjectPersister.java"

# interfaces
.implements Lretrofit/mime/TypedInput;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;->readCacheDataFromFile(Ljava/io/File;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;

.field final synthetic val$body:[B


# direct methods
.method constructor <init>(Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;[B)V
    .registers 3

    .prologue
    .line 99
    .local p0, "this":Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister$2;, "Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister.2;"
    iput-object p1, p0, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister$2;->this$0:Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;

    iput-object p2, p0, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister$2;->val$body:[B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public in()Ljava/io/InputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 113
    .local p0, "this":Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister$2;, "Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister.2;"
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister$2;->val$body:[B

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object v0
.end method

.method public length()J
    .registers 3

    .prologue
    .line 108
    .local p0, "this":Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister$2;, "Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister.2;"
    iget-object v0, p0, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister$2;->val$body:[B

    array-length v0, v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public mimeType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 103
    .local p0, "this":Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister$2;, "Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister.2;"
    const-string v0, "application/json"

    return-object v0
.end method
