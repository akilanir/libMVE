.class Lcom/octo/android/robospice/persistence/file/InFileObjectPersister$1;
.super Ljava/lang/Object;
.source "InFileObjectPersister.java"

# interfaces
.implements Ljava/io/FilenameFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->getAllCacheKeys()Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;

.field final synthetic val$prefix:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;Ljava/lang/String;)V
    .registers 3

    .prologue
    .line 105
    .local p0, "this":Lcom/octo/android/robospice/persistence/file/InFileObjectPersister$1;, "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister.1;"
    iput-object p1, p0, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister$1;->this$0:Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;

    iput-object p2, p0, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister$1;->val$prefix:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Ljava/io/File;Ljava/lang/String;)Z
    .registers 4
    .param p1, "dir"    # Ljava/io/File;
    .param p2, "filename"    # Ljava/lang/String;

    .prologue
    .line 109
    .local p0, "this":Lcom/octo/android/robospice/persistence/file/InFileObjectPersister$1;, "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister.1;"
    iget-object v0, p0, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister$1;->val$prefix:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
