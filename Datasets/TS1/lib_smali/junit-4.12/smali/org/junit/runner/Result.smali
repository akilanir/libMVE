.class public Lorg/junit/runner/Result;
.super Ljava/lang/Object;
.source "Result.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/junit/runner/Result$1;,
        Lorg/junit/runner/Result$SerializedForm;,
        Lorg/junit/runner/Result$Listener;
    }
.end annotation


# static fields
.field private static final serialPersistentFields:[Ljava/io/ObjectStreamField;

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final count:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final failures:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList",
            "<",
            "Lorg/junit/runner/notification/Failure;",
            ">;"
        }
    .end annotation
.end field

.field private final ignoreCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final runTime:Ljava/util/concurrent/atomic/AtomicLong;

.field private serializedForm:Lorg/junit/runner/Result$SerializedForm;

.field private final startTime:Ljava/util/concurrent/atomic/AtomicLong;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 27
    const-class v0, Lorg/junit/runner/Result$SerializedForm;

    invoke-static {v0}, Ljava/io/ObjectStreamClass;->lookup(Ljava/lang/Class;)Ljava/io/ObjectStreamClass;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/ObjectStreamClass;->getFields()[Ljava/io/ObjectStreamField;

    move-result-object v0

    sput-object v0, Lorg/junit/runner/Result;->serialPersistentFields:[Ljava/io/ObjectStreamField;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lorg/junit/runner/Result;->count:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 40
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lorg/junit/runner/Result;->ignoreCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 41
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lorg/junit/runner/Result;->failures:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 42
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/junit/runner/Result;->runTime:Ljava/util/concurrent/atomic/AtomicLong;

    .line 43
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/junit/runner/Result;->startTime:Ljava/util/concurrent/atomic/AtomicLong;

    .line 44
    return-void
.end method

.method private constructor <init>(Lorg/junit/runner/Result$SerializedForm;)V
    .registers 5
    .param p1, "serializedForm"    # Lorg/junit/runner/Result$SerializedForm;

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    # getter for: Lorg/junit/runner/Result$SerializedForm;->fCount:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {p1}, Lorg/junit/runner/Result$SerializedForm;->access$000(Lorg/junit/runner/Result$SerializedForm;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v0

    iput-object v0, p0, Lorg/junit/runner/Result;->count:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 48
    # getter for: Lorg/junit/runner/Result$SerializedForm;->fIgnoreCount:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {p1}, Lorg/junit/runner/Result$SerializedForm;->access$100(Lorg/junit/runner/Result$SerializedForm;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v0

    iput-object v0, p0, Lorg/junit/runner/Result;->ignoreCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 49
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    # getter for: Lorg/junit/runner/Result$SerializedForm;->fFailures:Ljava/util/List;
    invoke-static {p1}, Lorg/junit/runner/Result$SerializedForm;->access$200(Lorg/junit/runner/Result$SerializedForm;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lorg/junit/runner/Result;->failures:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 50
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    # getter for: Lorg/junit/runner/Result$SerializedForm;->fRunTime:J
    invoke-static {p1}, Lorg/junit/runner/Result$SerializedForm;->access$300(Lorg/junit/runner/Result$SerializedForm;)J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v0, p0, Lorg/junit/runner/Result;->runTime:Ljava/util/concurrent/atomic/AtomicLong;

    .line 51
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    # getter for: Lorg/junit/runner/Result$SerializedForm;->fStartTime:J
    invoke-static {p1}, Lorg/junit/runner/Result$SerializedForm;->access$400(Lorg/junit/runner/Result$SerializedForm;)J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v0, p0, Lorg/junit/runner/Result;->startTime:Ljava/util/concurrent/atomic/AtomicLong;

    .line 52
    return-void
.end method

.method static synthetic access$500(Lorg/junit/runner/Result;)Ljava/util/concurrent/atomic/AtomicLong;
    .registers 2
    .param p0, "x0"    # Lorg/junit/runner/Result;

    .prologue
    .line 25
    iget-object v0, p0, Lorg/junit/runner/Result;->startTime:Ljava/util/concurrent/atomic/AtomicLong;

    return-object v0
.end method

.method static synthetic access$600(Lorg/junit/runner/Result;)Ljava/util/concurrent/atomic/AtomicLong;
    .registers 2
    .param p0, "x0"    # Lorg/junit/runner/Result;

    .prologue
    .line 25
    iget-object v0, p0, Lorg/junit/runner/Result;->runTime:Ljava/util/concurrent/atomic/AtomicLong;

    return-object v0
.end method

.method static synthetic access$700(Lorg/junit/runner/Result;)Ljava/util/concurrent/atomic/AtomicInteger;
    .registers 2
    .param p0, "x0"    # Lorg/junit/runner/Result;

    .prologue
    .line 25
    iget-object v0, p0, Lorg/junit/runner/Result;->count:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object v0
.end method

.method static synthetic access$800(Lorg/junit/runner/Result;)Ljava/util/concurrent/CopyOnWriteArrayList;
    .registers 2
    .param p0, "x0"    # Lorg/junit/runner/Result;

    .prologue
    .line 25
    iget-object v0, p0, Lorg/junit/runner/Result;->failures:Ljava/util/concurrent/CopyOnWriteArrayList;

    return-object v0
.end method

.method static synthetic access$900(Lorg/junit/runner/Result;)Ljava/util/concurrent/atomic/AtomicInteger;
    .registers 2
    .param p0, "x0"    # Lorg/junit/runner/Result;

    .prologue
    .line 25
    iget-object v0, p0, Lorg/junit/runner/Result;->ignoreCount:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object v0
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 3
    .param p1, "s"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 103
    invoke-static {p1}, Lorg/junit/runner/Result$SerializedForm;->deserialize(Ljava/io/ObjectInputStream;)Lorg/junit/runner/Result$SerializedForm;

    move-result-object v0

    iput-object v0, p0, Lorg/junit/runner/Result;->serializedForm:Lorg/junit/runner/Result$SerializedForm;

    .line 104
    return-void
.end method

.method private readResolve()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 107
    new-instance v0, Lorg/junit/runner/Result;

    iget-object v1, p0, Lorg/junit/runner/Result;->serializedForm:Lorg/junit/runner/Result$SerializedForm;

    invoke-direct {v0, v1}, Lorg/junit/runner/Result;-><init>(Lorg/junit/runner/Result$SerializedForm;)V

    return-object v0
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .registers 3
    .param p1, "s"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 97
    new-instance v0, Lorg/junit/runner/Result$SerializedForm;

    invoke-direct {v0, p0}, Lorg/junit/runner/Result$SerializedForm;-><init>(Lorg/junit/runner/Result;)V

    .line 98
    .local v0, "serializedForm":Lorg/junit/runner/Result$SerializedForm;
    invoke-virtual {v0, p1}, Lorg/junit/runner/Result$SerializedForm;->serialize(Ljava/io/ObjectOutputStream;)V

    .line 99
    return-void
.end method


# virtual methods
.method public createListener()Lorg/junit/runner/notification/RunListener;
    .registers 3

    .prologue
    .line 148
    new-instance v0, Lorg/junit/runner/Result$Listener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/junit/runner/Result$Listener;-><init>(Lorg/junit/runner/Result;Lorg/junit/runner/Result$1;)V

    return-object v0
.end method

.method public getFailureCount()I
    .registers 2

    .prologue
    .line 65
    iget-object v0, p0, Lorg/junit/runner/Result;->failures:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getFailures()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/junit/runner/notification/Failure;",
            ">;"
        }
    .end annotation

    .prologue
    .line 79
    iget-object v0, p0, Lorg/junit/runner/Result;->failures:Ljava/util/concurrent/CopyOnWriteArrayList;

    return-object v0
.end method

.method public getIgnoreCount()I
    .registers 2

    .prologue
    .line 86
    iget-object v0, p0, Lorg/junit/runner/Result;->ignoreCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    return v0
.end method

.method public getRunCount()I
    .registers 2

    .prologue
    .line 58
    iget-object v0, p0, Lorg/junit/runner/Result;->count:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    return v0
.end method

.method public getRunTime()J
    .registers 3

    .prologue
    .line 72
    iget-object v0, p0, Lorg/junit/runner/Result;->runTime:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method public wasSuccessful()Z
    .registers 2

    .prologue
    .line 93
    invoke-virtual {p0}, Lorg/junit/runner/Result;->getFailureCount()I

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method
