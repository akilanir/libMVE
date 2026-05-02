.class Lcom/octo/android/robospice/persistence/file/InFileObjectPersister$2;
.super Ljava/lang/Object;
.source "InFileObjectPersister.java"

# interfaces
.implements Ljava/io/FileFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->removeAllDataFromCache()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;


# direct methods
.method constructor <init>(Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;)V
    .registers 2

    .prologue
    .line 142
    .local p0, "this":Lcom/octo/android/robospice/persistence/file/InFileObjectPersister$2;, "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister.2;"
    iput-object p1, p0, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister$2;->this$0:Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Ljava/io/File;)Z
    .registers 4
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 146
    .local p0, "this":Lcom/octo/android/robospice/persistence/file/InFileObjectPersister$2;, "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister.2;"
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister$2;->this$0:Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;

    invoke-virtual {v1}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->getCachePrefix()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
