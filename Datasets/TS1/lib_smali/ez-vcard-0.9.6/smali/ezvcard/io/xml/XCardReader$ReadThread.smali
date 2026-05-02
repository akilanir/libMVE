.class Lezvcard/io/xml/XCardReader$ReadThread;
.super Ljava/lang/Thread;
.source "XCardReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lezvcard/io/xml/XCardReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ReadThread"
.end annotation


# instance fields
.field private volatile closed:Z

.field private volatile finished:Z

.field private final result:Ljavax/xml/transform/sax/SAXResult;

.field private volatile started:Z

.field final synthetic this$0:Lezvcard/io/xml/XCardReader;

.field private final transformer:Ljavax/xml/transform/Transformer;


# direct methods
.method public constructor <init>(Lezvcard/io/xml/XCardReader;)V
    .registers 6

    .prologue
    const/4 v1, 0x0

    .line 200
    iput-object p1, p0, Lezvcard/io/xml/XCardReader$ReadThread;->this$0:Lezvcard/io/xml/XCardReader;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 198
    iput-boolean v1, p0, Lezvcard/io/xml/XCardReader$ReadThread;->finished:Z

    iput-boolean v1, p0, Lezvcard/io/xml/XCardReader$ReadThread;->started:Z

    iput-boolean v1, p0, Lezvcard/io/xml/XCardReader$ReadThread;->closed:Z

    .line 201
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lezvcard/io/xml/XCardReader$ReadThread;->setName(Ljava/lang/String;)V

    .line 205
    :try_start_17
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object v1

    invoke-virtual {v1}, Ljavax/xml/transform/TransformerFactory;->newTransformer()Ljavax/xml/transform/Transformer;

    move-result-object v1

    iput-object v1, p0, Lezvcard/io/xml/XCardReader$ReadThread;->transformer:Ljavax/xml/transform/Transformer;
    :try_end_21
    .catch Ljavax/xml/transform/TransformerConfigurationException; {:try_start_17 .. :try_end_21} :catch_39

    .line 212
    iget-object v1, p0, Lezvcard/io/xml/XCardReader$ReadThread;->transformer:Ljavax/xml/transform/Transformer;

    new-instance v2, Lezvcard/io/xml/XCardReader$ReadThread$1;

    invoke-direct {v2, p0, p1}, Lezvcard/io/xml/XCardReader$ReadThread$1;-><init>(Lezvcard/io/xml/XCardReader$ReadThread;Lezvcard/io/xml/XCardReader;)V

    invoke-virtual {v1, v2}, Ljavax/xml/transform/Transformer;->setErrorListener(Ljavax/xml/transform/ErrorListener;)V

    .line 226
    new-instance v1, Ljavax/xml/transform/sax/SAXResult;

    new-instance v2, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;

    const/4 v3, 0x0

    invoke-direct {v2, p1, v3}, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;-><init>(Lezvcard/io/xml/XCardReader;Lezvcard/io/xml/XCardReader$1;)V

    invoke-direct {v1, v2}, Ljavax/xml/transform/sax/SAXResult;-><init>(Lorg/xml/sax/ContentHandler;)V

    iput-object v1, p0, Lezvcard/io/xml/XCardReader$ReadThread;->result:Ljavax/xml/transform/sax/SAXResult;

    .line 227
    return-void

    .line 206
    :catch_39
    move-exception v0

    .line 208
    .local v0, "e":Ljavax/xml/transform/TransformerConfigurationException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method static synthetic access$000(Lezvcard/io/xml/XCardReader$ReadThread;)Z
    .registers 2
    .param p0, "x0"    # Lezvcard/io/xml/XCardReader$ReadThread;

    .prologue
    .line 195
    iget-boolean v0, p0, Lezvcard/io/xml/XCardReader$ReadThread;->started:Z

    return v0
.end method

.method static synthetic access$100(Lezvcard/io/xml/XCardReader$ReadThread;)Z
    .registers 2
    .param p0, "x0"    # Lezvcard/io/xml/XCardReader$ReadThread;

    .prologue
    .line 195
    iget-boolean v0, p0, Lezvcard/io/xml/XCardReader$ReadThread;->finished:Z

    return v0
.end method

.method static synthetic access$200(Lezvcard/io/xml/XCardReader$ReadThread;)Z
    .registers 2
    .param p0, "x0"    # Lezvcard/io/xml/XCardReader$ReadThread;

    .prologue
    .line 195
    iget-boolean v0, p0, Lezvcard/io/xml/XCardReader$ReadThread;->closed:Z

    return v0
.end method

.method static synthetic access$202(Lezvcard/io/xml/XCardReader$ReadThread;Z)Z
    .registers 2
    .param p0, "x0"    # Lezvcard/io/xml/XCardReader$ReadThread;
    .param p1, "x1"    # Z

    .prologue
    .line 195
    iput-boolean p1, p0, Lezvcard/io/xml/XCardReader$ReadThread;->closed:Z

    return p1
.end method


