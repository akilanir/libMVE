.class Lkorex/activation/DataHandler$1;
.super Ljava/lang/Object;
.source "DataHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkorex/activation/DataHandler;->getInputStream()Ljava/io/InputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lkorex/activation/DataHandler;

.field final synthetic val$fdch:Lkorex/activation/DataContentHandler;

.field final synthetic val$pos:Ljava/io/PipedOutputStream;


# direct methods
.method constructor <init>(Lkorex/activation/DataHandler;Lkorex/activation/DataContentHandler;Ljava/io/PipedOutputStream;)V
    .registers 4
    .param p1, "this$0"    # Lkorex/activation/DataHandler;

    .prologue
    .line 263
    iput-object p1, p0, Lkorex/activation/DataHandler$1;->this$0:Lkorex/activation/DataHandler;

    iput-object p2, p0, Lkorex/activation/DataHandler$1;->val$fdch:Lkorex/activation/DataContentHandler;

    iput-object p3, p0, Lkorex/activation/DataHandler$1;->val$pos:Ljava/io/PipedOutputStream;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 266
    :try_start_0
    iget-object v0, p0, Lkorex/activation/DataHandler$1;->val$fdch:Lkorex/activation/DataContentHandler;

    iget-object v1, p0, Lkorex/activation/DataHandler$1;->this$0:Lkorex/activation/DataHandler;

    # getter for: Lkorex/activation/DataHandler;->object:Ljava/lang/Object;
    invoke-static {v1}, Lkorex/activation/DataHandler;->access$000(Lkorex/activation/DataHandler;)Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Lkorex/activation/DataHandler$1;->this$0:Lkorex/activation/DataHandler;

    # getter for: Lkorex/activation/DataHandler;->objectMimeType:Ljava/lang/String;
    invoke-static {v2}, Lkorex/activation/DataHandler;->access$100(Lkorex/activation/DataHandler;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lkorex/activation/DataHandler$1;->val$pos:Ljava/io/PipedOutputStream;

    invoke-interface {v0, v1, v2, v3}, Lkorex/activation/DataContentHandler;->writeTo(Ljava/lang/Object;Ljava/lang/String;Ljava/io/OutputStream;)V
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_13} :catch_19
    .catchall {:try_start_0 .. :try_end_13} :catchall_22

    .line 271
    :try_start_13
    iget-object v0, p0, Lkorex/activation/DataHandler$1;->val$pos:Ljava/io/PipedOutputStream;

    invoke-virtual {v0}, Ljava/io/PipedOutputStream;->close()V
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_18} :catch_2b

    .line 274
    :goto_18
    return-void

    .line 267
    :catch_19
    move-exception v0

    .line 271
    :try_start_1a
    iget-object v0, p0, Lkorex/activation/DataHandler$1;->val$pos:Ljava/io/PipedOutputStream;

    invoke-virtual {v0}, Ljava/io/PipedOutputStream;->close()V
    :try_end_1f
    .catch Ljava/io/IOException; {:try_start_1a .. :try_end_1f} :catch_20

    goto :goto_18

    .line 272
    :catch_20
    move-exception v0

    goto :goto_18

    .line 270
    :catchall_22
    move-exception v0

    .line 271
    :try_start_23
    iget-object v1, p0, Lkorex/activation/DataHandler$1;->val$pos:Ljava/io/PipedOutputStream;

    invoke-virtual {v1}, Ljava/io/PipedOutputStream;->close()V
    :try_end_28
    .catch Ljava/io/IOException; {:try_start_23 .. :try_end_28} :catch_29

    .line 272
    :goto_28
    throw v0

    :catch_29
    move-exception v1

    goto :goto_28

    :catch_2b
    move-exception v0

    goto :goto_18
.end method
