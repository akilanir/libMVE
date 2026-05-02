.class Lcom/koushikdutta/async/http/HybiParser$5;
.super Ljava/lang/Object;
.source "HybiParser.java"

# interfaces
.implements Lcom/koushikdutta/async/callback/DataCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/async/http/HybiParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/async/http/HybiParser;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 196
    const-class v0, Lcom/koushikdutta/async/http/HybiParser;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/koushikdutta/async/http/HybiParser$5;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method constructor <init>(Lcom/koushikdutta/async/http/HybiParser;)V
    .registers 2
    .param p1, "this$0"    # Lcom/koushikdutta/async/http/HybiParser;

    .prologue
    .line 196
    iput-object p1, p0, Lcom/koushikdutta/async/http/HybiParser$5;->this$0:Lcom/koushikdutta/async/http/HybiParser;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDataAvailable(Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/ByteBufferList;)V
    .registers 6
    .param p1, "emitter"    # Lcom/koushikdutta/async/DataEmitter;
    .param p2, "bb"    # Lcom/koushikdutta/async/ByteBufferList;

    .prologue
    .line 199
    sget-boolean v1, Lcom/koushikdutta/async/http/HybiParser$5;->$assertionsDisabled:Z

    if-nez v1, :cond_16

    invoke-virtual {p2}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v1

    iget-object v2, p0, Lcom/koushikdutta/async/http/HybiParser$5;->this$0:Lcom/koushikdutta/async/http/HybiParser;

    # getter for: Lcom/koushikdutta/async/http/HybiParser;->mLength:I
    invoke-static {v2}, Lcom/koushikdutta/async/http/HybiParser;->access$600(Lcom/koushikdutta/async/http/HybiParser;)I

    move-result v2

    if-eq v1, v2, :cond_16

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 200
    :cond_16
    iget-object v1, p0, Lcom/koushikdutta/async/http/HybiParser$5;->this$0:Lcom/koushikdutta/async/http/HybiParser;

    iget-object v2, p0, Lcom/koushikdutta/async/http/HybiParser$5;->this$0:Lcom/koushikdutta/async/http/HybiParser;

    # getter for: Lcom/koushikdutta/async/http/HybiParser;->mLength:I
    invoke-static {v2}, Lcom/koushikdutta/async/http/HybiParser;->access$600(Lcom/koushikdutta/async/http/HybiParser;)I

    move-result v2

    new-array v2, v2, [B

    # setter for: Lcom/koushikdutta/async/http/HybiParser;->mPayload:[B
    invoke-static {v1, v2}, Lcom/koushikdutta/async/http/HybiParser;->access$702(Lcom/koushikdutta/async/http/HybiParser;[B)[B

    .line 201
    iget-object v1, p0, Lcom/koushikdutta/async/http/HybiParser$5;->this$0:Lcom/koushikdutta/async/http/HybiParser;

    # getter for: Lcom/koushikdutta/async/http/HybiParser;->mPayload:[B
    invoke-static {v1}, Lcom/koushikdutta/async/http/HybiParser;->access$700(Lcom/koushikdutta/async/http/HybiParser;)[B

    move-result-object v1

    invoke-virtual {p2, v1}, Lcom/koushikdutta/async/ByteBufferList;->get([B)V

    .line 203
    :try_start_2c
    iget-object v1, p0, Lcom/koushikdutta/async/http/HybiParser$5;->this$0:Lcom/koushikdutta/async/http/HybiParser;

    # invokes: Lcom/koushikdutta/async/http/HybiParser;->emitFrame()V
    invoke-static {v1}, Lcom/koushikdutta/async/http/HybiParser;->access$800(Lcom/koushikdutta/async/http/HybiParser;)V
    :try_end_31
    .catch Ljava/io/IOException; {:try_start_2c .. :try_end_31} :catch_3d

    .line 209
    :goto_31
    iget-object v1, p0, Lcom/koushikdutta/async/http/HybiParser$5;->this$0:Lcom/koushikdutta/async/http/HybiParser;

    const/4 v2, 0x0

    # setter for: Lcom/koushikdutta/async/http/HybiParser;->mStage:I
    invoke-static {v1, v2}, Lcom/koushikdutta/async/http/HybiParser;->access$502(Lcom/koushikdutta/async/http/HybiParser;I)I

    .line 210
    iget-object v1, p0, Lcom/koushikdutta/async/http/HybiParser$5;->this$0:Lcom/koushikdutta/async/http/HybiParser;

    invoke-virtual {v1}, Lcom/koushikdutta/async/http/HybiParser;->parse()V

    .line 211
    return-void

    .line 205
    :catch_3d
    move-exception v0

    .line 206
    .local v0, "e":Ljava/io/IOException;
    iget-object v1, p0, Lcom/koushikdutta/async/http/HybiParser$5;->this$0:Lcom/koushikdutta/async/http/HybiParser;

    invoke-virtual {v1, v0}, Lcom/koushikdutta/async/http/HybiParser;->report(Ljava/lang/Exception;)V

    .line 207
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_31
.end method