# virtual methods
.method public run()V
    .registers 6

    .prologue
    const/4 v4, 0x1

    .line 231
    iput-boolean v4, p0, Lezvcard/io/xml/XCardReader$ReadThread;->started:Z

    .line 234
    :try_start_3
    iget-object v1, p0, Lezvcard/io/xml/XCardReader$ReadThread;->transformer:Ljavax/xml/transform/Transformer;

    iget-object v2, p0, Lezvcard/io/xml/XCardReader$ReadThread;->this$0:Lezvcard/io/xml/XCardReader;

    # getter for: Lezvcard/io/xml/XCardReader;->source:Ljavax/xml/transform/Source;
    invoke-static {v2}, Lezvcard/io/xml/XCardReader;->access$400(Lezvcard/io/xml/XCardReader;)Ljavax/xml/transform/Source;

    move-result-object v2

    iget-object v3, p0, Lezvcard/io/xml/XCardReader$ReadThread;->result:Ljavax/xml/transform/sax/SAXResult;

    invoke-virtual {v1, v2, v3}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V
    :try_end_10
    .catch Ljavax/xml/transform/TransformerException; {:try_start_3 .. :try_end_10} :catch_22
    .catchall {:try_start_3 .. :try_end_10} :catchall_46

    .line 240
    iput-boolean v4, p0, Lezvcard/io/xml/XCardReader$ReadThread;->finished:Z

    .line 242
    :try_start_12
    iget-object v1, p0, Lezvcard/io/xml/XCardReader$ReadThread;->this$0:Lezvcard/io/xml/XCardReader;

    # getter for: Lezvcard/io/xml/XCardReader;->readerBlock:Ljava/util/concurrent/BlockingQueue;
    invoke-static {v1}, Lezvcard/io/xml/XCardReader;->access$800(Lezvcard/io/xml/XCardReader;)Ljava/util/concurrent/BlockingQueue;

    move-result-object v1

    iget-object v2, p0, Lezvcard/io/xml/XCardReader$ReadThread;->this$0:Lezvcard/io/xml/XCardReader;

    # getter for: Lezvcard/io/xml/XCardReader;->lock:Ljava/lang/Object;
    invoke-static {v2}, Lezvcard/io/xml/XCardReader;->access$700(Lezvcard/io/xml/XCardReader;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_21
    .catch Ljava/lang/InterruptedException; {:try_start_12 .. :try_end_21} :catch_5b

    .line 247
    :goto_21
    return-void

    .line 235
    :catch_22
    move-exception v0

    .line 236
    .local v0, "e":Ljavax/xml/transform/TransformerException;
    :try_start_23
    iget-object v1, p0, Lezvcard/io/xml/XCardReader$ReadThread;->this$0:Lezvcard/io/xml/XCardReader;

    # getter for: Lezvcard/io/xml/XCardReader;->thread:Lezvcard/io/xml/XCardReader$ReadThread;
    invoke-static {v1}, Lezvcard/io/xml/XCardReader;->access$500(Lezvcard/io/xml/XCardReader;)Lezvcard/io/xml/XCardReader$ReadThread;

    move-result-object v1

    iget-boolean v1, v1, Lezvcard/io/xml/XCardReader$ReadThread;->closed:Z

    if-nez v1, :cond_32

    .line 237
    iget-object v1, p0, Lezvcard/io/xml/XCardReader$ReadThread;->this$0:Lezvcard/io/xml/XCardReader;

    # setter for: Lezvcard/io/xml/XCardReader;->thrown:Ljavax/xml/transform/TransformerException;
    invoke-static {v1, v0}, Lezvcard/io/xml/XCardReader;->access$602(Lezvcard/io/xml/XCardReader;Ljavax/xml/transform/TransformerException;)Ljavax/xml/transform/TransformerException;
    :try_end_32
    .catchall {:try_start_23 .. :try_end_32} :catchall_46

    .line 240
    :cond_32
    iput-boolean v4, p0, Lezvcard/io/xml/XCardReader$ReadThread;->finished:Z

    .line 242
    :try_start_34
    iget-object v1, p0, Lezvcard/io/xml/XCardReader$ReadThread;->this$0:Lezvcard/io/xml/XCardReader;

    # getter for: Lezvcard/io/xml/XCardReader;->readerBlock:Ljava/util/concurrent/BlockingQueue;
    invoke-static {v1}, Lezvcard/io/xml/XCardReader;->access$800(Lezvcard/io/xml/XCardReader;)Ljava/util/concurrent/BlockingQueue;

    move-result-object v1

    iget-object v2, p0, Lezvcard/io/xml/XCardReader$ReadThread;->this$0:Lezvcard/io/xml/XCardReader;

    # getter for: Lezvcard/io/xml/XCardReader;->lock:Ljava/lang/Object;
    invoke-static {v2}, Lezvcard/io/xml/XCardReader;->access$700(Lezvcard/io/xml/XCardReader;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_43
    .catch Ljava/lang/InterruptedException; {:try_start_34 .. :try_end_43} :catch_44

    goto :goto_21

    .line 243
    :catch_44
    move-exception v1

    goto :goto_21

    .line 240
    .end local v0    # "e":Ljavax/xml/transform/TransformerException;
    :catchall_46
    move-exception v1

    iput-boolean v4, p0, Lezvcard/io/xml/XCardReader$ReadThread;->finished:Z

    .line 242
    :try_start_49
    iget-object v2, p0, Lezvcard/io/xml/XCardReader$ReadThread;->this$0:Lezvcard/io/xml/XCardReader;

    # getter for: Lezvcard/io/xml/XCardReader;->readerBlock:Ljava/util/concurrent/BlockingQueue;
    invoke-static {v2}, Lezvcard/io/xml/XCardReader;->access$800(Lezvcard/io/xml/XCardReader;)Ljava/util/concurrent/BlockingQueue;

    move-result-object v2

    iget-object v3, p0, Lezvcard/io/xml/XCardReader$ReadThread;->this$0:Lezvcard/io/xml/XCardReader;

    # getter for: Lezvcard/io/xml/XCardReader;->lock:Ljava/lang/Object;
    invoke-static {v3}, Lezvcard/io/xml/XCardReader;->access$700(Lezvcard/io/xml/XCardReader;)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_58
    .catch Ljava/lang/InterruptedException; {:try_start_49 .. :try_end_58} :catch_59

    .line 245
    :goto_58
    throw v1

    .line 243
    :catch_59
    move-exception v2

    goto :goto_58

    :catch_5b
    move-exception v1

    goto :goto_21
.end method
